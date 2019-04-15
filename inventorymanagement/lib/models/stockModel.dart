class Stock {
  String id, itemName, parentId, status;
  double sp, cp;
  int stock, minStock;
  Stock(String id, String itemName, String parentId, String status, double sp,
      double cp, int stock, int minStock) {
    this.id = id;
    this.itemName = itemName;
    this.parentId = parentId;
    this.status = status;
    this.sp = sp;
    this.cp = cp;
    this.minStock = minStock;
    this.stock = stock;
  }
}
