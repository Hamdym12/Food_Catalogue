import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

import '../widgets/Categories_Item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((catData) =>
              CategoriesItem(catData.id,catData.title,catData.color),
          ).toList(),
          gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ) ),
    );
  }
}
