import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vente_cart.dart';
import '../widgets/vente_cart_item.dart';

class VenteCart extends StatefulWidget {
  static const routeName = '/vente_cart';
  @override
  _VenteCartState createState() => _VenteCartState();
}

class _VenteCartState extends State<VenteCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier de vente'),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsetsDirectional.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total :',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text('${cart.totalAmount} francs',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    backgroundColor: Colors.blue,
                  ),
                ]),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, i) => Vcart(
              cart.items.values.toList()[i].id,
              cart.items.keys.toList()[i],
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
              cart.items.values.toList()[i].title,
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: cart.items.length,
          ),
        ),
      ]),
    );
  }
}
