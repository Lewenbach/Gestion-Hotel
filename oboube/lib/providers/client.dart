import 'package:flutter/material.dart';
import '../models/room_list.dart';

class Clients with ChangeNotifier {
  List<RoomName> _items = [
    RoomName(
      id: 'r3',
      room: '101',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r3',
      room: '103',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r3',
      room: '104',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r3',
      room: '105',
      isFree: false,
      name: 'Ousmane',
      nationality: 'Niger',
      numberOfDay: '1 mois',
    ),
    RoomName(
      id: 'r1',
      room: '201',
      isFree: false,
      name: 'Hassib Habib',
      nationality: 'Liban',
      numberOfDay: '1 mois',
    ),
    RoomName(
      id: 'r1',
      room: '202',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r1',
      room: '203',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r1',
      room: '204',
      isFree: false,
      name: 'Bruno',
      nationality: 'Beninois',
      numberOfDay: '1 mois',
    ),
    RoomName(
      id: 'r1',
      room: '205',
      isFree: false,
      name: 'Omar',
      nationality: 'Niger',
      numberOfDay: '1 mois',
    ),
    RoomName(
      id: 'r1',
      room: '206',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r2',
      room: '208',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r2',
      room: '209',
      isFree: false,
      name: 'Tonde Ousseni',
      nationality: 'Burkinabé',
      numberOfDay: '14 Jours',
    ),
    RoomName(
      id: 'r2',
      room: '210',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r2',
      room: '302',
      isFree: false,
      name: 'Kabre Madi',
      nationality: 'Burkinabé',
      numberOfDay: '1 mois',
    ),
    RoomName(
      id: 'r1',
      room: '303',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r1',
      room: '304',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
    RoomName(
      id: 'r1',
      room: '305',
      isFree: true,
      name: '',
      nationality: '',
      numberOfDay: '',
    ),
  ];
  List<RoomName> get items {
    return [..._items];
  }

  RoomName findById(String room) {
    return _items.firstWhere((client) => client.room == room);
  }

  void updateClientData(String room, RoomName editClientData) {
    final prodIndex = _items.lastIndexWhere((element) => element.room == room);
    if (prodIndex >= 0) {
      _items[prodIndex] = editClientData;
      notifyListeners();
    }
  }
}
