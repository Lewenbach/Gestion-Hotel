import 'package:flutter/material.dart';

import '../constants.dart';

class RoomFree extends StatelessWidget {
  static const routeName = '/room-free';

  @override
  Widget build(BuildContext context) {
    final roomName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Chambre $roomName'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/img/rien.jpg',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                'Cette chambre est actuellement libre !',
                style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
