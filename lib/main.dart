import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_example/screen/landing_screen.dart';
import 'package:flutter_example/screen/layout_screen.dart';
import 'package:flutter_example/screen/login_screen.dart';
import 'package:flutter_example/screen/web_side/addproducts_screen.dart';
import 'package:flutter_example/screen/web_side/deleteProducts_screen.dart';
import 'package:flutter_example/screen/web_side/deshboard_screen.dart';
import 'package:flutter_example/screen/web_side/updateProducts_screen.dart';
import 'package:flutter_example/screen/web_side/update_complete_screen.dart';
import 'package:flutter_example/screen/web_side/web_login.dart';
import 'package:flutter_example/screen/web_side/web_main.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBjItvcyUJ3BmVVVAe5mO0LdlTIMSGRtD8",
    authDomain: "example-f9a3b.firebaseapp.com",
    projectId: "example-f9a3b",
    storageBucket: "example-f9a3b.appspot.com",
    messagingSenderId: "34232398125",
    appId: "1:34232398125:web:fa64ba6840e0e08c3523a4",
        ));
  }else {
    await Firebase.initializeApp();
  }

  /*
<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.6.10/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.6.10/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyBjItvcyUJ3BmVVVAe5mO0LdlTIMSGRtD8",
    authDomain: "example-f9a3b.firebaseapp.com",
    projectId: "example-f9a3b",
    storageBucket: "example-f9a3b.appspot.com",
    messagingSenderId: "34232398125",
    appId: "1:34232398125:web:fa64ba6840e0e08c3523a4",
    measurementId: "G-5W1ECJDJJX"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>

  */
await Firebase.initializeApp();
SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECO BUY',
        theme: ThemeData(
    
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
        ),
       // home: LoginScreen(),
       //  home: LandingScreen(),
       home: LayoutScreen(),
       routes: {     
      WebLoginScreen.id:(context) => WebLoginScreen(),     
      WebMainScreen.id:(context)=> WebMainScreen(),
      AddProductScreen.id:(context)=> AddProductScreen(),
      UpdateProductScreen.id:(context)=> UpdateProductScreen(),
      DeleteProductScreen.id:(context)=> DeleteProductScreen(),
      DashBoardScreen.id:(context)=> DashBoardScreen(),
      UpdateCompleteProductScreen.id:(context) => UpdateCompleteProductScreen(),
       },
      ),
    );
  }
}
