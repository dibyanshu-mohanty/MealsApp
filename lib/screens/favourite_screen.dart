import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/single_meal.dart';


class FavouriteScreen extends StatelessWidget {
  final List<Meal> favourites;
  FavouriteScreen(this.favourites);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: favourites.isEmpty
      ? Center(
        child: Text("There are no Favourites"),
      )
      : ListView.builder(
          itemCount: favourites.length,
          itemBuilder: (context,index) =>
              MealItem(
                id: favourites[index].id,
                title: favourites[index].title,
                imageUrl: favourites[index].imageUrl,
                duration: favourites[index].duration,
                complexity: favourites[index].complexity,
                affordability: favourites[index].affordability,
              )
      ),
    );
  }
}
