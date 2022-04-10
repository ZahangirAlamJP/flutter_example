import 'package:flutter/material.dart';
import 'package:flutter_example/screen/signup_screen.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:flutter_example/widgets/ecoTextField.dart';
import 'package:flutter_example/widgets/eco_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Welcome,\n Please login First",textAlign: TextAlign.center,style: EcoStyle.boldStyle,),
            Column(
              children: [
                Form(child: Column(children: [
                  EcoTextField(hintText: "Email...",),
                  EcoTextField(hintText: "Password...",),
                  EcoButton(title: "LOGIN",
                  isLoginButtom: true,),
                    
                ],),

                
                ),
                
              ],
            ),
            EcoButton(title: "CREAT NEW ACCOUNT",
            onPress: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>LogUpScreen()));
            },
                    isLoginButtom: false,),
          ],
          ),
          ),
      ),
    );
  }
}