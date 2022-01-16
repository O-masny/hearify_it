import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hearify_it/entities/entity_playlist.dart';
import 'package:hearify_it/entities/entity_track.dart';
import 'package:hearify_it/services/playlist.dart';
import 'package:url_launcher/url_launcher.dart';

import 'music_detail_page.dart';

class TracksScreen extends StatefulWidget {
  const TracksScreen({Key? key}) : super(key: key);

  @override
  _TracksScreenState createState() => _TracksScreenState();
}

class _TracksScreenState extends State<TracksScreen> {
  late Playlist _playlist;
  AudioPlayer audioPlayer = AudioPlayer();
  bool sound = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playlist = null as Playlist;
  }

  play(String url) async {
    audioPlayer.play(url);
  }

  _launchURL(urlParameter) async {
    String url = urlParameter.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo ir a $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    if (arguments != null) {
      _playlist = arguments['playlist'] as Playlist;
      playlistBloc.fetchTracksList(_playlist.tracks!.href.toString());
    }

    SliverAppBar sliverAppBar = SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: Text("${_playlist.name}"),
        background: Stack(
          alignment: Alignment.center,
          //fit: StackFit.expand,
          children: [
            Image.network(
              "${_playlist.images!.isNotEmpty ? _playlist.images![0].url : "https://cdn.pixabay.com/photo/2012/04/23/15/46/question-38629_960_720.png"}",
              height: 180,
              //fit: BoxFit.cover,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment(0.0, 0.0),
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    _sliverList(AsyncSnapshot<TracksPlaylistModel> snapshot) {
      SliverList sliverList = SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    label: 'Open Spotify',
                    foregroundColor: Colors.black45,
                    icon: Icons.play_circle_outline,
                    onPressed: (BuildContext context) {
                      _launchURL(snapshot
                          .data?.items![index].track?.externalUrls!.spotify);
                    },
                  ),
                ],
              ),
              child: Container(
                //color: Theme.of(context).primaryColor,
                color: Colors.black54,
                child: ListTile(
                  leading: Image.network(snapshot
                          .data!.items![index].track!.album!.images!.isNotEmpty
                      ? snapshot
                          .data!.items![index].track!.album!.images![0].url!
                      : "https://cdn.pixabay.com/photo/2012/04/23/15/46/question-38629_960_720.png"),
                  title: Text("${snapshot.data?.items![index].track?.name}"),
                  subtitle: Text(
                      "${snapshot.data!.items![index].track!.artists![0].name}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicDetailPage(
                          title: "${snapshot.data?.items![index].track?.name}",
                          img: snapshot.data!.items![index].track!.album!
                              .images![0].url!,
                          description: snapshot
                              .data!.items![index].track!.artists![0].name,
                        ),
                      ),
                    );
                    play(snapshot.data!.items![index].track!.previewUrl!);
                  },
                ),
              ),
            );
          },
          childCount: snapshot.data?.total,
        ),
      );
      return sliverList;
    }

    _scaffold(AsyncSnapshot<TracksPlaylistModel> snapshot) {
      Scaffold scaffold = Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[sliverAppBar, _sliverList(snapshot)],
        ),
      );
      return scaffold;
    }

    return StreamBuilder(
      stream: playlistBloc.tracksList as dynamic,
      builder: (context, AsyncSnapshot<TracksPlaylistModel> snapshot) {
        if (snapshot.hasData) {
          return _scaffold(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
