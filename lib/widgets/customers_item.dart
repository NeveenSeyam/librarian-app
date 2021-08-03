import 'package:flutter/material.dart';

class CustomersItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Ahmed El-Majdalawi",
          style: TextStyle(fontSize: 19),
        ),
        SizedBox(
          height: 10,
        ),
        Divider()
      ],
    );
  }
}
