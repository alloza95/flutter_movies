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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 250,
                            child: Text(media.title,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                          Row(children: <Widget>[
                            Text(media.getReleaseYear().toString()),
                            Icon(Icons.calendar_today)
                          ],)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 250,
                            child: Text(media.getGenres(),
                              style: TextStyle(color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ),
                          Row(
                            children: <Widget>[
                              Text(media.voteAverage.toString()),
                              Icon(Icons.star)
                            ],
                          )
  
                        ],
                      )
                    ],
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
