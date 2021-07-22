import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:oboube/providers/vente_cart.dart';
import 'package:provider/provider.dart';
import '../Pages/vente_cart.dart';

class VenteIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (_, cart, ch) => Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Badge(
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () =>
                Navigator.of(context).pushNamed(VenteCart.routeName),
          ),
          badgeContent: Text(
            '${cart.itemCount}',
          ),
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
