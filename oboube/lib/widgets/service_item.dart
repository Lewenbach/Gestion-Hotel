import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String text;
  final String image;

  ServiceItem(
    this.text,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: CircleAvatar(
                radius: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
