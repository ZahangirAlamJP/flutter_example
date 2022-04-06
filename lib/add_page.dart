import 'package:flutter/material.dart';
import 'package:flutter_example/database_services.dart';

class AddPage extends StatelessWidget {


  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
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
                  labelText: "Enter Title",
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
                  labelText: "Enter Details",
                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
      
                ),
              ),
              SizedBox(height: 25,),
              MaterialButton(minWidth: double.infinity,height: 40,color: Colors.blue, onPressed: () {
      
                if (formKey.currentState!.validate()) {
                  DataBaseServices.addData(titleC.text, detailC.text);
                }
      
              },child: Text("ADD"),shape: RoundedRectangleBorder(side: BorderSide()),)
            ],),
          ),
        ),
      ),
    );
  }
}