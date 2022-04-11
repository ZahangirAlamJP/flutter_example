import 'package:flutter/material.dart';
import 'package:flutter_example/utils/styles.dart';

class HomeCards extends StatelessWidget {
  final String? title;
  const HomeCards({
    Key? key, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
         decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10 ),
            gradient: LinearGradient(colors: [
              Colors.blueAccent.withOpacity(0.8),
               Colors.redAccent.withOpacity(0.8),
            ]),
          ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(title??"Title",style: EcoStyle.boldStyle.copyWith(
            color: Colors.white,
          ),),
        ),),
    );
  }
}