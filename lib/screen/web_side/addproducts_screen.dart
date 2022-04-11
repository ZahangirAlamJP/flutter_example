import 'package:flutter/material.dart';
import 'package:flutter_example/utils/styles.dart';
class AddProductScreen extends StatelessWidget {
  const AddProductScreen({ Key? key }) : super(key: key);
static const String id = "addproduct";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ADD PRODUCT",
        style: EcoStyle.boldStyle,),
      ),
    );
  }
}