import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../providers/vente_cart.dart';

class Vcart extends StatelessWidget {
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String title;
  Vcart(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: ValueKey(id),
        background: Container(
          color: Colors.red,
          child: Icon(
            Icons.delete,
            size: 40,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
        ),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                'Etes vous sûr ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              content: Text(
                'Voulez-vous vraiment supprimer ce produit du panier ?',
                textAlign: TextAlign.center,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text('Oui')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: Text('Non'))
              ],
            ),
          );
        },
        onDismissed: (direction) {
          Provider.of<Cart>(context, listen: false).removeItem(productId);
        },
        child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(
                  child: Text(
                    '$price',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text('Total : ${(price * quantity)} francs'),
            trailing: Text('$quantity x')),
      ),
    );
  }
}
