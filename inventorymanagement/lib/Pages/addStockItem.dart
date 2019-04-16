import 'package:flutter/material.dart';

class AddStock extends StatefulWidget {
  @override
  _AddStockState createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;

    final addName = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          icon: Icon(
            Icons.add_shopping_cart,
            size: blockSize * 8,
            color: Colors.grey,
          ),
          hintText: 'Item Name',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );
    final mrpText = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Image.asset(
            'assets/rupeeIcon.png',
            height: blockSize * 7,
            color: Colors.grey,
          ),
          hintText: 'Item Mrp',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );
    final cpText = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Image.asset(
            'assets/rupeeIcon.png',
            height: blockSize * 7,
            color: Colors.grey,
          ),
          hintText: 'Item Cost Price',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );

    final totalStock = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Image.asset(
            'assets/maxStock.png',
            height: blockSize * 7,
            color: Colors.grey,
          ),
          hintText: 'Total stock available ',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );

    final minStock = TextFormField(
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Image.asset(
            'assets/minStock.png',
            height: blockSize * 7,
            color: Colors.grey,
          ),
          hintText: 'Minimum Stock',
          contentPadding: EdgeInsets.fromLTRB(
              blockSize * 10, blockSize * 5, blockSize * 10, blockSize * 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(blockSize * 16))),
    );

    final addItemButton = Padding(
        padding: EdgeInsets.symmetric(vertical: blockSizeVertical * 2.8),
        child: Material(
          borderRadius: BorderRadius.circular(blockSize * 15),
          shadowColor: Colors.green,
          elevation: blockSize * 2.0,
          color: Colors.green,
          child: MaterialButton(
            minWidth: blockSize * 80,
            height: blockSize * 10,
            onPressed: () {
              print('On Press of add item Called');
              Navigator.pop(context);
            },
            //color: Colors.purpleAccent,
            child: Text('Add',
                style:
                    TextStyle(color: Colors.white, fontSize: blockSize * 4.5)),
          ),
        ));

    var mainDisplayColumn = ListView(
      padding: EdgeInsets.all(blockSize * 4),
      children: <Widget>[
        Text(
          'Item Name',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: blockSize * 4),
        ),
        addName,
        SizedBox(
          height: blockSize * 5,
        ),
        Text(
          'Selling Price',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: blockSize * 4),
        ),
        mrpText,
        SizedBox(
          height: blockSize * 5,
        ),
        Text(
          'Cost Price',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: blockSize * 4),
        ),
        cpText,
        SizedBox(
          height: blockSize * 5,
        ),
        Text(
          'Available Stock',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: blockSize * 4),
        ),
        totalStock,
        SizedBox(
          height: blockSize * 5,
        ),
        Text(
          'Minimum Stock',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: blockSize * 4),
        ),
        minStock,
        SizedBox(
          height: blockSize * 5,
        ),
        addItemButton
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text('Add ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Stock Item')
          ],
        ),
      ),
      body: mainDisplayColumn,
    );
  }
}
