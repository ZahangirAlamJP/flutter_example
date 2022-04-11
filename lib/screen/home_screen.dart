import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/services/firebase_services.dart';
import 'package:flutter_example/utils/styles.dart';


class HomeScreen extends StatelessWidget {
  //const HomeScreen({ Key? key }) : super(key: key);

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
        body: Column(
          children: [
            Center(
              child: Text("Home Screen",style: EcoStyle.boldStyle,
              ),
              ),
              CarouselSlider(items: images.map((e) => Container(
                child: Image.network(e),
              )).toList(), options: CarouselOptions(
                height: 300
              )),
          ],
        )
      ),
    );
  }
}
// carousel slider