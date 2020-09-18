import 'package:flutter/material.dart';
import 'package:movie_tmdb_app/src/widgets/media_list_item.dart';
import '../commons/http_request.dart';
import '../models/media.dart';
import 'package:movie_tmdb_app/src/commons/media_provider.dart';

class MediaList extends StatefulWidget {
  final MediaProvider provider;
  final String category;

  MediaList(this.provider, this.category);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  void didUpdateWidget(MediaList oldWidget) {
    if(oldWidget.provider.runtimeType != widget.provider.runtimeType){
      _media = List();
      loadMovies();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMovies() async{
    var media = await widget.provider.fetchMedia(widget.category);
    setState(() {
     _media.addAll(media); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return MediaListItem(media: _media[index]);
        },
      ),
    );
  }
}