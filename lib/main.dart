import 'package:flutter/material.dart';

import 'package:movie_billboard/src/pages/actor_details_page.dart';
import 'package:movie_billboard/src/pages/home_page.dart';
import 'package:movie_billboard/src/pages/movie_details_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cinema Billboard',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'details': (BuildContext context) => MovieDetails(),
        'actor': (BuildContext context) => ActorDetails(),
      },
    );
  }
}
