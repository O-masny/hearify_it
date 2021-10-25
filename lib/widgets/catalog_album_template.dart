import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_control/core.dart';
import 'package:hearify_it/assets/spotify_json.dart';

class CatalogAlbumTemplate extends StatelessWidget {
  var activeMenu;
  CatalogAlbumTemplate({this.activeMenu, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        songs[index]['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Text(
                        songs[index]['description'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
