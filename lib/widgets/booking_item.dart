import 'package:flutter/material.dart';

class BookingItem extends StatefulWidget {
  @override
  _BookingItemState createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/doctor_pic2.png'),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Ahmad El-Majaalawi"),
          ),
          trailing: Text("(2) books"),
        ),
        Divider(),
      ],
    );
  }
}
