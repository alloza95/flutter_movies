import 'package:flutter/material.dart';
import 'package:movie_tmdb_app/src/widgets/media_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
        children: <Widget>[
          MediaList()
        ],
      ),
      drawer: _getDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  Drawer _getDrawer() {
    ListTile _tileDrawer(String text, IconData icon, Function function) {
      return ListTile(
        title: Text(text),
        trailing: Icon(icon),
        onTap: function,
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Material(),
          ),
          _tileDrawer('Películas', Icons.local_movies, () {}),
          new Divider(),
          _tileDrawer('Televisión', Icons.live_tv, () {}),
          new Divider(),
          _tileDrawer('Cerrar', Icons.close, () {
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), title: Text('Populares')),
      BottomNavigationBarItem(
          icon: Icon(Icons.update), title: Text('Próximamente')),
      BottomNavigationBarItem(
          icon: Icon(Icons.star), title: Text('Mejor valoradas'))
    ];
  }
}
