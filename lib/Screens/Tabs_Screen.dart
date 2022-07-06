// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meal_app/Screens/Categories_Screen.dart';
import 'package:meal_app/Screens/Favorite_Screen.dart';
import 'package:meal_app/models/meal.dart';

import '../widgets/mainDawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeals;

  const TabsScreen(this.favMeals);


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


   late List<Map<String,Object>> _Pages;
   int _SelectedPageindex=0;
   @override
  initState(){
     _Pages=[
       {
         'page':const CategoriesScreen(),
         'title':"Categories"
       },
       {
         'page': FavoriteScreen(widget.favMeals),
         'title':"Your Favorites"
       },
     ];
     super.initState();
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(_Pages[_SelectedPageindex]['title'] as String),
      ),
      body: _Pages[_SelectedPageindex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _SelectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor:Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _SelectedPageindex,
        items: const [
           BottomNavigationBarItem(
            label: "Categories",
              icon: Icon(Icons.category)
          ),
          BottomNavigationBarItem(
            label: "Favorites",
              icon:Icon(Icons.star_rate) )
        ],
      ),
      drawer: const mainDrawer(),
    );
  }

  void _SelectPage(int value) {
    setState(() {
      _SelectedPageindex=value;
    });
  }
}
