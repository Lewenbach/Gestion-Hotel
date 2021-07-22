import 'package:flutter/material.dart';

import '../constants.dart';
import '../providers/vente_cart.dart';
import 'package:provider/provider.dart';

class VenteItem extends StatelessWidget {
  final String id;
  final String image;
  final String text;
  final int prix;
  VenteItem(
    this.id,
    this.image,
    this.text,
    this.prix,
  );

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                height: 62,
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              // color: primaryColor,
              child: ListTile(
                title: Text(
                  text,
                  overflow: TextOverflow.fade,
                  // softWrap: true,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '$prix francs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    cart.addItem(
                      id,
                      text,
                      prix,
                    );
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'produit ajouté au panier !',
                        ),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: 'Annuler',
                          onPressed: () {
                            cart.removeSingleItem(id);
                          },
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.shopping_cart,
                    color: primaryColor,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
