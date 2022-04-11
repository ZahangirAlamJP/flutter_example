import 'package:flutter/material.dart';
import 'package:flutter_example/screen/login_screen.dart';
import 'package:flutter_example/services/firebase_services.dart';
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

      final formkey = GlobalKey<FormState>();

      bool isPassword = true;
      bool isRetryPassword = true;
      bool formStateLoading = false;


   @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    retypepasswordC.dispose();
    super.dispose();
  }

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
  if (passwordC.text == retypepasswordC.text) {
   setState(() {
     formStateLoading = true;
   });


 // ecoDialogue("YES MATCHED");
FirebaseServices.createAccount(emailC.text, passwordC.text).then((value) => 
 Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen())));
  }
  
}

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
                    child: Form(
                      key: formkey,
                      child: Column(children: [
                      EcoTextField(
                        controller: emailC,
                        hintText: "Email...",
                        validate: (v) {
                          if (v!.isEmpty || 
                          !v.contains("@") || 
                          !v.contains(".com") ) {
                            return "email is badly formated";
                          }
                          return null;
                        },
                        inputAction: TextInputAction.next,

                        icon: Icon(Icons.email),),
                      EcoTextField(
                        IsPassword: isPassword,
                        check: true,
                        validate: (v) {
                          if (v!.isEmpty){
                            return "password should not be emply";
                          }
                          return null;
                        },
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
                         validate: (v) {
                          if (v!.isEmpty){
                            return "password should not be emply";
                          }
                          return null;
                        },
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
                      isLoginButtom: true,
                      onPress: () {
                        submit();
                        
                      },
                      isLoading: formStateLoading,
                      
                      ),
                        
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