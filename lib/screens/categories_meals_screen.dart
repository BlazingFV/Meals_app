import 'package:flutter/material.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // CategoriesMealsScreen({
  //   this.categoryId,
  //   this.categoryTitle,
  // });
  static const routeName = '/categories_meal_screen';
  final List<Meal> availableMeals;
  CategoriesMealsScreen(this.availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle;
  List<Meal> displayedItems;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'];
      final categoryId = routeArguments['id'];
      displayedItems = widget.availableMeals.where((everyMealItem) {
        return everyMealItem.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String itemId) {
  //   setState(() {
  //     displayedItems.removeWhere((meal) => meal.id == itemId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedItems[index].id,
            imageUrl: displayedItems[index].imageUrl,
            title: displayedItems[index].title,
            duration: displayedItems[index].duration,
            complexity: displayedItems[index].complexity,
            affordability: displayedItems[index].affordability,
          );
        },
        itemCount: displayedItems.length,
      ),
    );
  }
}
