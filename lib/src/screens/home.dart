import 'package:flutter/material.dart';
import 'package:movie_tmdb_app/src/commons/media_provider.dart';
import 'package:movie_tmdb_app/src/widgets/media_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();
  MediaType mediaType = MediaType.movie;
  PageController _pageController;
  int page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMDB Api'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: PageView(
        children: _getMediaList(),
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
           page = index; 
          });
        },
      ),
      drawer: _getDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
        onTap: _navigationTapped,
        currentIndex: page,
      ),
    );
  }

  Drawer _getDrawer() {
    ListTile _tileDrawer(
        String text, IconData icon, Function function, bool selected) {
      return ListTile(
        title: Text(text),
        trailing: Icon(icon),
        onTap: function,
        selected: selected,
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Material(),
          ),
          _tileDrawer('Películas', Icons.local_movies, () {
            _changeMediaType(MediaType.movie);
            Navigator.of(context).pop();
          }, mediaType == MediaType.movie),
          new Divider(),
          _tileDrawer('Televisión', Icons.live_tv, () {
            _changeMediaType(MediaType.show);
            Navigator.of(context).pop();
          }, mediaType == MediaType.show),
          new Divider(),
          _tileDrawer('Cerrar', Icons.close, () {
            Navigator.of(context).pop();
          }, false),
        ],
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return mediaType == MediaType.movie ? [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text('Populares')),
      BottomNavigationBarItem(
          icon: Icon(Icons.update), title: Text('Próximamente')),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text('Mejor valoradas'))
    ] : 
    [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text('Populares')),
      BottomNavigationBarItem(
          icon: Icon(Icons.update), title: Text('En el aire')),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text('Mejor valoradas'))
    ];
  }

  void _changeMediaType(MediaType type) {
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList(){
    return (mediaType == MediaType.movie) ? 
      <Widget>[
        MediaList(movieProvider, "popular"),
        MediaList(movieProvider, "upcoming"),
        MediaList(movieProvider, "top_rated")
      ]:
      <Widget> [
        MediaList(showProvider, "popular"),
        MediaList(showProvider, "on_the_air"),
        MediaList(showProvider, "top_rated")
      ];
  }

  void _navigationTapped(int _page){
    _pageController.animateToPage(_page, duration: const Duration(microseconds: 300), curve: Curves.ease);
  }
}
