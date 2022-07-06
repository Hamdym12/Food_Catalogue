import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/Meal_item.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = 'categories_Meals';
  final List<Meal> _avaliableMeals;

  const CategoriesMealScreen( this._avaliableMeals);



  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();

}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments
        as Map<String, String>; //used to Receive Map that have Data
    final categoryId = routeArg["id"];
    final categoryTitle = routeArg["title"];
    final categoryMeals =widget._avaliableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    void _removeMeal(String mealId){
      setState(() {
        categoryMeals.removeWhere((meal) => meal.id == mealId);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          // here we build the items
          return MealItem(
            id: categoryMeals[index].id,
            ImageUrl: categoryMeals[index].imageUrl,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            duration: categoryMeals[index].duration,
            title: categoryMeals[index].title,
          );
        },
        itemCount:
            categoryMeals.length, //here just tell the number of the items
      ),
    );
  }
}
