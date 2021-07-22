import 'package:flutter/material.dart';
import '../providers/client.dart';

import './routes.dart';
import './theme.dart';
import 'package:provider/provider.dart';
import '../providers/vente_cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Clients(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Residence Oboube',
        theme: theme(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
