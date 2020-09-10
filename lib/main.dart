import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import './models/meal.dart';
import './screens/categoryMeals.dart';
import './screens/mealDetail.dart';
import './screens/tabsView.dart';
import './screens/categoryList.dart';
import './screens/filtersScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoritedMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoritedMeals.any((element) => element.id == mealId);
  }

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoritedMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        accentColor: Colors.red[100],
        canvasColor: Color.fromRGBO(255, 254, 254, 0.9),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: CategoryList.routeName,
      routes: {
        '/': (context) => TabsView(_favoritedMeals),
        // CategoryList.routeName: (context) => CategoryList(),
        CategoryMeals.routeName: (context) => CategoryMeals(_availableMeals),
        MealDetail.routeName: (context) => MealDetail(_toggleFavorite, _isFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters)
      },
      // when unknown route is hit
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return CategoryList();
        });
      },
    );
  }
}
