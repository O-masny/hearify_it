import 'package:flutter/material.dart';
import 'package:hearify_it/entities/entity_playlist.dart';
import 'package:hearify_it/services/playlist.dart';

class PlaylistTabBar extends StatefulWidget {
  PlaylistTabBarState createState() => PlaylistTabBarState();
}

class PlaylistTabBarState extends State<PlaylistTabBar> {
  void initState() {
    // TODO: implement initState
    super.initState();
    playlistBloc.fetchPlaylistList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: playlistBloc.playlistList as dynamic,
      builder: (context, AsyncSnapshot<ListPlaylistModel>? snapshot) {
        if ((snapshot?.hasData ?? false) && snapshot != null) {
          return ListView.builder(
            itemExtent: 75,
            itemCount: snapshot.data!.total! >= 20 ? 20 : snapshot.data!.total,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(snapshot
                        .data!.items![index].images!.isNotEmpty
                    ? snapshot.data!.items![index].images![0].url!
                    : "https://cdn.pixabay.com/photo/2012/04/23/15/46/question-38629_960_720.png"),
                title: Text("${snapshot.data!.items![index].name}"),
                subtitle: Text("de ${snapshot.data!.items![index].owner!.id}"),
                onTap: () {
                  Navigator.pushNamed(context, "/tracks",
                      arguments: <String, Playlist>{
                        'playlist': snapshot.data!.items![index],
                      });
                },
              );
            },
          );
        } else if (snapshot?.hasError ?? false) {
          return Text(snapshot!.error.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
