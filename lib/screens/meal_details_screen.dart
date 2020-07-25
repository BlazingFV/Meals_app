import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal_details';
  final Function _toggleFavorites;
  final Function _isFavorite;

  MealDetailsScreen(this._toggleFavorites, this._isFavorite);

  Widget buildSectionTitle(String text) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      height: 139,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((dish) => dish.id == mealId);
    Widget buildStarIcon() {
      if (_isFavorite(mealId) == true) {
        return Icon(
          Icons.star,
          color: Colors.white,
        );
      } else if (_isFavorite(mealId) == false) {
        return Icon(
          Icons.star_border,
          color: Colors.white,
        );
      }
      return Icon(
        Icons.star_border,
        color: Colors.white,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeal.title}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  margin: EdgeInsets.all(8),
                  elevation: 8,
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      thickness: 2.5,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Removes this Recipe from the list',
        child: buildStarIcon(),
        onPressed: () =>_toggleFavorites(mealId),
      ),
    );
  }
}
