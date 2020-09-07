import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealView.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildSectionContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildSectionContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(
                            meal.steps[index],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: meal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Container buildSectionContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      height: 200,
      width: double.infinity,
      child: child,
    );
  }
}
