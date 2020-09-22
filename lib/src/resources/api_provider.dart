import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_tmdb_app/src/commons/constants.dart';
import 'package:movie_tmdb_app/src/models/cast.dart';
import 'package:movie_tmdb_app/src/models/media.dart';
import 'package:movie_tmdb_app/src/resources/resource_provider.dart';
import '../commons/media_provider.dart';

class ApiProvider implements ResourceProvider{
  static final _httpHandler = new ApiProvider();
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  static ApiProvider get(){
    return _httpHandler;
  }

  Future<dynamic> getJson(Uri uri) async{
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies({String category : "populares"}) async {
    var uri = Uri.https(_baseUrl, '3/movie/$category', {
      'api_key' : apiKey,
      'page' : '1',
      'language' : _language
    });
    print(uri);
    return getJson(uri).then((data) =>
      data['results'].map<Media>((item) => Media(item, MediaType.movie)).toList()
    );
  }

  Future<List<Media>> fetchShow({String category : "populares"}) async {
    var uri = Uri.https(_baseUrl, '3/tv/$category', {
      'api_key' : apiKey,
      'page' : '1',
      'language' : _language
    });
    print(uri);
    return getJson(uri).then((data) =>
      data['results'].map<Media>((item) => Media(item, MediaType.show)).toList()
    );
  }

  Future<List<Cast>> fetchCreditMovies(int mediaId) async {
    print('${mediaId.toString()} lectura de TMDB para movies');
    var uri = Uri.https(_baseUrl, '3/movie/$mediaId/credits', {
      'api_key' : apiKey,
      'page' : '1',
      'language' : _language
    });
    print(uri);
    return getJson(uri).then((data) =>
      data['cast'].map<Cast>((item) => Cast(item, MediaType.movie, mediaId)).toList()
    );
  }

  Future<List<Cast>> fetchCasts(int mediaId, MediaType mediaType) async {
    print('${mediaId.toString()} lectura de TMDB para movies');
    final String endpoint = (mediaType == MediaType.movie ? "movie" : "tv");
    var uri = Uri.https(_baseUrl, '3/movie/$mediaId/credits', {
      'api_key' : apiKey,
      'page' : '1',
      'language' : _language
    });
    print(uri);
    return getJson(uri).then((data) =>
      data['cast'].map<Cast>((item) => Cast(item, MediaType.movie, mediaId)).toList()
    );
  }
}

final ApiProvider apiProvider = new ApiProvider();