import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddDatapage extends StatefulWidget {
  const AddDatapage({ Key? key }) : super(key: key);

  @override
  State<AddDatapage> createState() => _AddDatapageState();
}

class _AddDatapageState extends State<AddDatapage> {

  TextEditingController emailC = TextEditingController();
   TextEditingController passwordC = TextEditingController();

   addData() async {
     FirebaseFirestore firebaseFirestore = await FirebaseFirestore.instance;
    await firebaseFirestore
    .collection('batch-11')
    .add({"email": emailC.text, "password": passwordC.text}).catchError((e) {
      print(e.toString());
    }).whenComplete(() => print("success")); 
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          SizedBox(height: 20,),
          Text("ADD DATA"),
          TextField(
            controller: emailC,
          ),
          TextField(
            controller: passwordC,
          ),
          ElevatedButton(onPressed: (){
            addData();
          }, child: Text("SAVE DATA")),
        ],),
      ),
    );
  }
}