import 'package:flutter/cupertino.dart';

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
