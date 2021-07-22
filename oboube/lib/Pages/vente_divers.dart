import 'package:flutter/material.dart';

import '../widgets/vente_item.dart';
import '../data_room.dart';
import 'package:badges/badges.dart';
import '../providers/vente_cart.dart';
import '../Pages/vente_cart.dart';
import 'package:provider/provider.dart';

class Vente extends StatelessWidget {
  static const routeName = '/vente';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vente & Divers'),
          elevation: 4,
          centerTitle: true,
          actions: [
            Consumer<Cart>(
              builder: (_, cart, ch) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(VenteCart.routeName);
                        }),
                    Badge(
                      badgeContent: Text(
                        '${cart.itemCount}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      // alignment: Alignment.topCenter,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
                  // maxCrossAxisExtent: 250,
                  ),
          children: VENTE.map((vente) {
            return VenteItem(
              vente.id,
              vente.productImage,
              vente.productTitle,
              vente.price,
            );
          }).toList(),
        ));
  }
}
