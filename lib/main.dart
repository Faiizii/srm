import 'package:flutter/material.dart';
import 'package:srm/ui/Login.dart';

import 'components/MaterialColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primaryColor: Colors.black,
       indicatorColor: Colors.black,
       cursorColor: Colors.black,
       toggleableActiveColor: MyColors.PrimaryColor
     ),
     // home: MyHomePage(title: 'SRM'),
      home: LoginScreen(),
    );
  }
}