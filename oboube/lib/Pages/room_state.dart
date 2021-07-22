import 'package:flutter/material.dart';
import 'package:oboube/providers/client.dart';
import 'package:provider/provider.dart';
import '../widgets/room_list_item.dart';

class RoomList extends StatefulWidget {
  static const routeName = '/room_list';

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    final argId =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final roomId = argId['id'];
    final roomType = argId['chambre'];
    final roomList = Provider.of<Clients>(context).items.where((room) {
      return room.id.contains(roomId!);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(roomType!),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return RoomListItem(
              id: roomList[index].id,
              room: roomList[index].room,
              isFree: roomList[index].isFree,
              name: roomList[index].name,
            );
          },
          itemCount: roomList.length,
        ));
  }
}
