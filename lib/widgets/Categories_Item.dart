// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meal_app/Screens/CategoriesMealScreen.dart';

class CategoriesItem extends StatelessWidget {
   const CategoriesItem(this.id, this.title, this.color);

  final String id;
  final String title;
  final Color color;

  void SelectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
        CategoriesMealScreen.routeName,
      arguments: {
          'id':id,
        'title':title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),// the border Radius of the inkwell must be same as item's Border Radius
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
        decoration:BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.3),
                color.withOpacity(0.7)
              ]
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        ),
    );
  }
}
