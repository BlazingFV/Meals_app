import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget listTileBuilder(String text, IconData icon,Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.grey,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Kitchen Time',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: listTileBuilder('Meals', Icons.restaurant_menu,(){
                Navigator.of(context).pushReplacementNamed('/');
              })),
          SizedBox(height: 20),
          Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: listTileBuilder('Filters', Icons.settings,(){
                Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
              })),
        ],
      ),
    );
  }
}
