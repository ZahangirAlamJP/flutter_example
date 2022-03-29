import 'package:flutter/material.dart';
import 'model.dart';

class MyApp extends StatelessWidget {
var id = Student();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example"),),
      body: Center(child: Text("Text ${stuentsData[0].name}"),),
    );
  }
}
//// https://www.youtube.com/watch?v=E0Xach4tN2g

