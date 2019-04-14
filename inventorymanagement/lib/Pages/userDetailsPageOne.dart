import 'package:flutter/material.dart';

class UserDetailsPageOne extends StatefulWidget {
  @override
  _UserDetailsPageOneState createState() => _UserDetailsPageOneState();
}

class _UserDetailsPageOneState extends State<UserDetailsPageOne> {
  bool checkTab;
  @override
  void initState() {
    checkTab = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;
    // Top Field Starts
    final hiText = Text(
      'Hello,',
      style: TextStyle(fontSize: blockSize * 15),
    );
    final welcomeText = Text(
      'Welcome to ',
      style: TextStyle(fontSize: blockSize * 8),
    );
    final firstPartName = Text(
      'Inv',
      style: TextStyle(fontSize: blockSize * 8, fontWeight: FontWeight.bold),
    );
    final secondPartName = Text(
      'enger',
      style: TextStyle(
        fontSize: blockSize * 8,
      ),
    );
    final welcomeRow = Row(
      children: <Widget>[welcomeText, firstPartName, secondPartName],
    );
    final introContent = Text(
      'Inventory management made easy',
      style: TextStyle(
        fontSize: blockSize * 5,
      ),
    );
    final topPaddingForTopContent = Padding(
      padding: EdgeInsets.only(top: blockSizeVertical * 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[hiText, welcomeRow, introContent],
      ),
    );

    final topField = Container(
        constraints: new BoxConstraints.expand(height: blockSize * 90),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: blockSize * 4),
        decoration: BoxDecoration(
            color: Color(0xffFFD54F),
            borderRadius: BorderRadius.circular(blockSize * 35)),
        child: topPaddingForTopContent);
// Top Field Completes
//details starts
//details column one
    final userDetailsHeading = Text(
      'Tell us about yourself...',
      style: TextStyle(
        fontSize: blockSize * 5,
      ),
    );
    final displayPicture = CircleAvatar(
      backgroundColor: Colors.black,
      radius: blockSize * 10,
      child: IconButton(
        icon: Icon(Icons.camera_alt, size: blockSize * 6),
        onPressed: () {},
      ),
    );
    final nameField = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Your Name',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );

    final nextButton = CircleAvatar(
      backgroundColor: Color(0xffFFD54F),
      radius: blockSize * 8,
      child: IconButton(
        icon: Icon(
          Icons.navigate_next,
          size: blockSize * 6,
          color: Colors.black,
        ),
        onPressed: () {
          if (checkTab) {
            setState(() {
              checkTab = false;
            });
          }
        },
      ),
    );
    final detailsColumnOne = Padding(
      padding: EdgeInsets.only(left: blockSize * 5, right: blockSize * 5),
      child: Column(
        children: <Widget>[
          userDetailsHeading,
          SizedBox(height: blockSize * 5),
          displayPicture,
          SizedBox(height: blockSize * 3),
          nameField,
          SizedBox(height: blockSize * 3),
          nextButton,
        ],
      ),
    );
    //details column one ends
    //details column two starts
    final userDetailsHeadingColumnTwo = Text(
      'Little Information about your shop...',
      style: TextStyle(
        fontSize: blockSize * 5,
      ),
    );
    final shopNameField = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Your Shop Name',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );
    final addressLineOneField = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Address line one',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );
    final addressLineTwoField = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Address line two (optional)',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );
    final detailsColumnTwo = Padding(
      padding: EdgeInsets.only(left: blockSize * 5, right: blockSize * 5),
      child: Column(
        children: <Widget>[
          userDetailsHeadingColumnTwo,
          SizedBox(height: blockSize * 5),
          shopNameField,
          SizedBox(height: blockSize * 3),
          addressLineOneField,
          SizedBox(height: blockSize * 3),
          addressLineTwoField,
          SizedBox(height: blockSize * 5),
          nextButton,
        ],
      ),
    );
    //details column two ends

    //details complete

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            topField,
            SizedBox(
              height: blockSize * 5,
            ),
            checkTab ? detailsColumnOne : detailsColumnTwo,
          ],
        ),
      ),
    );
  }
}
