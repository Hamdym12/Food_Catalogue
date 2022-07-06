import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/Meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeals;

  const FavoriteScreen(this.favMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
          child: Text("No Selected fav meals, try adding some",style: TextStyle(fontWeight: FontWeight.w600),));
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
        // here we build the items
          return MealItem(
            id: favMeals[index].id,
            ImageUrl: favMeals[index].imageUrl,
            complexity: favMeals[index].complexity,
            affordability: favMeals[index].affordability,
            duration: favMeals[index].duration,
            title: favMeals[index].title,
          );
        },
        itemCount: favMeals.length, //here just tell the number of the items
      );
    }
  }
}
