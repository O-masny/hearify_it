import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_control/core.dart';
import 'package:hearify_it/assets/spotify_json.dart';

import 'boxes.dart';
import 'catalog_album_template.dart';

class GenreAlbumTemplate extends StatelessWidget {
  var activeMenu;
  GenreAlbumTemplate({this.activeMenu, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: List.generate(
                      song_type_1.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 25.0, top: 15),
                        child: GestureDetector(
                          onTap: () {
                            activeMenu = index;
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song_type_1[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: activeMenu == index
                                        ? Colors.deepPurpleAccent
                                        : Colors.grey),
                              ),
                              const HeightBox(5.0),
                              activeMenu == index
                                  ? Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const HeightBox(40),
              CatalogAlbumTemplate(
                  songs.first['title'], songs.first['description']),
              const HeightBox(40),
              CatalogAlbumTemplate(songs[1]['title'], songs[1]['description']),
            ],
          ),
        ],
      ),
    );
  }
}
