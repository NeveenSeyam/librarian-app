import 'package:flutter/material.dart';
import 'package:librarian_app/constants/ligth_colors.dart';
import 'package:librarian_app/screens/add_book_screen.dart';
import 'package:librarian_app/screens/customers_screen.dart';
import 'package:librarian_app/screens/home_page_screen.dart';

import 'drawar_item.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.09,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_sharp,
                      size: 30,
                    )),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffFDCF09),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/doctor_pic2.png'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ahmed El-Majalawi",
                style: TextStyle(
                    color: LightColors.kDarkBlue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0),
              ),
              SizedBox(
                height: 5,
              ),
              Text("ahmad.d.c122@gmail.com"),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(HomePageScreen.routname);
                  },
                  child: DrawerItem("Home Page", Icon(Icons.home))),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AddBookScreen.routname);
                  },
                  child:
                      DrawerItem("Add Books", Icon(Icons.menu_book_outlined))),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(CustomersScreen.routname);
                },
                child: DrawerItem(
                    "Customers", Icon(Icons.supervised_user_circle_outlined)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
