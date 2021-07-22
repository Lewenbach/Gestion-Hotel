import 'package:flutter/material.dart';

import 'package:oboube/models/room_list.dart';
import '../providers/client.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class EditClientData extends StatefulWidget {
  static const routeName = '/edit_client';
  @override
  _EditClientDataState createState() => _EditClientDataState();
}

class _EditClientDataState extends State<EditClientData> {
  final _nationalityNode = FocusNode();
  final _numbersOfDay = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editClientData = RoomName(
    name: '',
    nationality: '',
    numberOfDay: '',
  );
  var _isInit = true;
  var _initValue = {
    'name': '',
    'nationality': '',
    'numberOfDay': '',
  };

  @override
  void dispose() {
    _nationalityNode.dispose();
    _numbersOfDay.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final formRoom = ModalRoute.of(context)!.settings.arguments;
      if (formRoom != null) {
        _editClientData = Provider.of<Clients>(context)
            .items
            .firstWhere((client) => client.room == formRoom);

        _initValue = {
          'name': _editClientData.name,
          'nationality': _editClientData.nationality,
          'numberOfDay': _editClientData.numberOfDay,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    _form.currentState!.save();
    if (_editClientData.name != null) {
      return;
    } else {
      Provider.of<Clients>(context, listen: false)
          .updateClientData(_editClientData.room, _editClientData);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modifier données Client')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValue['name'],
                decoration: InputDecoration(
                  labelText: 'Nom et Prénom',
                  errorStyle: TextStyle(
                    color: Colors.red,
                  ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_nationalityNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Entrez le nom du client';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editClientData = RoomName(
                    name: value.toString(),
                    nationality: _editClientData.nationality,
                    numberOfDay: _editClientData.numberOfDay,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValue['nationality'],
                decoration: InputDecoration(
                  labelText: 'Nationalité',
                ),
                textInputAction: TextInputAction.next,
                focusNode: _nationalityNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_numbersOfDay);
                },
                onSaved: (value) {
                  _editClientData = RoomName(
                    name: _editClientData.name,
                    nationality: value.toString(),
                    numberOfDay: _editClientData.numberOfDay,
                  );
                },
              ),
              TextFormField(
                initialValue: _initValue['numberOfDay'],
                decoration: InputDecoration(
                  labelText: 'Nombre de jours à faire',
                ),
                textInputAction: TextInputAction.next,
                focusNode: _numbersOfDay,
                onSaved: (value) {
                  _editClientData = RoomName(
                    name: _editClientData.name,
                    nationality: _editClientData.nationality,
                    numberOfDay: value.toString(),
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Confirmer'),
                    onPressed: _saveForm,
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
