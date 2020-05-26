import 'package:movie_tmdb_app/src/commons/util.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backDropPath;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;

  String getPosterUrl() => getMediumPictureUrl(posterPath);
  String getBackDropUrl() => getLargePictureUrl(backDropPath);
  String getGenres() => getGenreValues(genreIds);

  int getReleaseYear(){
    if(releaseDate == null || releaseDate == '')
      return 0;

    return DateTime.parse(releaseDate).year; 
  }
  
  factory Media(Map jsonMap) {
    return Media.deserialize(jsonMap);
  }

  Media.deserialize(Map json)
    : id = json['id'].toInt(),
      voteAverage = json['vote_average'].toDouble(),
      title = json['title'],
      posterPath = json['poster_path'] ?? '',
      backDropPath = json['backdrop_path'] ?? '',
      overview = json['overview'],
      releaseDate = json['release_date'],
      genreIds = json['genre_ids'].toList();
}
