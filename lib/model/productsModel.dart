import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_example/screen/web_side/updateProducts_screen.dart';

class Products {
  String? category;
  String? id;
  String? productName;
  String? detail;
  int? price;
  int? discountPrice;
  String? serialCode;

  List<dynamic>? imageUrls;
  bool? isOnsale;
  bool? isPopular;
  bool? isFavourite;

Products({
required  this.id, 
required  this.productName, 
required  this.detail, 
required  this.category, 
required  this.price,
required  this.discountPrice, 
required  this.serialCode, 
required  this.imageUrls, 
required  this.isOnsale, 
required  this.isPopular, 
required  this.isFavourite

});


static Future<void> addProducts(Products products) async{
  CollectionReference db = FirebaseFirestore.instance.collection("products");
  Map<String, dynamic> data = {
    "category" : products.category,
    "productName" : products.productName,
    "id" : products.id,
    "detail" : products.detail,
    "price" : products.price,
    "discountPrice" : products.discountPrice,
    "serialCode" : products.serialCode,
    "imageUrls" : products.imageUrls,
    "isOnsale" : products.isOnsale,
     "isPopular": products.isPopular,
    "isFavourite" : products.isFavourite,

  };
  await db.add(data);
}
//////////////////////////////
static Future<void> UpdateProducts(String id, Products UpdateProducts) async{
    CollectionReference db = FirebaseFirestore.instance.collection("products");
  Map<String, dynamic> data = {
    "category" : UpdateProducts.category,
    "productName" : UpdateProducts.productName,
    "id" : UpdateProducts.id,
    "detail" : UpdateProducts.detail,
    "price" : UpdateProducts.price,
    "discountPrice" : UpdateProducts.discountPrice,
    "serialCode" : UpdateProducts.serialCode,
    "imageUrls" :UpdateProducts.imageUrls,
    "isOnsale" : UpdateProducts.isOnsale,
    
    "isFavourite" : UpdateProducts.isFavourite,

  };
  await db.doc(id).update(data);
}
//////////////////////////
static Future<void> deleteProducts(String id)async{
    CollectionReference db = FirebaseFirestore.instance.collection("products");
  await db.doc(id).delete();
}
}