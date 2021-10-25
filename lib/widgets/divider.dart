import 'package:flutter/material.dart';

class PDivider extends StatelessWidget {
  const PDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: Colors.white.withOpacity(0.5));
  }
}
