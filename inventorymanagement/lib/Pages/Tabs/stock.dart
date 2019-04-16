import 'package:flutter/material.dart';
import 'package:inventorymanagement/models/stockModel.dart';
import 'package:inventorymanagement/components/itemComponentCard.dart';
import 'package:inventorymanagement/Pages/addStockItem.dart';

class DashStock extends StatefulWidget {
  @override
  _DashStockState createState() => _DashStockState();
}

class _DashStockState extends State<DashStock> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;
    Stock newStock =
        new Stock('id', 'Maggi', 'parentId', 'status', 20.0, 15.0, 5, 2);
    final searchContainer = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            size: blockSize * 8,
          ),
          hintText: 'Item search',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );

    void openAddStockItem() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddStock(), fullscreenDialog: true));
    }

    var mainDisplaylistView = ListView(
      padding: EdgeInsets.all(blockSize * 4),
      children: <Widget>[
        searchContainer,
        SizedBox(
          height: blockSize * 3,
        ),
        ItemComponentCard(newStock),
      ],
    );
    return Scaffold(
      body: mainDisplaylistView,
      floatingActionButton: FloatingActionButton(
        onPressed: openAddStockItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
