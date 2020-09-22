import 'package:movie_tmdb_app/src/commons/media_provider.dart';
import 'package:movie_tmdb_app/src/models/cast.dart';
import 'package:movie_tmdb_app/src/resources/resource_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

//Secció 16: SQLite

class DBProvider implements ResourceProvider, CacheProvider{
  Database db;
  static final DBProvider _dbProvider = new DBProvider();

  DBProvider() {
    init();
  }
  
  static DBProvider get(){
    return _dbProvider;
  }

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "Casts4.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version){
        newDb.execute("""
          CREATE TABLE Casts
          (
            id INTEGER PRIMARY KEY,
            name TEXT,
            profile_path TEXT,
            media_Id INTEGER
          )
        """);
      }
    );
  }

  Future<List<Cast>> fetchCasts(int mediaId, MediaType mediaType) async {
    print('${mediaId.toString()} Lectura de Base de Datos local');
    var maps = await db.query(
      "Casts",
      columns: null,
      where: "media_Id = ?",
      whereArgs: [mediaId]
    );

    if (maps.length > 0) {
      return maps.map<Cast>((item) => Cast.fromDb(item)).toList();
    }

    return null;
  }

  addCast(Cast cast) {
    print('${cast.mediaId.toString()} Insertar en Base de Datos local');
    db.insert(
      "Casts",
      cast.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail
    );
  }
}

final DBProvider dbProvider = new DBProvider();