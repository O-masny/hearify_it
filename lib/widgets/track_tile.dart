import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackTile extends StatelessWidget {
  final bool isPlaying;
  final String image;
  final String track;
  final String author;
  const TrackTile(this.isPlaying, this.image, this.track, this.author,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      //TODO GLOBAL
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            height: 40,
            width: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                author,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                track,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 10),
              ),
            ],
          ),
          (isPlaying)
              ? IconButton(
                  iconSize: 28,
                  alignment: Alignment.center,
                  onPressed: () {},
                  icon: Icon(
                    Icons.stop_circle,
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
              : IconButton(
                  iconSize: 28,
                  alignment: Alignment.center,
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
        ],
      ),
    );
  }
}
