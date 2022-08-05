import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class Category {
  String name;
  IconData icon;

  Category(this.name, this.icon);
}

List<Category> _categories = [
  Category('Simple', Icons.battery_2_bar_sharp),
  Category('Challening', Icons.battery_4_bar_sharp),
  Category('Hard', Icons.battery_full_sharp),
  Category('Unknown', Icons.battery_alert_sharp),
];

class MealItem extends StatelessWidget {
  const MealItem({
    Key key,
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.complexity,
    this.affordability,
  }) : super(key: key);
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  int get complexityText {
    if (complexity == Complexity.Simple) {
      return 0;
    } else if (complexity == Complexity.Challenging) {
      return 1;
    } else if (complexity == Complexity.Hard) {
      return 2;
    } else {
      return 3;
    }
  }

  String get affordabilityText {
    if (complexity == Affordability.Affordable) {
      return 'Affordable';
    } else if (complexity == Affordability.Pricy) {
      return 'Pricey';
    } else if (complexity == Affordability.Luxurious) {
      return 'Expensive';
    } else {
      return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
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
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black26,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                    ),
                    SizedBox(width: 6),
                    Text('$duration min'),
                  ],
                ),
                // SizedBox(width: 10),
                Row(
                  children: <Widget>[
                    Icon(_categories[complexityText].icon),
                    SizedBox(width: 6),
                    Text(_categories[complexityText].name),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money_rounded,
                    ),
                    SizedBox(width: 6),
                    Text(affordabilityText),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
