import 'package:flutter/material.dart';
import 'package:movie_tmdb_app/src/commons/media_provider.dart';
import 'package:movie_tmdb_app/src/models/cast.dart';

class CastController extends StatefulWidget {
  final MediaProvider provider;
  final int mediaId;  

  CastController(this.provider, this.mediaId);

  @override
  _CastControllerState createState() => _CastControllerState();
}

class _CastControllerState extends State<CastController> {
  
  final List<Cast> _casts = new List<Cast>();

  @override
  void initState() {
    loadCasts();
    super.initState();
  }

  void loadCasts() async {
    var results = await widget.provider.fetchCast(widget.mediaId);

    setState(() {
     _casts.addAll(results); 
    });
  }

  Widget _builderCasts(BuildContext ctxt, int index) {
    var cast = _casts[index];
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(cast.getCastUrl()),
            radius: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(cast.name),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox.fromSize(
          size: const Size.fromHeight(180.0),
          child: ListView.builder(
            itemCount: _casts.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: _builderCasts,
          ),
        )
      ],
    );
  }
}