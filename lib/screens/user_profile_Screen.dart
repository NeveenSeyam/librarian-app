import 'package:flutter/material.dart';
import 'package:librarian_app/constants/color_constant.dart';
import 'package:librarian_app/model/popularbook_model.dart';
import 'package:librarian_app/widgets/custom_tab_indicator.dart';
import 'package:librarian_app/widgets/irregularities_item.dart';

class UserProfileScreen extends StatefulWidget {
  static final String route = "/UserprofileScreen";

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int tabSwitch = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/doctor_pic2.png",
                      height: 220,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 222,
                      height: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "ENG. Ahd Otman",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hbad",
                            style: TextStyle(fontSize: 19, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "About",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Ahed Othman, a student at the Islamic University, is programming this application in order to complete the course of the graduation project and hopes to graduate as soon as possible",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(left: 5),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                        onTap: (index) {
                          setState(() {
                            tabSwitch = index;
                          });
                          print(index.toString());
                        },
                        labelPadding: EdgeInsets.all(0),
                        indicatorPadding: EdgeInsets.all(0),
                        isScrollable: true,
                        labelColor: kBlackColor,
                        unselectedLabelColor: kGreyColor,
                        labelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                        indicator: RoundedRectangleTabIndicator(
                            weight: 2, width: 10, color: kBlackColor),
                        tabs: [
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 23),
                              child: Text('Reserved books'),
                            ),
                          ),
                          Tab(
                            child: Container(
                              margin: EdgeInsets.only(right: 23),
                              child: Text('Irregularities'),
                            ),
                          ),
                        ]),
                  ),
                ),
                tabSwitch == 0
                    ? ListView.builder(
                        padding: EdgeInsets.only(top: 25),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: populars.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(bottom: 19),
                              height: 81,
                              color: kBackgroundColor,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 81,
                                    width: 62,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(populars[index].image),
                                        ),
                                        color: kMainColor),
                                  ),
                                  SizedBox(
                                    width: 21,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        populars[index].title,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: kBlackColor),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        populars[index].author,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: kGreyColor),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '\$' + populars[index].price,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: kBlackColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 25),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: populars.length,
                        itemBuilder: (context, index) {
                          return IrregularitiesItim();
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
