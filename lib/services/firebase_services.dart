import 'package:firebase_auth/firebase_auth.dart';


class FirebaseServices {
  static Future<String?> createAccount(
    String email, 
    String password,
    ) async {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, 
      password: password,
      );
    } on FirebaseAuthException catch (e) {
if (e.code == "ERROR_EMAIL_ALREADY_IN_USE") {
  return " email already in user";
}
if (e.code == "ERROR_WEAK_PASSWORD") {
  return "password is too weak";
}
    }
    catch(e){
      return e.toString();
    }
  }
}