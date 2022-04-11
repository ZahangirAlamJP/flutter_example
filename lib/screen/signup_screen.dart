import 'package:flutter/material.dart';
import 'package:flutter_example/screen/login_screen.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:flutter_example/widgets/ecoTextField.dart';
import 'package:flutter_example/widgets/eco_button.dart';

class LogUpScreen extends StatefulWidget {
  @override
  State<LogUpScreen> createState() => _LogUpScreenState();
}

class _LogUpScreenState extends State<LogUpScreen> {
 // const LogUpScreen({ Key? key }) : super(key: key);
  TextEditingController emailC= TextEditingController();

   TextEditingController passwordC = TextEditingController();

      TextEditingController retypepasswordC = TextEditingController();
      FocusNode? passwordFocus;
      FocusNode? reTypePasswordFocus;


      bool isPassword = true;
      bool isRetryPassword = true;
   @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    retypepasswordC.dispose();
    super.dispose();
  }

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
              Text("Welcome,\n Please Creat Your Account",textAlign: TextAlign.center,style: EcoStyle.boldStyle,),
              Column(
                children: [
                  SingleChildScrollView(
                    child: Form(child: Column(children: [
                      EcoTextField(
                        controller: emailC,
                        hintText: "Email...",
                        inputAction: TextInputAction.next,

                        icon: Icon(Icons.email),),
                      EcoTextField(
                        IsPassword: isPassword,
                        check: true,
                        inputAction: TextInputAction.next,
                        
                        controller: passwordC,
                                                
                        hintText: "Password...",
                        icon: IconButton(onPressed: (){
                          setState(() {
                            isPassword = !isPassword;
                          });
                          
                        }, icon: isPassword
                        ?const Icon(Icons.visibility)
                        :const Icon(Icons.visibility_off),
                        ),
                        ),
                        
                       EcoTextField(
                         IsPassword: isRetryPassword,
                         controller: retypepasswordC,
                         hintText: "Retype Password...",
                         icon: IconButton(onPressed: (){
                          setState(() {
                            isRetryPassword = !isRetryPassword;
                          });
                          
                        }, icon: isRetryPassword
                        ?const Icon(Icons.visibility)
                        :const Icon(Icons.visibility_off),
                        ),
                         
                         ),
                      EcoButton(title: "SIGNUP",
                      isLoginButtom: true,),
                        
                    ],),
                          
                    
                    ),
                  ),
                  
                ],
              ),
              EcoButton(title: "BACK TO LOGIN",
              onPress: () {
                Navigator.pop(context);
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