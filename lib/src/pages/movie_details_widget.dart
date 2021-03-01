import 'package:flutter/material.dart';

import 'package:movie_billboard/src/models/actor_model.dart';
import 'package:movie_billboard/src/models/movie_model.dart';
import 'package:movie_billboard/src/providers/movies_provider.dart';

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
                SizedBox(height: 80),
                _createCasting(movie),
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

  Widget _createCasting(Movie m) {
    final movieProvider = new MoviesProvider();

    return FutureBuilder(
      future: movieProvider.getCast(m.id.toString()),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _createActorsPageView(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _createActorsPageView(List<Actor> actors) {
    return Container(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1,
        ),
        itemCount: actors.length,
        itemBuilder: (context, i) {
          return _createActorCard(actors[i]);
        },
      ),
    );
  }

  Widget _createActorCard(Actor a) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/img/loading.gif'),
              image: NetworkImage(a.getPhoto()),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            a.name,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
