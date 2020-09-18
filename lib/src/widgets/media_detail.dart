import 'package:flutter/material.dart';
import 'package:movie_tmdb_app/src/commons/media_provider.dart';
import 'package:movie_tmdb_app/src/models/media.dart';
import 'dart:ui' as ui;
import 'package:movie_tmdb_app/src/widgets/cast_scroller.dart';

class MediaDetail extends StatelessWidget {
  final Media media;
  final MediaProvider provider;
  
  MediaDetail(this.media, this.provider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            media.getBackDropUrl(),
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 390,
                      height: 390,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(media.getPosterUrl())
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurRadius: 25.0,
                          offset: Offset(0.0, 10.0)
                        )
                      ]
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            media.title, 
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 25.0
                            ),
                          ),
                        ),
                        Text(
                          '${media.voteAverage.toString()}/10',
                          style: TextStyle(fontSize: 20)
                        )
                      ],
                    )
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        media.overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                  CastController(provider, media.id)
                ],
              ),              
            ),
          )
      ])
    );
  }
}