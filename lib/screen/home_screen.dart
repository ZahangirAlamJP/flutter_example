import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/screen/home_cards.dart';
import 'package:flutter_example/services/firebase_services.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:sizer/sizer.dart';

import '../widgets/category_home_boxes.dart';

List categories = [
  "GROCERY",
 "ELECTRONICES", 
 "COSMETICES", 
 "PHAPMACY",
 "GARMENTS"
 ];
class HomeScreen extends StatelessWidget {
HomeScreen({ Key? key }) : super(key: key);



  final List images = [
    "https://cdn.pixabay.com/photo/2015/09/21/14/24/supermarket-949913_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/19/08/hangers-1850082_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/07/24/21/01/thermometer-1539191_960_720.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        // appBar: AppBar(
        //   actions: [
        //     IconButton(onPressed: () {
        //     FirebaseServices.signOut();
        //     }, icon: Icon(Icons.logout)),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(child: Text("ECO BUY",style: EcoStyle.boldStyle,
               ),),
              CategoryHomeBoxes(),
              // Center(
              //   child: Text("Home Screen",style: EcoStyle.boldStyle,
              //   ),
              //   ),
                CarouselSlider(items: images.map((e) => Stack(
                  children: [
                      
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(e,
                        width: double.infinity,
                        fit: BoxFit.cover,),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(colors: [
                        Colors.blueAccent.withOpacity(0.3),
                         Colors.redAccent.withOpacity(0.3),
        
                      ]),
                    ),
                ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("TITLE",style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  ),
                  ],
                )).toList(), options: CarouselOptions(
                  height: 200,
                  autoPlay: true
                 
                )),
                /*
                HomeCards(title: categories[0],),
                 HomeCards(title: categories[1],),
                  HomeCards(title: categories[2],),
                   HomeCards(title: categories[3],),
                   
              //  HomeCards(title: "GROCERY",)
                */
                Text("PUPULAR ITEM",style: EcoStyle.boldStyle,
               ),
            ],
          ),
        )
      ),
    );
  }
}
