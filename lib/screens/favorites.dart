import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/mealView.dart';
import '../models/meal.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoritedMeals;

  Favorites(this.favoritedMeals);

  @override
  Widget build(BuildContext context) {
    return favoritedMeals.isEmpty
        ? Center(
            child: Text('No favorites added...start adding some...'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealView(
                // key: _categoryMeals[index].id,
                meal: favoritedMeals[index],
              );
            },
            itemCount: favoritedMeals.length,
          );
  }
}
