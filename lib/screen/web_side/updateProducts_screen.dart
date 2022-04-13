import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/model/productsModel.dart';
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
                                trailing: Container(
                                  width: 200,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(onPressed: () {                                    
                                      }, icon: Icon(Icons.delete_forever,color: Colors.white,)),
                                   
                                    IconButton(onPressed: () {     
                                Navigator.push(context, MaterialPageRoute(builder: (_) {
                                  return UpdateCompleteProductScreen(
                                    id: data[index].id,
                                    products: Products(
                                       id: id, 
                                       productName: data[index]["productName"], 
                                       detail: data[index]["detail"], 
                                       category: data[index]["category"], 
                                       price: data[index]["price"], 
                                       discountPrice: data[index]["discountPrice"], 
                                       serialCode: data[index]["serialCode"], 
                                       imageUrls: data[index]["imageUrls"], 
                                       isOnsale: data[index]["isOnsale"], 
                                       isPopular: data[index]["isPopular"],  
                                       isFavourite: data[index]["isFavourite"], 
                                       
                                       ),

                                  );
                                }));

                                      }, icon: Icon(Icons.edit,color: Colors.white,)),
                                   
                                    ],
                                  ),
                                ),
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