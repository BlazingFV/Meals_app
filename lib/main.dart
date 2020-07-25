import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';

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
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritedMeals = [];
  void _setFilters(Map<String, bool> filtersState) {
    setState(() {
      _filters = filtersState;
      _availableMeals = DUMMY_MEALS.where((item) {
        if (_filters['gluten'] && !item.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !item.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !item.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !item.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((item) => item.id == mealId);
        if(existingIndex>=0){
          setState(() {
            _favoritedMeals.removeAt(existingIndex);
          });
        }
        else{
          _favoritedMeals.add(DUMMY_MEALS.firstWhere((item) => item.id == mealId));
        }
  }
  bool _isMealFavorite(String id){
    return _favoritedMeals.any((item) => item.id == id);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlueAccent,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favoritedMeals),
        CategoriesMealsScreen.routeName: (context) =>
            CategoriesMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen( _toggleFavorites,_isMealFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DailyMeals'),
      ),
      body: Center(
        child: Text('Navigation!'),
      ),
    );
  }
}
