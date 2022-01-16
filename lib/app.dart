import 'package:flutter/material.dart';
import 'package:hearify_it/pages/home_page.dart';
import 'package:hearify_it/pages/login_ui.dart';
import 'package:hearify_it/pages/wait_screen.dart';
import 'package:hearify_it/splash_screen/splash_screen.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        accentColor: Colors.green,
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginScreen(),
        '/home': (BuildContext context) => const HomePage(),
        '/splash': (BuildContext context) => const SplashScreen(),
        //'/tracks': (BuildContext context) => const TracksScreen(),
        '/wait': (BuildContext context) =>  WaitScreen(),
      },
    );
  }
}