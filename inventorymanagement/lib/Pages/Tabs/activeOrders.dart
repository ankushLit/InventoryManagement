import 'package:flutter/material.dart';
import 'package:inventorymanagement/components/orderItemCard.dart';
import 'package:inventorymanagement/models/orderModel.dart';

class ActiveOrders extends StatefulWidget {
  @override
  _ActiveOrdersState createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final blockSize = width / 100;
    final blockSizeVertical = height / 100;
    OrderModel o =
        OrderModel('orderId', 'orderName', 'date', ['Item1', 'Item2', 'Item3']);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(blockSize * 3),
        children: <Widget>[
          OrderCard(o),
        ],
      ),
    );
  }
}
