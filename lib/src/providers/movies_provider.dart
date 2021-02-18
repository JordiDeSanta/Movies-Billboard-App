import 'package:movie_billboard/src/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProvider {
  String _apiKey = '3fa4d3acdcb3691743e982acc21c96c6';
  String _url = 'api.themoviedb.org';
  String _lang = 'es_ES';

  Future<List<Movie>> getInBillboard() async {
    final url = Uri.https(_url, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _lang,
    });

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.items;
  }
}
