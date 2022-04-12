 import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/screen/web_side/update_complete_screen.dart';
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
                    child: GestureDetector(
                      onTap: () {
    // Navigator.pushReplacementNamed(context, UpdateCompleteProductScreen.id);
                      },
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
                                child: ListTile(
                                title: Text(data[index]['productName'],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                trailing: IconButton(onPressed: () {
                                  Navigator.pushReplacementNamed(context, UpdateCompleteProductScreen.id);
                                }, icon: Icon(Icons.edit,color: Colors.white,)),
                            ),
                              )),
                          );
                        },
                      ),
                    ),
                  );
                }),
            ],
          ),
        ),
      );
    }
  }