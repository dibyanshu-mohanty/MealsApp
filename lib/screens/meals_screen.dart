import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/single_meal.dart';
class MealsScreen extends StatelessWidget {
  static const routeName = "/mealsScreen";
  final List<Meal> availableMeals;
  MealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final recipeTitle = routeArgs['recipeTitle'];
    final id = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(recipeTitle.toString()),
        ),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context,index) =>
              MealItem(
                  id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability,
              )
      ),
    );
  }
}
