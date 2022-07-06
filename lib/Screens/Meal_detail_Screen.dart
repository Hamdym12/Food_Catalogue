// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'Meal_Detail';
  final Function toggleFav;
  final Function isMealfav;

   MealDetailScreen( this.toggleFav,this.isMealfav);

  @override
  Widget build(BuildContext context) {
    final MealId = ModalRoute.of(context)!.settings.arguments as String;
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == MealId);

    Widget buildSectionTitle(BuildContext ctx, String text) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(text,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      );
    }

    Widget buildContainer(Widget child){
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: const Color.fromRGBO(7, 39, 67, 1).withOpacity(0.7)),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child:child ,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(SelectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            buildSectionTitle(context, "Ingredients"),

           buildContainer(
             ListView.builder(
             itemCount: SelectedMeal.ingredients.length,
             itemBuilder: (BuildContext context, int index) {
               return Card(
                 color: Theme.of(context).accentColor,
                 child: Padding(
                   padding:
                   const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                   child: Text(SelectedMeal.ingredients[index]),
                 ),
               );
             },
           ),
           ),
            buildSectionTitle(context,"Steps"),
            buildContainer(ListView.builder(
              itemCount: SelectedMeal.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("${index+1}"),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      title: Text(SelectedMeal.steps[index]),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).primaryColor,
        child: Icon(isMealfav(MealId) ? Icons.star : Icons.star_border ) ,
        onPressed:()=>toggleFav(MealId),
      ),
    );
  }
}
