import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:evently_app/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/constants/local_storage_keys.dart';
import '../../core/service/local_stronge_service.dart';

class AuthHelper {
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      EasyLoading.show(status: "Loading...");
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
      EasyLoading.showError(e.message ?? 'Something went wrong');
      return Future.value(false);
    } catch (e) {
      EasyLoading.showError(e.toString());
      return Future.value(false);
    }
  }

  static Future<bool> register(
      {required String email, required String password, required String displayName}) async {
    EasyLoading.show(status: "Loading...");
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateProfile(displayName: displayName);
      await credential.user?.reload();

      EasyLoading.dismiss();
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showError(e.message ?? 'The password provided is too weak');
        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError(
            e.message ?? 'The account already exists for that email');
        return Future.value(false);
      }
      EasyLoading.showError(e.message!);
      return Future.value(false);
    } catch (e) {
      EasyLoading.showError(e.toString());
      return Future.value(false);
    }
  }

  Future<void> cacheUserDataToLocalStorage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await LocalStorageService.saveUserData(
          UserDM(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
        ),
      );
    }
  }

  Future<void> displayUserData() async {
    final userId = await LocalStorageService.getUserId();
    final userName = await LocalStorageService.getUserName();
    final userEmail = await LocalStorageService.getUserEmail();

    print('User ID: $userId');
    print('User Name: $userName');
    print('User Email: $userEmail');
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await LocalStorageService.clearUserData();
  }
}
