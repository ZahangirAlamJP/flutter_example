
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screen/home_screen.dart';

class CategoryHomeBoxes extends StatelessWidget {
  const CategoryHomeBoxes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(children: [
        ...List.generate(categories.length, (index) => 
        
        Container(
            height: 18.h,
              width: 18.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
            child: Center(child: Text(categories[index],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.white),
            )),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 3,
                    color: Colors.red,

                  )
                ],
                shape: BoxShape.circle,
                color: Colors.red,
                ///colors: red.withOpacity(0.4),

           //     color: Colors.primaries[Random().nextInt(categories.length)],
              ),
            ),
          ),
        ),
        ),
      ],),
    );
  }
}


// carousel slider