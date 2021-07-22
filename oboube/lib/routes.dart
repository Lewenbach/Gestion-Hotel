import 'package:flutter/widgets.dart';
import './Pages/edit_client_data.dart';
import './Pages/historique.dart';

import './Pages/room_busy.dart';
import './Pages/room_free.dart';
import './Pages/room_state.dart';
import './Pages/our_services.dart';

import './Pages/categoryRoom.dart';
import './Pages/vente_divers.dart';
import './Pages/tab_screen.dart';
import './Pages/vente_cart.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => TabScreen(),
  RoomList.routeName: (context) => RoomList(),
  RoomFree.routeName: (context) => RoomFree(),
  RoomBusy.routeName: (context) => RoomBusy(),
  OurServices.routeName: (context) => OurServices(),
  Vente.routeName: (context) => Vente(),
  Historique.routeName: (context) => Historique(),
  CategoryRoom.routeName: (context) => CategoryRoom(),
  VenteCart.routeName: (context) => VenteCart(),
  EditClientData.routeName: (context) => EditClientData(),
};
