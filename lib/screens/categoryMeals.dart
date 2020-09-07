import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/dummy_data.dart';
import '../widgets/mealView.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meal';

  @override
  Widget build(BuildContext context) {
    final _category = ModalRoute.of(context).settings.arguments as Category;

    final _categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(_category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(_category.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealView(
            // key: _categoryMeals[index].id,
            meal: _categoryMeals[index],
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
