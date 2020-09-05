import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryMeals extends StatelessWidget {
  final Category _category;

  const CategoryMeals(this._category);

  @override
  Widget build(BuildContext context) {
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
