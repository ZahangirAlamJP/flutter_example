import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController BilText = TextEditingController();

double price = 0.0;
//Current Bill BILL CALCULATOR

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(height: 35,),
              Text("BILL CALCULATOR"),
              SizedBox(height: 15,),
              Container(width: 300,height: 250,color: Colors.amber,child: 
              Center(child: Text("Bill $price Tk",style: TextStyle(color: Colors.white, fontSize: 30), textAlign: TextAlign.center,)),),
              SizedBox(height: 15,),
              TextField(
                keyboardType: TextInputType.number,
                controller: BilText,
                onChanged: (v) {
                  setState(() {
                    price = double.parse(BilText.text);
                  });
                },
              
        //     onSubmitted: (v) {
        //     setState(() {
        //     price = double.parse(BilText.text);
        //         });
        //  },
                decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "Please Enter Bill",
                labelText: "Please Enter Bill"),
              ),
            ],),
          ),
        ),
      ),
    );
  }
}