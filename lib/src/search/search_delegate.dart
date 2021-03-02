import 'package:flutter/material.dart';

import 'package:movie_billboard/src/models/movie_model.dart';
import 'package:movie_billboard/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final peliculasProvider = new MoviesProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
    'Superman',
    'Ironman 2',
    'Ironman 3',
    'Ironman 4',
    'Ironman 5',
  ];

  final peliculasRecientes = ['Spiderman', 'Capitan America'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;

          return ListView(
              children: movies.map((movie) {
            return ListTile(
              leading: FadeInImage(
                image: NetworkImage(movie.getPosterImage()),
                placeholder: AssetImage('assets/img/loading.gif'),
                width: 50.0,
                fit: BoxFit.contain,
              ),
              title: Text(movie.title),
              subtitle: Text(movie.originalTitle),
              onTap: () {
                close(context, null);
                movie.uniqueId = '';
                Navigator.pushNamed(context, 'details', arguments: movie);
              },
            );
          }).toList());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
