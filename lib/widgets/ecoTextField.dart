import 'package:flutter/material.dart';

class EcoTextField extends StatefulWidget {
String? hintText;
TextEditingController? controller;
String? Function(String?)? validate;
Widget? icon;
bool IsPassword;
bool check;
final TextInputAction? inputAction;
final FocusNode? focusNode;


EcoTextField({
this.hintText, 
this.controller,
this.validate,
this.IsPassword = false,
this.icon,
this.check = false,
this.inputAction,
this.focusNode,
});

  @override
  State<EcoTextField> createState() => _EcoTextFieldState();
}

class _EcoTextFieldState extends State<EcoTextField> {

  bool visible = false;

  // Icon iconChecker() {
  //   if (widget.IsPassword == false && widget.check == false) {
  //     return Icon(Icons.email);
  //   }
  //   else if(widget.IsPassword == false) {
  //     return Icon(Icons.visibility);
  //   }
  //   else {
  //     return Icon(Icons.visibility_off);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      
      child: TextFormField(
        focusNode: widget.focusNode,
        textInputAction: widget.inputAction,
        controller: widget.controller,
        
        validator: widget.validate,
        obscureText: widget.IsPassword == false ? false : widget.IsPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
        //  labelText: "Enter Email",
        labelText: widget.hintText ?? "hint Text",
        // suffixIcon: IconButton(onPressed: () {
        //   if (widget.IsPassword == false) {
        //     setState(() {
        //       widget.IsPassword= true;
        //     });
        //   } else {
        //     setState(() {
        //       widget.IsPassword = false;
        //     });
        //   }
        // }, icon: iconChecker(),
     //   ),
     suffixIcon: widget.icon,
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}