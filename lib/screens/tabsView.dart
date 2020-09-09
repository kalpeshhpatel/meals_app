import 'package:flutter/material.dart';
import '../widgets/appDrawer.dart';
import './categoryList.dart';
import './favorites.dart';

class TabsView extends StatefulWidget {
  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  final List<Map<String, Object>> _screens = [
    {
      'title': 'Categories',
      'page': CategoryList()
    },
    {
      'title': 'Favorites',
      'page': Favorites()
    },
  ];

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]['title']),
        ),
        drawer: AppDrawer(),
        body: _screens[_selectedScreenIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedScreenIndex = index;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
