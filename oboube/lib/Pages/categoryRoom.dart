import 'package:flutter/material.dart';
import '../widgets/room_item.dart';

import '../data_room.dart';

class CategoryRoom extends StatelessWidget {
  static const routeName = '/category_room';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Residence Oboube',
        ),
        elevation: 4,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: DATA_ROOM.map((room) {
          return RoomItem(
            room.title,
            room.imageUrl,
            room.journalier,
            room.mensuel,
            room.chambre,
            room.id,
          );
        }).toList(),
      ),
    );
  }
}
