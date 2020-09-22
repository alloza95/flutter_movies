import 'package:movie_tmdb_app/src/commons/media_provider.dart';
import 'package:movie_tmdb_app/src/commons/util.dart';

class Cast {
  int id;
  String name;
  String profilePath;
  int mediaId;

  String getCastUrl() => getMediumPictureUrl(profilePath);

  factory Cast(Map jsonMap, MediaType mediaType, int mediaId) {
    try{
      return Cast.deserialize(jsonMap, mediaType, mediaId);
    }catch(ex){
      throw ex;
    }
  }

  Cast.deserialize(Map jsonMap, MediaType mediaType, int mediaId) : 
  id = jsonMap["id"].toInt(),
  name = jsonMap["name"],
  profilePath = jsonMap["profile_path"] ?? "/eze9FO9VuryXLP0aF2cRqPCcibN.jpg",
  mediaId = mediaId;

  //Secció 16: SQLite
  Cast.fromDb(Map<String, dynamic> parsedJson) :
  id = parsedJson["id"].toInt(),
  name = parsedJson["name"],
  profilePath = parsedJson["profile_path"],
  mediaId = parsedJson["media_Id"].toInt();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "media_Id": mediaId,
      "profile_path": profilePath
    };
  }
}