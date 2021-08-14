import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/screens/detail_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/bottom_bar.dart';
import 'model/meal.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    "gluten" : false,
    "lactose" : false,
    "vegan" : false,
    "vegeterian" : false,
  };
  List<Meal> _availableMeals = meals;
  List<Meal> _favouriteMeals = [];

  _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeals=meals.where((meal){
        if(_filters["gluten"] == true && !meal.isGlutenFree){
          return false;
        }
        if(_filters["lactose"] == true && !meal.isLactoseFree){
          return false;
        }
        if(_filters["vegan"] == true && !meal.isVegan){
          return false;
        }
        if(_filters["vegeterian"] == true && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite (String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((meal) => mealId == meal.id);
    if (existingIndex>=0){
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavourite (String id) {
    return _favouriteMeals.any((meal) => meal.id == id);

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "RobotoCondensed"),
        )
      ),
      initialRoute: '/',
      routes: {
        '/' : (ctx) => BottomBar(_favouriteMeals),
        HomePage.routeName : (ctx) => HomePage(),
        MealsScreen.routeName: (context) => MealsScreen(_availableMeals),
        DetailScreen.routeName: (context) => DetailScreen(toggleFavourite,_isFavourite),
        FilterScreen.routeName: (context) => FilterScreen(_setFilters),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context) => MealsScreen(_availableMeals));
      },
    );
  }
}

