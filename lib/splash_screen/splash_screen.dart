import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hearify_it/pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        onClick: Future.delayed(
          Duration.zero,
          () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
          },
        ),
        seconds: 4,
        title: const Text('Welcome In SplashScreen'),
        image: Image.network(
            'https://flutter.io/images/catalog-widget-placeholder.png'),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        loaderColor: Colors.red,
        pageRoute: _createRoute());
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
