import 'package:flutter/material.dart';

class WebMainScreen extends StatelessWidget {
  //const WebMainScreen({ Key? key }) : super(key: key);
  static const String id = "webmain";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Expanded(child: Container(
          color: Colors.amber,
        )),
        Expanded(child: Container(
          
          color: Colors.black,
        )),
      ],),
    );
  }
}