import 'package:flutter/material.dart';
import 'package:flutter_example/screen/home_screen.dart';
import 'package:flutter_example/screen/signup_screen.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:flutter_example/widgets/ecoTextField.dart';
import 'package:flutter_example/widgets/eco_button.dart';

import '../services/firebase_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


/*
@override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    retypepasswordC.dispose();
    super.dispose();
  }
*/
  TextEditingController emailC= TextEditingController();

   TextEditingController passwordC = TextEditingController();
Future<void> ecoDialogue (String error) async{
  showDialog(
    context: context, 
    builder: (_){
    return AlertDialog(
      title: Text(error),
      actions: [
        EcoButton(
          title: "CLOSE",
          onPress: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  });
}
 submit() async{
if (formkey.currentState!.validate()) {
 
   setState(() {
     formStateLoading = true;
   });


 // ecoDialogue("YES MATCHED");
FirebaseServices.signInAccount(emailC.text, passwordC.text).then((value) => 
 Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen())));
  }
  }
 final formkey = GlobalKey<FormState>();
 bool formStateLoading = false;




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
                  Form(
                    key: formkey,
                    child: Column(children: [
                    EcoTextField(

                      controller: emailC,
                       validate: (v) {
                          if (v!.isEmpty || 
                          !v.contains("@") || 
                          !v.contains(".com") ) {
                            return "email is badly formated";
                          }
                          return null;
                        },
                      hintText: "Email...",),
                    EcoTextField(
                      controller: passwordC,
                       validate: (v) {
                          if (v!.isEmpty){
                            return "password should not be emply";
                          }
                          return null;
                        },
                      IsPassword: true,hintText: "Password...",),
                    EcoButton(title: "LOGIN",
                    
              isLoading: formStateLoading,
                    isLoginButtom: true,
                    onPress: () {
                      submit();
                    },
                    
                    ),
                      
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