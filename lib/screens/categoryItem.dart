import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoryMeals.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category _categoryItem;

  CategoryItem(this._categoryItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          _categoryItem.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              _categoryItem.color.withOpacity(0.5),
              _categoryItem.color,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMeals.routeName, arguments: _categoryItem);
  }
}
