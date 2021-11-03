import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidthBox extends StatelessWidget {
  final double length;

  const WidthBox(this.length, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: length);
  }
}

class HeightBox extends StatelessWidget {
  final double length;
  const HeightBox(this.length, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: length);
  }
}

class BrowseBar extends StatelessWidget {
  const BrowseBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const WidthBox(7.5),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 15,
            decoration: const BoxDecoration(
              color: Colors.white60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                WidthBox(7.5),
                Text(
                  "Search music",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
