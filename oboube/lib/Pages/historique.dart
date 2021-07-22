import 'package:flutter/material.dart';

class Historique extends StatefulWidget {
  static const routeName = '/historique';
  @override
  _HistoriqueState createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar : AppBar(
         title : Text('Historique'),
        elevation : 4,
        centerTitle : true,
      ),
      body :Center(
      child: Text("La page de l'historique clientèle !"),
    ),
    );
  }
}
