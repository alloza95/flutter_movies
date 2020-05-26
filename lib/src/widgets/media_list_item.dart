import 'package:flutter/material.dart';
import 'package:movie_tmdb_app/src/models/media.dart';

class MediaListItem extends StatelessWidget {
  final Media media;
  MediaListItem({this.media});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              FadeInImage.assetNetwork(
                placeholder: 'assets/placeholder.jpg',
                image: media.getBackDropUrl(),
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 40),
                height: 200,
                width: double.infinity,
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[900].withOpacity(0.5)),
                  constraints: BoxConstraints.expand(
                    height: 55
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
