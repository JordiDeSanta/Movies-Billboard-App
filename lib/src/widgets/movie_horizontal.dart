import 'package:flutter/material.dart';

import 'package:movie_billboard/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  const MovieHorizontal({Key key, @required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _cards(context, _screenSize),
      ),
    );
  }

  List<Widget> _cards(BuildContext context, Size screenSize) {
    return movies.map((movie) {
      return Container(
        margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: AssetImage("assets/img/loading.gif"),
                image: NetworkImage(movie.getPosterImage()),
                fit: BoxFit.cover,
                width: screenSize.width * 0.3,
                height: screenSize.height * 0.186,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
