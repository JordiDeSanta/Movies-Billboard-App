import 'package:movie_billboard/src/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProvider {
  String _apiKey = '3fa4d3acdcb3691743e982acc21c96c6';
  String _url = 'api.themoviedb.org';
  String _lang = 'en_US';

  Future<List<Movie>> getSomeWithPath(String path) async {
    final url = Uri.https(_url, path, {
      'api_key': _apiKey,
      'language': _lang,
    });

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.items;
  }

  Future<List<Movie>> getPopular() async {
    return getSomeWithPath('3/movie/popular');
  }

  Future<List<Movie>> getNowPlaying() async {
    return getSomeWithPath('3/movie/now_playing');
  }
}
