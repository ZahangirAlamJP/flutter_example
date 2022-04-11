import 'package:flutter/material.dart';

class EcoButton extends StatelessWidget {
String? title;
bool? isLoginButtom;
VoidCallback? onPress;
bool? isLoading;
EcoButton({
  this.title, 
this.isLoginButtom = false,
this.onPress,
this.isLoading = false,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Container(
          height: 60,
         
    margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
     width: double.infinity,
          decoration: BoxDecoration(
            color: isLoginButtom==false?Colors.white:Colors.black,  
              borderRadius: BorderRadius.circular(10),        
            border: Border.all(
              color: isLoginButtom==false?Colors.black:Colors.black),
    
          ),
          child: Stack(children: [
            Visibility(
              visible: isLoading!? false:true,
              child: Center(
              child: Text(
                title ?? "button",
                      style: TextStyle(
              fontSize: 20, color: isLoginButtom==false?Colors.black:Colors.white),
              ),
              ),
            ),

            Visibility(
              visible: isLoading!,
              child: Center(
              child: CircularProgressIndicator(),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}