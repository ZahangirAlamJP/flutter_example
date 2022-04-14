
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_example/screens/landing_screen.dart';
import 'package:flutter_example/screens/web_side/addProducts_screen.dart';
import 'package:flutter_example/screens/web_side/dashboard_screen.dart';
import 'package:flutter_example/screens/web_side/deleteProducts_screen.dart';
import 'package:flutter_example/screens/web_side/updateProduct_screen.dart';
import 'package:flutter_example/screens/web_side/web_login.dart';
import 'package:flutter_example/screens/web_side/web_main.dart';
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


  
  } else {
    await Firebase.initializeApp();
  }
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'ECO BUY',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.white,
        ),
        home: LandingScreen(),
        routes: {
          WebLoginScreen.id: (context) => WebLoginScreen(),
          WebMainScreen.id: (context) => WebMainScreen(),
          AddProductScreen.id: (context) => AddProductScreen(),
          UpdateProductScreen.id: (context) => UpdateProductScreen(),
          DeleteProductScreen.id: (context) => DeleteProductScreen(),
          DashBoardScreen.id: (context) => DashBoardScreen(),
          // UpdateCompleteProductScreen.id: (context) =>
          //     UpdateCompleteProductScreen(),
        },
      ),
    );
  }
}