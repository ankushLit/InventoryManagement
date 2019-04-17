import 'package:flutter/material.dart';
import 'package:inventorymanagement/models/stockModel.dart';

class ItemComponentCard extends StatelessWidget {
  final Stock stock;
  ItemComponentCard(this.stock);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final blockSize = width / 100;
    var priceRow = Padding(
      padding: EdgeInsets.all(blockSize * 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'MRP: ' + stock.sp.toString(),
            style: TextStyle(fontSize: blockSize * 4),
          ),
          Text(
            'Cost Price: ' + stock.cp.toString(),
            style: TextStyle(fontSize: blockSize * 4),
          ),
        ],
      ),
    );
    var itemName = Text(
      stock.itemName,
      style: TextStyle(fontSize: blockSize * 5, fontWeight: FontWeight.bold),
    );
    var stockText = Padding(
      padding: EdgeInsets.only(top: blockSize * 2),
      child: Text(
        'Stock: ' + stock.stock.toString(),
        style: TextStyle(fontSize: blockSize * 4),
      ),
    );
    var nameStockRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        itemName,
        stockText,
      ],
    );
    var stockCard = Card(
      child: Padding(
        padding: EdgeInsets.all(blockSize * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(right: blockSize * 2, left: blockSize * 2),
              child: nameStockRow,
            ),
            SizedBox(
              height: blockSize * 2,
            ),
            priceRow,
          ],
        ),
      ),
    );
    return Container(
      child: stockCard,
    );
  }
}
