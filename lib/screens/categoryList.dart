import 'package:flutter/material.dart';
import '../widgets/categoryItem.dart';
import '../models/dummy_data.dart';

class CategoryList extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      children: DUMMY_CATEGORIES.map((e) => CategoryItem(e)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
