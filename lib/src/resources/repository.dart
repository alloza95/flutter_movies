import 'package:movie_tmdb_app/src/commons/media_provider.dart';
import 'package:movie_tmdb_app/src/models/cast.dart';
import 'api_provider.dart';
import 'db_provider.dart';
import 'resource_provider.dart';

class Repository {  
  static final Repository _repository = new Repository();
  List<ResourceProvider> _providers = <ResourceProvider>[
    dbProvider,
    apiProvider
  ];

  List<CacheProvider> caches = <CacheProvider>[
    dbProvider
  ];

  static Repository get() {
    return _repository;
  }

  Future<List<Cast>> fetchCasts(int mediaId, MediaType mediaType) async {
    var provider;
    List<Cast> list;

    for(provider in _providers){
      list = await provider.fetchCasts(mediaId, mediaType);
      if (list != null) {
        break;
      }
    }

    for (var cache in caches) {
      if(cache != provider){
        list.forEach((element) => cache.addCast(element));
      }
    }

    return list;
  }
}