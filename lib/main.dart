// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:meal_app/Screens/CategoriesMealScreen.dart';
import 'package:meal_app/Screens/Categories_Screen.dart';
import 'package:meal_app/Screens/FilterScreen.dart';
import 'package:meal_app/Screens/Tabs_Screen.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/mainDawer.dart';

import 'Screens/Meal_detail_Screen.dart';
import 'models/meal.dart';

void main(){
  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _Filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> _FilterData) {
    setState(() {
      _Filters = _FilterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_Filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_Filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }if (_Filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }if (_Filters['vegan']! && !meal.isVegan) {
          return false;
        }
        return true;//
      }).toList();
    });
  }

  void _toggleFavorites(String mealId){
   final existingIndex= _favoriteMeals.indexWhere((meal) => meal.id == mealId );
   if(existingIndex>=0){
     setState(() {
       _favoriteMeals.removeAt(existingIndex);
     });
   }
   else{
     setState(() {
       _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));

     });
   }
  }

  bool _isMealfavorite(String ID){
    return _favoriteMeals.any((meal) =>meal.id== ID);
  }



  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      routes: {
        '/':(context)=> TabsScreen(_favoriteMeals),
        CategoriesMealScreen.routeName:(context) => CategoriesMealScreen(_availableMeals),
        MealDetailScreen.routeName:(context) => MealDetailScreen(_toggleFavorites,_isMealfavorite),
        FiltersScreen.routName:(context)=>  FiltersScreen( _setFilters , _Filters),
        mainDrawer.routName:(context)=> const mainDrawer(),
      },
      debugShowCheckedModeBanner: false,
      //home: const HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          //titleTextStyle:TextStyle(fontFamily: "Raleway-Bold",fontSize: 25,fontWeight: FontWeight.w500),
          color:  Color.fromRGBO(7,39,67, 1),
        ),
        primaryColor: const Color.fromRGBO(7,39,67, 1),
        /*colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ),*/
        accentColor: Colors.amber,
        canvasColor:Colors.white,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color:  Color.fromRGBO(20, 50, 50, 1),
          ),
          bodyText2: const TextStyle(
              color:  Color.fromRGBO(20, 50, 50, 1)
          ),
          subtitle1: const TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.w600,
          )
        ),
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal App"),
      ),
      body: null,
    );
  }
}
