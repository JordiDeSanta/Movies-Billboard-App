import 'package:flutter/material.dart';

import 'package:movie_billboard/src/models/movie_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;
  MovieHorizontal({Key key, @required this.movies, @required this.nextPage})
      : super(key: key);

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.21,
      child: PageView(
        controller: _pageController,
        children: _cards(context, _screenSize),
      ),
    );
  }

  List<Widget> _cards(BuildContext context, Size screenSize) {
    return movies.map((movie) {
      return Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: AssetImage("assets/img/loading.gif"),
                image: NetworkImage(movie.getPosterImage()),
                fit: BoxFit.cover,
                height: screenSize.height * 0.186,
                width: screenSize.width * 0.3,
              ),
            ),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.caption,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }).toList();
  }
}
