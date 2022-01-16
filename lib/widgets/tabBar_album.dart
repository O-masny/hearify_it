import 'package:flutter/material.dart';

class AlbumTabBar extends StatefulWidget {
  const AlbumTabBar({Key? key}) : super(key: key);

  @override
  AlbumTabBarState createState() => AlbumTabBarState();
}

class AlbumTabBarState extends State<AlbumTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: const Center(
        child: Text("Albums"),
      ),
    );
  }
}