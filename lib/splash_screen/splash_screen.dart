import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hearify_it/providers/authorization_api.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shared_Preferences();
  }

  void shared_Preferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? logged = prefs.getBool('logged');
    String? token = prefs.getString('token');

    print("LOGGED: $logged");
    if (token != null && token.isNotEmpty) {
      try {
        await Api().requestBearerToken(token);
      } catch (e) {
        if (e is Exception && e.toString().contains('InvalidAuth')) {
          _proceedWithLogin();
        }
      }

      Timer(const Duration(seconds: 5),
          () => Navigator.pushReplacementNamed(context, "/home"));
    } else {
      Timer(const Duration(seconds: 10), _proceedWithLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Container(
            decoration: const BoxDecoration(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Hearify it",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 40,
                    endIndent: 40,
                  ),
                  Text(
                    "Welcome back",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Future<void> _proceedWithLogin() async {
    await Navigator.pushNamed(context, "/login");
    if (Api().isLogged) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {}
  }
}
