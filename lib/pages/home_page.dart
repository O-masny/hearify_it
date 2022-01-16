import 'package:flutter/material.dart';
import 'package:hearify_it/pages/library_page.dart';
import 'package:hearify_it/providers/authorization_api.dart';
import 'package:hearify_it/widgets/genre_album_template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: GenreAlbumTemplate(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Explore",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyLibraryPage(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
