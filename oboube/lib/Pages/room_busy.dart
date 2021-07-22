import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/client.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

import './edit_client_data.dart';

class RoomBusy extends StatefulWidget {
  static const routeName = '/room_busy';

  @override
  _RoomBusyState createState() => _RoomBusyState();
}

class _RoomBusyState extends State<RoomBusy> {
  DateTime _inDate = DateTime.now();

  DateTime _outDate = DateTime.now();

  void _enterDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2021),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _inDate = pickedDate;
        });
      }
    });
  }

  void _outerDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime(2021),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _outDate = pickedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final argRoom = ModalRoute.of(context)!.settings.arguments as String;
    final loadedClient = Provider.of<Clients>(context).findById(argRoom);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chambre $argRoom'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.history,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            child: Card(
              margin: const EdgeInsets.all(16),
              elevation: 4,
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: Image.asset(
                        'assets/img/profil.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      loadedClient.name,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      loadedClient.nationality,
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 3),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              right: 16,
              left: 16,
              bottom: 16,
            ),
            width: double.infinity,
            height: 200,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      child: Text(
                        'Details de séjour',
                        style: TextStyle(
                          fontSize: 21,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Date d'arrivée : "),
                        Text(
                          DateFormat('dd/MM/yyyy').format(_inDate),
                        ),
                        TextButton(
                          onPressed: _enterDate,
                          child: Text(
                            'Choisir',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Date de depart : "),
                        Text(
                          DateFormat('dd/MM/yyyy').format(_outDate),
                        ),
                        TextButton(
                          onPressed: _outerDate,
                          child: Text(
                            'Choisir',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Temps à faire : ${loadedClient.numberOfDay}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed(
              EditClientData.routeName,
              arguments: argRoom,
            );
          });
        },
        tooltip: 'Modifier',
        child: Icon(
          Icons.edit,
          color: iconColor,
        ),
      ),
    );
  }
}
