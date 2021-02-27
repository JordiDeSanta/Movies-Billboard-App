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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _printMovie(context, movie),
                _printDescription(context, movie),
              ],
            ),
          ),
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
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage(m.getBgImage()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _printDescription(BuildContext context, Movie m) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        m.overview,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _printMovie(BuildContext context, Movie m) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(m.getPosterImage()),
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  m.title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Text(m.voteAverage.toString()),
                    Text('  (' + m.voteCount.toString() + ')  '),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
