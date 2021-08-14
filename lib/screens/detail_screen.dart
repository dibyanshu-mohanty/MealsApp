import 'package:flutter/material.dart';
import 'package:meals_app/data/data.dart';

class DetailScreen extends StatelessWidget {

  static const routeName = "/detailscreen";

  final Function toggleFavourite;
  final Function isFavourite;
  DetailScreen(this.toggleFavourite,this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String title){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget sectionHolder(Widget child){
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12 ,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.0)
      ),
      height: 200,
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      margin: EdgeInsets.all(15.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = meals.firstWhere((element) => element.id == routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(selectedMeal.title),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(routeArgs),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(isFavourite(routeArgs) ? Icons.star : Icons.star_border , color: Colors.white,)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            sectionHolder(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context , index) =>
                      Card(
                        elevation: 4,
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(child: Text(selectedMeal.ingredients[index],style: TextStyle(fontSize: 14.0),)),
                          )),
              ),
            ),
            buildSectionTitle(context, "Steps"),
            sectionHolder(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context , index) =>
                    Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20.0,
                            child: Center(child: Text("# ${index+1}"),),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
