import 'dart:core';
import 'package:flutter/material.dart';
import 'package:hearify_it/widgets/appbar_music_detail.dart';
import 'package:hearify_it/widgets/boxes.dart';

class MusicDetailPage extends StatefulWidget {
  final String? title;
  final String? img;
  final String? description;

  const MusicDetailPage({Key? key, this.title, this.img, this.description})
      : super(key: key);

  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  double _currentSlider = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appbarMusicDetail(),
        body: getBody(widget.img!));
  }

  Widget getBody(String img) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: (Container(
                width: size.width - 100,
                height: size.width - 100,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.indigoAccent,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: Offset(-10, 40))
                  ],
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(img),
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: (Container(
                width: size.width - 60,
                height: size.width - 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.img!), fit: BoxFit.cover),
                ),
              )),
            ),
          ]),
          const HeightBox(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: size.width - 80,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.add_circle_outline_rounded,
                      color: Colors.white60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.title!,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 150,
                        child: Center(
                          child: Text(
                            widget.description!,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: Colors.white)
                ],
              ),
            ),
          ),
          const HeightBox(10),
          Slider(
            value: _currentSlider,
            min: 0,
            max: 200,
            onChanged: (double value) {
              setState(() {
                _currentSlider = value;
              });
            },
          ),
          const HeightBox(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("",
                    style: TextStyle(color: Colors.white.withOpacity(0.5))),
                Text("",
                    style: TextStyle(color: Colors.white.withOpacity(0.5))),
              ],
            ),
          ),
          const HeightBox(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.shuffle,
                      color: Colors.white.withOpacity(0.4), size: 25),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.arrow_left_sharp,
                      color: Colors.white.withOpacity(0.4), size: 25),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepPurpleAccent),
                    child: const Center(
                      child: Icon(Icons.control_camera,
                          size: 28, color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right_sharp,
                      color: Colors.white.withOpacity(0.4), size: 25),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.play_arrow,
                      color: Colors.white.withOpacity(0.4), size: 25),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const HeightBox(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.tv, color: Colors.deepPurpleAccent, size: 20)
            ],
          )
        ],
      ),
    );
  }
}
