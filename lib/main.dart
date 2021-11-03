import 'package:flutter/material.dart';
import 'package:hearify_it/pages/page_root.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    ),
  );
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        primaryColor: Colors.deepPurpleAccent,
        dividerColor: Colors.white.withOpacity(0.6),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 20, fontFamily: 'Hind'),
          caption: TextStyle(fontSize: 10, fontStyle: FontStyle.italic,color: Colors.white),
          bodyText1: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        ),
      ),
      home: const RootApp(),
    ),
  );
}
