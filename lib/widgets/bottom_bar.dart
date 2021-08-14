import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/favourite_screen.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/widgets/drawer.dart';

class BottomBar extends StatefulWidget {
  final List<Meal> favourites;
  BottomBar(this.favourites);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  List<Map<String, Widget>> screens=[];
  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    screens = [
      {'page': HomePage(), 'title': Text("Categories")},
      {'page': FavouriteScreen(widget.favourites), 'title': Text("Favourites")},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: screens[_selectedIndex]['title']),
      ),
      drawer: buildDrawer(context),
      body: screens[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
        unselectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
