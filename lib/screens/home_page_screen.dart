import 'package:librarian_app/constants/ligth_colors.dart';
import 'package:librarian_app/widgets/booking_item.dart';
import 'package:librarian_app/widgets/drawar_item.dart';
import 'package:librarian_app/widgets/drawer.dart';
import 'package:librarian_app/widgets/top_container.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageScreen extends StatelessWidget {
  static final routname = "HomePageScreen";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final books = FirebaseFirestore.instance;
  Padding subheading(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Text(
        title,
        style: TextStyle(
            color: LightColors.kDarkBlue,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0),
      ),
    );
  }

  static CircleAvatar calendarIcon(BuildContext context) {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: GestureDetector(
                    onTap: () => _scaffoldKey.currentState.openDrawer(),
                    child: Icon(Icons.menu,
                        color: LightColors.kDarkBlue, size: 30.0)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Home Page",
                  style: TextStyle(
                      color: LightColors.kDarkBlue,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    subheading("Reservations Stats"),
                    SizedBox(
                      height: 6.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(color: Colors.grey[500]),
                        child: Container(
                          height: 3,
                          width: width * 0.475,
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        TopContainer(
                          progressColor: Colors.lightGreen,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        TopContainer(
                          progressColor: Colors.redAccent,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        TopContainer(
                          progressColor: Colors.blueAccent,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    subheading("Bookings"),
                    SizedBox(
                      height: 6.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        height: 3,
                        decoration: BoxDecoration(color: Colors.grey[500]),
                        child: Container(
                          height: 3,
                          width: width * 0.25,
                          decoration: BoxDecoration(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: BookingItem(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
