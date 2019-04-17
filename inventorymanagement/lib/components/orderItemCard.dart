import 'package:flutter/material.dart';
import 'package:inventorymanagement/models/orderModel.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class OrderCard extends StatelessWidget {
  final OrderModel _order;
  OrderCard(this._order);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;
    var totalCalc = SizedBox(
      width: blockSize * 30,
      child: Card(
        elevation: 2.0,
        color: Color(0xffFFF8E1),
        child: Padding(
          padding: EdgeInsets.all(blockSize * 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Total ',
                style: TextStyle(fontSize: blockSize * 4.5),
              ),
              Text(
                '20',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: blockSize * 4.5),
              )
            ],
          ),
        ),
      ),
    );
    final addMoreItemsButton = SizedBox(
      width: blockSize * 10,
      height: blockSizeVertical * 3,
      child: RaisedButton(
          onPressed: () {
            _showAddItemsDialog(context, blockSize, blockSizeVertical);
          },
          // color: Colors.yellow,
          padding: EdgeInsets.all(blockSize),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.elliptical(blockSize * 2, blockSize * 2))),
          child: Icon(
            Icons.add,
            size: blockSize * 4,
          )),
    );
    final completeOrderButton = SizedBox(
      width: blockSize * 10,
      height: blockSizeVertical * 3,
      child: RaisedButton(
          onPressed: () {},
          color: Colors.green,
          padding: EdgeInsets.all(blockSize),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.elliptical(blockSize * 2, blockSize * 2))),
          child: Icon(
            Icons.check,
            size: blockSize * 4,
          )),
    );
    var orderTitle = Padding(
      padding: EdgeInsets.all(blockSize * 3.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                _order.orderName,
                style: TextStyle(fontSize: blockSize * 5),
              ),
              addMoreItemsButton,
              completeOrderButton
            ],
          ),
          SizedBox(
            height: blockSize * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Items: ' + _order.itemsId.length.toString()),
              Row(
                children: <Widget>[
                  Text('Total: '),
                  Container(
                    child: Image.asset(
                      'assets/rupeeIcon.png',
                      height: blockSize * 3,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' 20',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
    final expantionTile = ExpansionTile(
      title: orderTitle,
      children: <Widget>[
        Column(
          children: getAllItems(),
        ),
        SizedBox(
          height: blockSize * 3,
        ),
        totalCalc,
        SizedBox(
          height: blockSize * 3,
        ),
      ],
    );
    return Container(
      child: Card(child: expantionTile),
    );
  }

  List<Widget> getAllItems() {
    List<Widget> allItems = new List();
    for (var i = 0; i < _order.itemsId.length; i++) {
      allItems.add(Text(_order.itemsId[i]));
    }
    return allItems;
  }

  void _showAddItemsDialog(
      BuildContext ctx, double blockSize, double blockSizeVertical) {
    List<Widget> newItems = [Text('Item1'), Text('Item2'), Text('Item3')];
    final addMoreItemsButton = SizedBox(
      width: blockSize * 13,
      height: blockSizeVertical * 4,
      child: RaisedButton(
          onPressed: () {},
          color: Colors.green,
          padding: EdgeInsets.all(blockSize),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.elliptical(blockSize * 2, blockSize * 2))),
          child: Icon(
            Icons.add_circle,
            color: Colors.black,
            size: blockSize * 4,
          )),
    );
    final cancelButton = SizedBox(
      width: blockSize * 13,
      height: blockSizeVertical * 4,
      child: RaisedButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          color: Colors.red,
          padding: EdgeInsets.all(blockSize),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.elliptical(blockSize * 2, blockSize * 2))),
          child: Icon(
            Icons.cancel,
            color: Colors.black,
            size: blockSize * 4,
          )),
    );
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(blockSize * 3),
            ),
            title: Row(
              children: <Widget>[
                Text('Add', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(' more items'),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: false,
                    decoration: InputDecoration(
                        icon: Icon(Icons.shopping_cart),
                        hintText: 'New item',
                        contentPadding: EdgeInsets.fromLTRB(blockSize * 10,
                            blockSize * 5, blockSize * 10, blockSize * 5),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(blockSize * 16))),
                  ),
                  // TypeAheadField(
                  //   textFieldConfiguration: TextFieldConfiguration(
                  //     autofocus: false,
                  //     decoration: InputDecoration(
                  //         icon: Icon(Icons.shopping_cart),
                  //         hintText: 'Item Mrp',
                  //         contentPadding: EdgeInsets.fromLTRB(blockSize * 10,
                  //             blockSize * 5, blockSize * 10, blockSize * 5),
                  //         border: OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.circular(blockSize * 16))),
                  //   ),
                  //   suggestionsCallback: (pattern) {},
                  //   itemBuilder: (context, suggestion) {
                  //     return ListTile(
                  //       leading: Icon(Icons.shopping_cart),
                  //       // title: Text(suggestion['name']),
                  //       // subtitle: Text('\$${suggestion['price']}'),
                  //     );
                  //   },
                  //   onSuggestionSelected: (sug) {},
                  // ),
                  SizedBox(
                    height: blockSizeVertical * 3,
                  ),
                  Column(
                    children: newItems,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(blockSize * 4),
                child: Row(
                  children: <Widget>[
                    cancelButton,
                    SizedBox(
                      width: blockSize * 3,
                    ),
                    addMoreItemsButton,
                  ],
                ),
              )
            ],
          );
        });
  }
}
