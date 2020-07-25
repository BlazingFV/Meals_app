import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritedMeals;

  FavoritesScreen(this.favoritedMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritedMeals.isEmpty) {
      return Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Row(
            children: <Widget>[
              Text('No favorites selected yet - add some!.',
              style: TextStyle(color: Colors.blue),),
              Icon(Icons.sentiment_dissatisfied,color: Colors.blue),
            ],
          ),
        ),
      );
    }
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritedMeals[index].id,
            imageUrl: favoritedMeals[index].imageUrl,
            title: favoritedMeals[index].title,
            duration: favoritedMeals[index].duration,
            complexity: favoritedMeals[index].complexity,
            affordability: favoritedMeals[index].affordability,
          );
        },
        itemCount: favoritedMeals.length,
      ),
    );
  }
}
