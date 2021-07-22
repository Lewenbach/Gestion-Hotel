import 'package:flutter/material.dart';

import '../data_room.dart';
import '../widgets/service_item.dart';

class OurServices extends StatelessWidget {
  static const routeName = '/services';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
         title : Text('Nos Services'),
        elevation : 4,
        centerTitle : true,
      ),
      body : GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      children: SERVICES
          .map(
            (serv) => ServiceItem(
              serv.title,
              serv.imageUrl,
            ),
          )
          .toList(),
    )
    );
  }
}
