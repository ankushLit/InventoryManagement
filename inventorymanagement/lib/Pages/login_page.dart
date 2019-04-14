import 'package:flutter/material.dart';
import 'userDetailsPageOne.dart';
// import 'package:firebase_auth/firebase_auth.dart';

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
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: blockSizeVertical * 2.8),
        child: Material(
          borderRadius: BorderRadius.circular(blockSize * 15),
          shadowColor: Color(0xffFFE082),
          elevation: blockSize * 2.0,
          color: Color(0xffFFD54F),
          child: MaterialButton(
            minWidth: blockSize * 80,
            height: blockSize * 10,
            onPressed: () {
              print('On Press of Login Called');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserDetailsPageOne()));
            },
            //color: Colors.purpleAccent,
            child: Text('Login',
                style:
                    TextStyle(color: Colors.white, fontSize: blockSize * 4.5)),
          ),
        ));

    final forgotField = FlatButton(
      child: Text('Forget Password', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            topField,
            Padding(
              padding: EdgeInsets.only(
                  left: blockSize * 5.71, right: blockSize * 5.71),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: blockSize * 11.43,
                  ),
                  emailField,
                  SizedBox(
                    height: blockSize * 1.90,
                  ),
                  passwordField,
                  SizedBox(
                    height: blockSize * 5.71,
                  ),
                  loginButton,
                  forgotField,
                  SizedBox(
                    height: blockSize * 1.90,
                  ),
                  googleButton,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
