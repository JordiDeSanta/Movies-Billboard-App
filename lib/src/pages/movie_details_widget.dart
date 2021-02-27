import 'package:flutter/material.dart';

import 'package:movie_billboard/src/models/movie_model.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _createAppBar(movie),
        ],
      ),
    );
  }

  Widget _createAppBar(Movie m) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.deepOrange,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          m.title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(m.getBgImage()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
