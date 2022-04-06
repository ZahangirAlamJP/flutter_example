import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_example/add_page.dart';
import 'package:flutter_example/database_services.dart';

class EditDataPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String? title;
  String? detail;
  String? id;

EditDataPage({this.title, this.detail, this.id});

  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>AddPage()));
      },child: Icon(Icons.add),),
      appBar: AppBar(title: const Text("NOTES"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              TextFormField(
                controller: titleC,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "please enter title";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "$title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
      
                ),
              ),
              SizedBox(height: 25,),
              TextFormField(
                controller: detailC,
                maxLines: 5,
                minLines: 1,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "please enter details";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "$detail",
                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
      
                ),
              ),
              SizedBox(height: 25,),
              MaterialButton(minWidth: double.infinity,height: 40,color: Colors.blue, onPressed: () {
      
                if (formKey.currentState!.validate()) {
                  DataBaseServices.updateData(id!, titleC.text, detailC.text);
                 // DataBaseServices.addData(titleC.text, detailC.text);
                }
      
              },child: Text("UPDATE"),shape: RoundedRectangleBorder(side: BorderSide()),)
            ],),
          ),
        ),
      ),
    );
  }
}