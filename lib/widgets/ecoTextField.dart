import 'package:flutter/material.dart';

class EcoTextField extends StatelessWidget {
String? hintText;
EcoTextField({this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        //  labelText: "Enter Email",
        labelText: hintText ?? "hint Text",
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}