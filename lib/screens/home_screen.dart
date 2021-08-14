import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 12.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: (MediaQuery.of(context).size.width) * 0.45,
          childAspectRatio: (MediaQuery.of(context).size.aspectRatio) * 2.5,
          crossAxisSpacing: (MediaQuery.of(context).size.width) * 0.05,
          mainAxisSpacing: (MediaQuery.of(context).size.width) * 0.05,
        ),
        children: category
            .map((e) => CategoryItem(title: e.title, bgColor: e.bgColor, id: e.id,))
            .toList(),
      );
  }
}

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  CategoryItem({required this.title, required this.bgColor, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, MealsScreen.routeName, arguments: {'id':id , 'recipeTitle': title}),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              bgColor.withOpacity(0.6),
              bgColor,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          )),
    );
  }
}
