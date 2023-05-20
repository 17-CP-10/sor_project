import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/snack_bar.dart';
import '../project_selection/project_selection_screen.dart';
import 'auth_screen.dart';

class AuthFunctionality {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<UserCredential?> registerUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registration successful, you can perform additional tasks or navigate to a new screen.
      SnackBarHelper.showSnackBar(
          context, 'Registration successful: ${userCredential.user!.uid}');
      print('Registration successful: ${userCredential.user!.uid}');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarHelper.showSnackBar(
            context, 'The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        SnackBarHelper.showSnackBar(
            context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
      // Handle other FirebaseAuthException errors.
      SnackBarHelper.showSnackBar(context, e.toString());
      return null;
    } catch (e) {
      SnackBarHelper.showSnackBar(context, e.toString());
      return null;
    }
  }

  static Future<bool> loginUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Login successful, you can perform additional tasks or navigate to a new screen.
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return ProjectSelectionScreen();
      }));
      SnackBarHelper.showSnackBar(
          context, 'Login successful: ${userCredential.user!.uid}');
      print('Login successful: ${userCredential.user!.uid}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarHelper.showSnackBar(context, 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        SnackBarHelper.showSnackBar(
            context, 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
      // Handle other FirebaseAuthException errors.
      print(e.message);
      SnackBarHelper.showSnackBar(context, e.message.toString());
      return false;
    } catch (e) {
      SnackBarHelper.showSnackBar(context, e.toString());
      print(e.toString());
      return false;
    }
  }

  static resetPassword(BuildContext context, String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      // Password reset email sent successfully, inform the user.
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return AuthScreen();
      }));
      SnackBarHelper.showSnackBar(
          context, 'Password reset email sent to $email');
      print('Password reset email sent to $email');
    } catch (e) {
      SnackBarHelper.showSnackBar(context, e.toString());
      // Handle errors during password reset.
    }
  }
}
