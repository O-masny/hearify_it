import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1.0, color: Colors.deepPurpleAccent),
          ),
          child: getFooter()),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
        alignment: AlignmentDirectional.bottomEnd,
        index: activeTab,
        children: const [
          HomePage(),
          Center(
              child: Text("Search",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold))),
          Center(
              child: Text("Book",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold))),
          Center(
              child: Text("Settings",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                      fontWeight: FontWeight.bold))),
        ]);
  }

  Widget getFooter() {
    List items = <IconData>[
      (Icons.home),
      (Icons.search),
      (Icons.book),
      (Icons.settings)
    ];
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            items.length,
            (index) {
              return IconButton(
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  },
                  icon: Icon(items[index],
                      color: activeTab == index
                          ? Colors.deepPurpleAccent
                          : Colors.white60));
            },
          ),
        ),
      ),
    );
  }
}
