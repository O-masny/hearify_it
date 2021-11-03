import 'package:flutter/cupertino.dart';
import 'package:flutter_control/core.dart';
import 'package:flutter_icons/flutter_icons.dart';


PreferredSizeWidget appbarMusicDetail() => AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    actions: [
      IconButton(
        icon: const Icon(Feather.more_vertical, color: Colors.white60),
        onPressed: () {},
      )
    ],
  );
