import 'package:flutter/material.dart';
import './categoryList.dart';
import './favorites.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meal App'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                // iconMargin: EdgeInsets.all(0),
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CategoryList(),
          Favorites(),
        ]),
      ),
    );
  }
}
