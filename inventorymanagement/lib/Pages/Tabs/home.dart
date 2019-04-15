import 'package:flutter/material.dart';
import 'package:inventorymanagement/components/itemComponentCard.dart';
import 'package:inventorymanagement/models/stockModel.dart';

class DashHome extends StatefulWidget {
  @override
  _DashHomeState createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  @override
  Widget build(BuildContext context) {
    Stock newStock =
        new Stock('id', 'Maggi', 'parentId', 'status', 20.0, 15.0, 5, 2);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;
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
    final mainColumn = Padding(
      padding: EdgeInsets.all(blockSize * 4),
      child: Column(
        children: <Widget>[searchContainer, ItemComponentCard(newStock)],
      ),
    );

    var dynamicItems = List<Widget>();
    dynamicItems.add(Text(
      newStock.sp.toString(),
      style: TextStyle(fontSize: blockSize * 7),
    ));
    dynamicItems.add(Text(
      newStock.sp.toString(),
      style: TextStyle(fontSize: blockSize * 7),
    ));

    var totalBottomcontainer = Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(blockSize * 4),
          child: ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Total: ',
                  style: TextStyle(fontSize: blockSize * 7),
                ),
                Text(
                  newStock.sp.toString(),
                  style: TextStyle(
                      fontSize: blockSize * 7, fontWeight: FontWeight.bold),
                )
              ],
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Items: ',
                    style: TextStyle(fontSize: blockSize * 7),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dynamicItems,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: mainColumn,
      bottomNavigationBar: totalBottomcontainer,
    );
  }
}
