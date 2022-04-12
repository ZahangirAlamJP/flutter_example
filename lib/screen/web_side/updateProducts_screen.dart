  import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/screen/web_side/update_complete_screen.dart';
















  
/// https://www.youtube.com/watch?v=4filVS4bV1Y&list=PLXZsgimaHDNGSiQW1CNaduIQNBfzdfrPN&index=7








  import 'package:flutter_example/utils/styles.dart';
  class UpdateProductScreen extends StatelessWidget {
    const UpdateProductScreen({ Key? key }) : super(key: key);
  static const String id = "updateproduct";

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Center(
          child: Column(
            children: [
              Text("UPDATE PROUCT",
              style: EcoStyle.boldStyle,),
               StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('products').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.data == null) {
                  return const Center(child: Text("NO DATA EXISTS"));
                }
                final data = snapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            color: Colors.black,
                            //primaries[Random().nextInt(data.length)],
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: GestureDetector(
                                onTap: () {
                                  
                               //Navigator.pushReplacementNamed(context, UpdateComplateProductScreen.id);
                                },
                                child: ListTile(
                                 
                                title: Text(data[index]["productName"],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                    trailing: Container(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                           IconButton(onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return UpdateComplateScreen(); } ),);
                                          }, icon:  Icon(Icons.edit,color: Colors.white,)),

                                          IconButton(onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                                          return UpdateComplateScreen(
                                            id:data[index].id,














                                          ); } ),);
                                          }, icon:  Icon(Icons.delete_forever,color: Colors.white,)),
                                        ],
                                      ),
                                    ),
                                                          //  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                                                        ),
                              ),
                            )),
                        );
                      },
                    ),
                  );
                }),
            ],
          ),
        ),
      );
    }
  }