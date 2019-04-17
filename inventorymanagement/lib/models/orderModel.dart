class OrderModel {
  String orderId;
  String date;
  List<String> itemsId;
  String orderName;
  OrderModel(this.orderId, this.orderName, this.date, this.itemsId);
}
