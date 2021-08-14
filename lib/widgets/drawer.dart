import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';

Widget buildDrawer (BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            "MealDeal !",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(height: 20,),
        ListTile(
          onTap: (){
            Navigator.pushReplacementNamed(context, "/");
          },
          leading: Icon(Icons.restaurant,size: 22,),
          title: Text("Categories",style: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed" , fontWeight: FontWeight.w400),),
        ),
        ListTile(
          onTap: (){
            Navigator.pushReplacementNamed(context, FilterScreen.routeName);
          },
          leading: Icon(Icons.filter_alt,size: 26,),
          title: Text("Filters",style: TextStyle(fontSize: 20, fontFamily: "RobotoCondensed" , fontWeight: FontWeight.w400),),
        ),
      ],
    ),
  );
}