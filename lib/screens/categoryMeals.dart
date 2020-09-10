import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/category.dart';
import '../widgets/mealView.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meal';

  final List<Meal> _availableMeals;

  CategoryMeals(this._availableMeals);

  @override
  Widget build(BuildContext context) {
    final _category = ModalRoute.of(context).settings.arguments as Category;

    final _categoryMeals = _availableMeals
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
