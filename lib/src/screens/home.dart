import 'package:flutter/material.dart';

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
            onPressed: (){},
          )
        ],
      ),
      drawer: _getDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  Drawer _getDrawer(){
    
  }

  List<BottomNavigationBarItem> _getFooterItems(){
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        title: Text('Populares')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update),
        title: Text('Próximamente')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        title: Text('Mejor valoradas')
      )
    ];
  }
}