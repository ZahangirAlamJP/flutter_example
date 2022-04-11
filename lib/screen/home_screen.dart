import 'package:flutter/material.dart';
import 'package:flutter_example/services/firebase_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
          FirebaseServices.signOut();
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(child: Text("Home"),)
    );
  }
}