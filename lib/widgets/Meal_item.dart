// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Screens/Meal_detail_Screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String ImageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final String title;
  final String id;

   MealItem({
    required this.ImageUrl,
    required this.complexity,
    required this.affordability,
    required this.duration,
    required this.title,
    required this.id,
  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple: return "Simple"; break;
      case Complexity.Challenging: return "Challenging"; break;
      case Complexity.Hard: return "Hard"; break;
      default: return "Unknown"; break;
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable: return "Affordable"; break;
      case Affordability.Pricey: return "Pricey"; break;
      case Affordability.Luxurious: return "Luxurious"; break;
      default: return "Unknown"; break;
    }
  }


  void SelectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
      arguments: id,

    ).then((result) {
     // if(result !=null)removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> SelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    ImageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    width: 250,
                    padding: const EdgeInsets.symmetric(vertical:5 ,horizontal:20 ),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 23, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children:  [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6,),
                      Text("$duration min"),//used the '$' because duration in 'int' value so there must be $ before
                    ],
                  ),
                  Row(
                    children:   [
                    const Icon(Icons.work),
                      const SizedBox(width: 6,),
                    Text(complexityText),
                  ],),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6,),
                    Text(affordabilityText),
                  ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
