import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:librarian_app/screens/customers_screen.dart';
import './screens/home_page_screen.dart';
import 'constants/color_constant.dart';
import 'screens/add_book_screen.dart';
import 'screens/add_single_book_screen.dart';
import 'screens/user_profile_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: kMainColor,
      ),
      routes: {
        HomePageScreen.routname: (_) => HomePageScreen(),
        AddSingleBokScreen.routname: (_) => AddSingleBokScreen(),
        CustomersScreen.routname: (_) => AddSingleBokScreen(),
        AddBookScreen.routname: (_) => AddSingleBokScreen(),
      },
      home: UserProfileScreen(),
    );
  }
}
