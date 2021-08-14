import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filterScreen";

  final Function _saveFilters;
  FilterScreen(this._saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree=false;
  bool _lactoseFree=false;
  bool _vegeterian=false;
  bool _isVegan=false;

  Widget getListSwitch(
      String title, String subtitle, bool val, Function(bool) updateVal) {
    return SwitchListTile.adaptive(
      value: val,
      onChanged: updateVal,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Filters")),
          actions: [
            IconButton(
                onPressed: () {
                  final _selectedFilter = {
                    "gluten": _glutenFree,
                    "lactose": _lactoseFree,
                    "vegan": _lactoseFree,
                    "vegeterian": _vegeterian,
                  };
                  widget._saveFilters(_selectedFilter);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: buildDrawer(context),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Center(
                  child: Text(
                "Filter Your Meal Selection",
                style: TextStyle(fontSize: 22),
              )),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 400,
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  getListSwitch(
                    "Is Gluten Free",
                    "Only Gluten Free Meals",
                    _glutenFree,
                    (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  getListSwitch(
                    "Is Lactose Free",
                    "Only Lactose Free Meals",
                    _lactoseFree,
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                  getListSwitch(
                    "Is Vegan",
                    "Only Vegan Meals",
                    _isVegan,
                    (value) {
                      setState(() {
                        _isVegan = value;
                      });
                    },
                  ),
                  getListSwitch(
                    "Is Vegeterian",
                    "Only Vegeterian Meals",
                    _vegeterian,
                    (value) {
                      setState(() {
                        _vegeterian = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
