import 'package:flutter/material.dart';
import 'Pages/login_page.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  static Map<int, Color> color = {
    50: Color(0xffFFF8E1),
    100: Color(0xffFFECB3),
    200: Color(0xffFFE082),
    300: Color(0xffFFD54F),
    400: Color(0xffFFCA28),
    500: Color(0xffFFC107),
    600: Color(0xffFFB300),
    700: Color(0xffFFA000),
    800: Color(0xffFF8F00),
    900: Color(0xffFF6F00),
  };
  MaterialColor customOrange = MaterialColor(0xffFFCA28, color);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Inventory Management',
        theme: ThemeData(
          primarySwatch: customOrange,
          fontFamily: 'Sansation',
        ),
        home: LoginPage());
  }
}
