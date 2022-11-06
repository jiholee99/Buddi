import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signUp(String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (error) {
      return error.message.toString();
    } catch (error) {
      return error.toString();
    }
  }

  Future<String> login(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (error) {
      return error.message.toString();
    } catch (error) {
      return error.toString();
    }
  }
}
