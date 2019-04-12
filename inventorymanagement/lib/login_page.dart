import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;
    final firstPartName = Text(
      'Inv',
      style: TextStyle(fontSize: blockSize * 15, fontWeight: FontWeight.bold),
    );

    final secondPartName = Text(
      'enger',
      style: TextStyle(
        fontSize: blockSize * 15,
      ),
    );
    final googleButton = FlatButton(
      onPressed: () {
        print('google button pressed');
      },
      child: Image.asset(
        'assets/googleIcon.png',
        scale: blockSize * 0.5,
        fit: BoxFit.fill,
      ),
    );
    final topField = Container(
        constraints: new BoxConstraints.expand(height: blockSize * 90),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: blockSize * 4),
        decoration: BoxDecoration(
            color: Color(0xffFFD54F),
            borderRadius: BorderRadius.circular(blockSize * 35)),
        child: Row(
          children: <Widget>[firstPartName, secondPartName],
        ));

    final emailField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Color(0xffFFE082),
          elevation: 5.0,
          color: Color(0xffFFD54F),
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            onPressed: () {
              print('On Press of Login Called');
            },
            //color: Colors.purpleAccent,
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
        ));

    final forgotField = FlatButton(
      child: Text('Forget Password', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            topField,
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                SizedBox(
                  height: 48.0,
                ),
                emailField,
                SizedBox(
                  height: 8.0,
                ),
                passwordField,
                SizedBox(
                  height: 24.0,
                ),
                loginButton,
                forgotField,
                SizedBox(
                  height: 8.0,
                ),
                googleButton,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
