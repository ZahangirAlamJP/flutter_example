import 'package:flutter/material.dart';
import 'package:flutter_example/utils/styles.dart';
class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({ Key? key }) : super(key: key);
static const String id = "updateproduct";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("UPDATE PROUCT",
        style: EcoStyle.boldStyle,),
      ),
    );
  }
}