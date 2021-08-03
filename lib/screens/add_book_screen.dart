import 'package:flutter/material.dart';
import 'package:librarian_app/constants/color_constant.dart';
import 'package:librarian_app/screens/add_single_book_screen.dart';
import 'package:librarian_app/widgets/drawer.dart';

class AddBookScreen extends StatelessWidget {
  static final routname = "AddBookScreen";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWidget(),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.35,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(
            height: height * 0.30,
          ),
          Text(
            "Add books by :",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: height * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                child: Text(
                                  'All attached books will be uploaded in excel . are you sure?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: kMainColor,
                                  textColor: Colors.white,
                                  child: Container(
                                    height: 50.0,
                                    child: Center(
                                      child: Text(
                                        "Add Individually",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          fontFamily: "Schyler",
                                        ),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.white,
                                  textColor: Colors.black,
                                  child: Container(
                                    height: 50.0,
                                    child: Center(
                                      child: Text(
                                        "Add Individually",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          fontFamily: "Schyler",
                                        ),
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              color: kMainColor,
              textColor: Colors.white,
              child: Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Add Using Excel",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontFamily: "Schyler",
                    ),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddSingleBokScreen.routname);
              },
              color: kMainColor,
              textColor: Colors.white,
              child: Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    "Add Individually",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontFamily: "Schyler",
                    ),
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ],
      ),
    );
  }
}
