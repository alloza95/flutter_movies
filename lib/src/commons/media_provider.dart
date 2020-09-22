import 'dart:async';
import '../resources/api_provider.dart';
import 'package:movie_tmdb_app/src/models/cast.dart';
import 'package:movie_tmdb_app/src/models/media.dart';
import '../resources/repository.dart';

abstract class MediaProvider{
  Repository _repository = Repository.get();
  Future<List<Media>> fetchMedia(String category);
  Future<List<Cast>> fetchCast(int mediaId);
}

class MovieProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _repository.fetchCasts(mediaId, MediaType.movie);
  }
}

class ShowProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();

  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _repository.fetchCasts(mediaId, MediaType.show);
  }
}

enum MediaType {movie, show}