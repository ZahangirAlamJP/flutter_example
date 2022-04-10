import 'package:flutter/material.dart';
import 'package:flutter_example/screen/login_screen.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:flutter_example/widgets/ecoTextField.dart';
import 'package:flutter_example/widgets/eco_button.dart';

class LogUpScreen extends StatelessWidget {
  const LogUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Welcome,\n Please Creat Your Account",textAlign: TextAlign.center,style: EcoStyle.boldStyle,),
            Column(
              children: [
                Form(child: Column(children: [
                  EcoTextField(hintText: "Email...",),
                  EcoTextField(hintText: "Password...",),
                  EcoButton(title: "SIGNUP",
                  isLoginButtom: true,),
                    
                ],),

                
                ),
                
              ],
            ),
            EcoButton(title: "BACK TO LOGIN",
            onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
            
            },
                    isLoginButtom: false,),
          ],
          ),
          ),
      ),
    );
  }
}