import 'package:flutter/material.dart';
import 'package:flutter_example/model/productsModel.dart';

class UpdateComplateScreen extends StatelessWidget {


 String? id;
  UpdateComplateScreen({ Key? key , this.id, this.products}) : super(key: key);
Products? products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.navigate_before),
        iconSize: 50,),
      ],),
    );
  }
}