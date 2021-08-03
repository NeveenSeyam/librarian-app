import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  String title;
  Icon icon;
  DrawerItem(this.title, this.icon);
  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            leading: widget.icon,
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 15),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 20,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
