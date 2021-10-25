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
        primaryColor: Colors.deepPurpleAccent,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 20, fontFamily: 'Hind'),
          caption: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
