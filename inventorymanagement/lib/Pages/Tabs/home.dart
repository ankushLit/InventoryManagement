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

    var dynamicItems = List<Widget>();
    dynamicItems.add(Text(
      newStock.sp.toString(),
      style: TextStyle(fontSize: blockSize * 7),
    ));
    dynamicItems.add(Text(
      newStock.sp.toString(),
      style: TextStyle(fontSize: blockSize * 7),
    ));
    final completeOrderButton = SizedBox(
      width: blockSize * 10,
      height: blockSizeVertical * 3,
      child: RaisedButton(
          onPressed: () {},
          color: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.elliptical(blockSize * 2, blockSize * 2))),
          child: Icon(
            Icons.check,
            size: blockSize * 3,
          )),
    );
    final activeOrderButton = SizedBox(
      width: blockSize * 10,
      height: blockSizeVertical * 3,
      child: RaisedButton(
          onPressed: () {},
          color: Colors.yellow,
          padding: EdgeInsets.all(blockSize * 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.elliptical(blockSize * 2, blockSize * 2))),
          child: Icon(
            Icons.warning,
            size: blockSize * 2.8,
          )),
    );
    var expansionTileForAddingItems = ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Total',
            style: TextStyle(fontSize: blockSize * 6),
          ),
          Text(
            newStock.sp.toString(),
            style:
                TextStyle(fontSize: blockSize * 6, fontWeight: FontWeight.bold),
          ),
          activeOrderButton,
          completeOrderButton
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
    );

    var totalBottomcontainer = Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(blockSize * 4),
          child: expansionTileForAddingItems,
        ),
      ),
    );

    final mainColumn = Padding(
      padding: EdgeInsets.all(blockSize * 4),
      child: Column(
        children: <Widget>[
          searchContainer,
          SizedBox(
            height: blockSize * 3,
          ),
          ItemComponentCard(newStock)
        ],
      ),
    );
    return Scaffold(
      body: mainColumn,
      bottomNavigationBar: totalBottomcontainer,
    );
  }
}
