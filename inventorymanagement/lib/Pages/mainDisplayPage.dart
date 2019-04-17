import 'package:flutter/material.dart';
import 'Tabs/home.dart';
import 'Tabs/activeOrders.dart';
import 'Tabs/stock.dart';

class DashBoardLayout extends StatefulWidget {
  @override
  _DashBoardLayoutState createState() => _DashBoardLayoutState();
}

class _DashBoardLayoutState extends State<DashBoardLayout> {
  int _currentIndex = 0;
  final List<Widget> _children = [DashHome(), ActiveOrders(), DashStock()];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;
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
    var appBar = AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[firstPartName, secondPartName],
      ),
    );
    var bottomNavigationBar = BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.warning), title: Text('Active Orders')),
        BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered), title: Text('Stock')),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
