import 'package:flutter/material.dart';

import '../constants.dart';
import './historique.dart';
import './categoryRoom.dart';
import './our_services.dart';
import './vente_divers.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List _pages = [
    CategoryRoom(),
    OurServices(),
    Vente(),
    Historique(),
  ];

  int _selectPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottombar = BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black54,
        selectedItemColor: primaryColor,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: ('Services'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: ('Divers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: ('Historique'),
          ),
        ]);
    return Scaffold(
      body: _pages[_selectPageIndex],
      bottomNavigationBar: bottombar,
    );
  }
}
