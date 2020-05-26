import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_tmdb_app/src/commons/constants.dart';
import 'package:movie_tmdb_app/src/models/media.dart';

class HttpHandler{
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  Future<dynamic> getJson(Uri uri) async{
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies(){
    var uri = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key' : apiKey,
      'page' : '1',
      'language' : _language
    });
    print(uri);
    return getJson(uri).then((data) =>
      data['results'].map<Media>((item) => Media(item)).toList()
    );
  }
}