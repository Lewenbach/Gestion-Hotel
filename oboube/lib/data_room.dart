import './models/room_list.dart';
import './models/vente_model.dart';
import '../models/services.dart';

import './models/category_room.dart';

const DATA_ROOM = const [
  RoomData(
    id: "r1",
    title: 'Appartement studio meublé + électricité à la charge du client',
    imageUrl: 'assets/img/studio.jpg',
    journalier: 20000,
    mensuel: 150000,
    chambre: 'Studio meublé',
  ),
  RoomData(
    id: "r2",
    title:
        'Appartement Ch. + Salon et cuisine + électricité à la charge du client',
    imageUrl: 'assets/img/ch salon.jpg',
    journalier: 35000,
    mensuel: 250000,
    chambre: 'Ch. + Salon et cuisine',
  ),
  RoomData(
      id: "r3",
      title:
          'Appartement 2 Ch. + Salon et cuisine + électricité à la charge du client',
      imageUrl: 'assets/img/2ch salon.jpg',
      journalier: 45000,
      mensuel: 350000,
      chambre: '2 Ch. + Salon et cuisine'),
];

const List<Services> SERVICES = const [
  Services(
    title: 'Wifi',
    imageUrl: 'assets/img/wifi.png',
  ),
  Services(
    title: 'Garage',
    imageUrl: 'assets/img/garage.png',
  ),
  Services(
    title: 'Décoder',
    imageUrl: 'assets/img/decoder.png',
  ),
  Services(
    title: 'Recption 24h/24',
    imageUrl: 'assets/img/check-in.png',
  ),
  Services(
    title: 'Room Service',
    imageUrl: 'assets/img/bucket.png',
  ),
  Services(
    title: 'Climatisation',
    imageUrl: 'assets/img/air-conditioning.png',
  ),
];

const List<VenteModel> VENTE = const [
  VenteModel(
    id: '1',
    productImage: 'assets/img/eau.jpg',
    productTitle: 'Eau ',
    price: 500,
  ),
  VenteModel(
    id: '2',
    productImage: 'assets/img/tamarin.jpg',
    productTitle: 'Tamarin',
    price: 250,
  ),
  VenteModel(
    id: '3',
    productImage: 'assets/img/rush.jpg',
    productTitle: 'Rush',
    price: 250,
  ),
  VenteModel(
    id: '4',
    productImage: 'assets/img/riz.jpg',
    productTitle: 'Riz ',
    price: 6000,
  ),
  VenteModel(
    id: '5',
    productImage: 'assets/img/biscuit100.jpg',
    productTitle: 'Bourbon',
    price: 100,
  ),
  VenteModel(
    id: '6',
    productImage: 'assets/img/biscuit50.png',
    productTitle: 'Delice',
    price: 50,
  ),
  VenteModel(
    id: '7',
    productImage: 'assets/img/biscuit500.jpg',
    productTitle: 'Perk',
    price: 500,
  ),
  VenteModel(
    id: '8',
    productImage: 'assets/img/huile.jpg',
    productTitle: 'Huile',
    price: 4000,
  )
];
