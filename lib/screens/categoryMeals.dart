import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryMeals extends StatelessWidget {

  static const routeName = '/category-meal';

  @override
  Widget build(BuildContext context) {

    final _category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(_category.title),
      ),
      body: Center(
        child: Text('Category Meal Details'),
      ),
    );
  }
}
