import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hearify_it/widgets/boxes.dart';

class MusicDetailPage extends StatefulWidget {
  final String? title;
  final String? description;
  final Color? color;
  final String? img;
  final String? songUrl;
  const MusicDetailPage(
      {Key? key,
      this.title,
      this.description,
      this.color,
      this.img,
      this.songUrl})
      : super(key: key);

  @override
  _MusicDetailPageState createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  double _currentSlider = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black, appBar: getAppBar(), body: getBody());
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Feather.more_vertical, color: Colors.white60),
          onPressed: () {},
        )
      ],
    );
  }

  Widget getBody() {
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
                  boxShadow: [
                    BoxShadow(
                        color: widget.color!,
                        blurRadius: 50,
                        spreadRadius: 5,
                        offset: const Offset(-10, 40))
                  ],
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.img!), fit: BoxFit.cover),
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
                      image: AssetImage(widget.img!), fit: BoxFit.cover),
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
                        child: Text(
                          widget.description!,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white.withOpacity(0.5),
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
                  icon: Icon(Icons.skip_previous,
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
                  icon: Icon(Icons.skip_next,
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
            children: [
              Icon(Icons.tv, color: Colors.deepPurpleAccent, size: 20)
            ],
          )
        ],
      ),
    );
  }
}
