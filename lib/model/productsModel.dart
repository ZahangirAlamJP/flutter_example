class Products {
  String? Category;
  String? id;
  String? productName;
  String? detail;
  int? price;
  int? discountPrice;
  String? serialCode;

  List<String>? imageUrls;
  bool? isOnsale;
  bool? isPopular;
  bool? inFavourite;

Products({this.Category, this.id, this.productName, this.detail, this.price,this.discountPrice, this.serialCode, 
this.imageUrls, this.isOnsale, this.isPopular, this.inFavourite});
}