import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoriesItem({
    this.title,
    this.color,
    this.id,
  });

  void selectItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoriesMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
