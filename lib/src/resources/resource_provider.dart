import 'package:movie_tmdb_app/src/commons/media_provider.dart';
import 'package:movie_tmdb_app/src/models/cast.dart';

abstract class ResourceProvider {
  Future<List<Cast>> fetchCasts(int mediaId, MediaType mediaType);
}

abstract class CacheProvider {
  void addCast(Cast cast);
}