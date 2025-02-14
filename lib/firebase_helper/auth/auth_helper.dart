import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AuthHelper {
  static Future<bool> login(
      {required String email, required String password,}
      ) async {

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      EasyLoading.dismiss();
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showError(e.message ?? 'No user found for that email');
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError('Wrong password provided for that user');
        return Future.value(false);
      }
      EasyLoading.showError(e.message!);
      return Future.value(false);
    } catch (e) {
      EasyLoading.showError(e.toString());
      return Future.value(false);
    }
  }

  static Future<bool> register({required String email, required String password}) async {
    EasyLoading.show(status: "Loading...");
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      EasyLoading.dismiss();
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showError(e.message ?? 'The password provided is too weak');
        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError(e.message ?? 'The account already exists for that email');
        return Future.value(false);
      }
      EasyLoading.showError(e.message!);
      return Future.value(false);
    } catch (e) {
      EasyLoading.showError(e.toString());
      return Future.value(false);
    }
  }
}
