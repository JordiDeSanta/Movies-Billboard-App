import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_billboard/src/models/actor_model.dart';
import 'package:movie_billboard/src/models/movie_model.dart';

class MoviesProvider {
  String _apiKey = '3fa4d3acdcb3691743e982acc21c96c6';
  String _url = 'api.themoviedb.org';
  String _lang = 'en_US';

  int _popularPage = 0;
  bool bIsLoading = false;

  List<Movie> _populars = new List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularsSink => _popularsStreamController.sink.add;

  Stream<List<Movie>> get popularsStream => _popularsStreamController.stream;

  void disposeStreams() {
    _popularsStreamController?.close();
  }

  Future<List<Actor>> getCast(String mID) async {
    final url = Uri.https(_url, '3/movie/$mID/credits', {
      'api_key': _apiKey,
      'language': _lang,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.actors;
  }

  Future<List<Movie>> getSomeWithPath(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.items;
  }

  Future<List<Movie>> getPopular() async {
    if (bIsLoading) {
      return [];
    }

    bIsLoading = true;
    _popularPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _lang,
      'page': _popularPage.toString(),
    });

    final resp = await getSomeWithPath(url);

    _populars.addAll(resp);
    popularsSink(_populars);

    bIsLoading = false;

    return resp;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _lang,
    });

    final resp = await getSomeWithPath(url);

    return resp;
  }
}
