import 'dart:ui';

import 'package:flutter/material.dart';
import '../Pages/room_state.dart';
import '../constants.dart';

class RoomItem extends StatelessWidget {
  final String text;
  final String image;
  final int nuit;
  final int mois;
  final String room;
  final String id;

  RoomItem(
    this.text,
    this.image,
    this.nuit,
    this.mois,
    this.room,
    this.id,
  );

  void goToRoomList(BuildContext context) {
    Navigator.of(context).pushNamed(RoomList.routeName, arguments: {
      'id': id,
      'chambre': room,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToRoomList(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Container(
                      width: 280,
                      color: textOpacityColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.mode_night_sharp),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$nuit F CFA')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$mois F CFA'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
