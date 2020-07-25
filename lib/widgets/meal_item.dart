import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    //  if(complexity == Complexity.Simple){
    //    return 'Simple';
    //  }
    //   if(complexity == Complexity.Challenging){
    //    return 'Challenging';
    //  }
    //   if(complexity == Complexity.Hard){
    //    return 'Hard';
    //  }

    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectedMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconsAndText = Container(
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 7,
          ),
          Icon(
            Icons.schedule,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '$duration min',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.work,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                '$complexityText',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Container(
            width: 120,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.attach_money,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  '$affordabilityText',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                // Container(
                //   alignment: Alignment.topCenter,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(7.5),
                //     color: Colors.black87,
                //   ),
                //   width: 300,
                //   padding: EdgeInsets.all(7),
                //   child: Text(
                //     title,
                //     style: TextStyle(
                //       fontSize: 18,
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     softWrap: true,
                //     overflow: TextOverflow.fade,
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 7,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(7),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 7, horizontal: 11.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        iconsAndText,
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
