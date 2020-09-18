import 'dart:async';
import 'package:movie_tmdb_app/src/commons/http_request.dart';
import 'package:movie_tmdb_app/src/models/media.dart';

abstract class MediaProvider{
  Future<List<Media>> fetchMedia(String category);
}

class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow(category: category);
  }
}

enum MediaType {movie, show}