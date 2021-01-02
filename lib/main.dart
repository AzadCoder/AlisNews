//Core Flutter and Dart
import 'package:flutter/material.dart';
//pages
import './pages/bottomNavBar/bottomNavBar_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              color: Color(0xff202022),
            ),
        buttonColor: Color(0xff5762a1),
        bottomNavigationBarTheme:
            Theme.of(context).bottomNavigationBarTheme.copyWith(
                  selectedItemColor: Color(0xff5762a1),
                ),
        primaryColor: Color(0xff202022),
        accentColor: Color(0xff2a2a2d),
        scaffoldBackgroundColor: Color(0xff202022),
        textTheme: TextTheme(
          headline1: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          headline2: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          subtitle2: Theme.of(context).textTheme.subtitle2.copyWith(
                fontSize: 12,
                color: Colors.grey,
              ),
          bodyText1: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 15,
                color: Colors.white70,
                height: 1.5,
              ),
        ),
      ),
      home: ButtonNavBarPage(),
    );
  }
}
