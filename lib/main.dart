import 'package:flutter/material.dart';
import 'package:hearify_it/pages/home_page.dart';
import 'package:hearify_it/pages/login_ui.dart';
import 'package:hearify_it/pages/page_root.dart';
import 'package:hearify_it/pages/wait_screen.dart';
import 'package:splashscreen/splashscreen.dart';

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
          caption: TextStyle(
              fontSize: 10, fontStyle: FontStyle.italic, color: Colors.white),
          bodyText1: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        ),
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/home': (BuildContext context) => const HomePage(),
        '/splash': (BuildContext context) => new SplashScreen(),
        // '/tracks': (BuildContext context) => new TracksScreen(),
        '/wait': (BuildContext context) => new WaitScreen(),
      },
    ),
  );
}
