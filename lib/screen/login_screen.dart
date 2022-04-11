import 'package:flutter/material.dart';
import 'package:flutter_example/screen/signup_screen.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:flutter_example/widgets/ecoTextField.dart';
import 'package:flutter_example/widgets/eco_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

     @override
  void dispose() {
    
    super.dispose();
  }
/*
@override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    retypepasswordC.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    EcoTextField(IsPassword: true,hintText: "Password...",),
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
      ),
    );
  }
}