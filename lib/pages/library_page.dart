import 'package:flutter/material.dart';
import 'package:hearify_it/widgets/boxes.dart';
import 'package:hearify_it/widgets/tabBar_album.dart';
import 'package:hearify_it/widgets/tabBar_artists.dart';
import 'package:hearify_it/widgets/tabBar_playlists.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({Key? key}) : super(key: key);

  @override
  MyLibraryPageState createState() => MyLibraryPageState();
}

class MyLibraryPageState extends State<MyLibraryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, initialIndex: 0, length: 3)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Container tabBar = Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: TabBar(
        controller: tabController,
        tabs: const [
          Tab(
            text: 'Playlists',
          ),
          Tab(
            text: 'Artists',
          ),
          Tab(
            text: 'Albums',
          ),
        ],
      ),
    );

    Container tabBarView = Container(
      height: MediaQuery.of(context).size.height,
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          PlaylistTabBar(),
          ArtistTabBar(),
          const AlbumTabBar(),
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const HeightBox(25),
            tabBar,
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: tabBarView,
            ),
          ],
        ),
      ),
    );
  }
}
