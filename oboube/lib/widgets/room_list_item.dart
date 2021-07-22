import 'package:flutter/material.dart';

import '../Pages/room_busy.dart';
import '../Pages/room_free.dart';
import '../constants.dart';

// ignore: must_be_immutable
class RoomListItem extends StatefulWidget {
  final String id;
  final String room;
  bool isFree;
  final String name;

  RoomListItem({
    required this.id,
    required this.room,
    this.isFree = false,
    required this.name,
  });

  @override
  _RoomListItemState createState() => _RoomListItemState();
}

class _RoomListItemState extends State<RoomListItem> {
  get index => null;

  @override
  Widget build(BuildContext context) {
    // bool isFree = false;
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 10,
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundColor: iconColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.room,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        title: widget.isFree
            ? InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RoomFree.routeName, arguments: widget.room);
                },
                child: Text(
                  ' Libre',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "OpenSans",
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RoomBusy.routeName, arguments: widget.room);
                },
                child: Text(
                  ' Occupé',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Roboto",
                  ),
                ),
              ),
        trailing: Switch(
          value: widget.isFree,
          onChanged: (isFree) {
            setState(() {
              widget.isFree = isFree;
            });
          },
          activeColor: Colors.green,
          inactiveTrackColor: Colors.red,
        ),
      ),
    );
  }
}
