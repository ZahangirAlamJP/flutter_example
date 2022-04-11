import 'package:flutter/material.dart';
import 'package:flutter_example/screen/web_side/web_main.dart';
import 'package:flutter_example/utils/styles.dart';
import 'package:flutter_example/widgets/ecoTextField.dart';
import 'package:flutter_example/widgets/eco_button.dart';
import 'package:sizer/sizer.dart';
class WebLogInScreen extends StatelessWidget {
  //const WebLogInScreen({ Key? key }) : super(key: key);
  TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    final formkey = GlobalKey<FormState>();
    String email ="admin@gmail.com";
    String password ="admin123";
    submit(BuildContext context) {
if (formkey.currentState!.validate()) {
 if (emailC.text == email && passwordC.text == password) {
   Navigator.push(
     context, MaterialPageRoute(builder: (_)=>WebMainScreen()));
 }
}
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("WELCOME ADMIN",style: EcoStyle.boldStyle,),
                  Text("Log in to Your Account",style: EcoStyle.boldStyle,),
                
                  EcoTextField(
                    controller: emailC,
                    validate: (v) {
                            if (v!.isEmpty || 
                            !v.contains("@") || 
                            !v.contains(".com") ) {
                              return "email should not be empty";
                            }
                            return null;
                          },
                  ),
                  EcoTextField(
                    controller: passwordC,
                    validate: (v) {
                            if (v!.isEmpty){
                              return "password should not be emply";
                            }
                            return null;
                          },
                  ),
                  EcoButton(isLoading: true,
                  onPress: () {
                    submit(context);
                  },),
                ],
              ),
            ),
          ),
        ),
      ),),
    );
  }
}