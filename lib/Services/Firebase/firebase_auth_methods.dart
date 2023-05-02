// ignore_for_file: unused_local_variable, unused_import, avoid_web_libraries_in_flutter, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //ingresar por Correo Electronico
  signUpWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Ingresar por una cuenta Google
  signInWithGoogle(BuildContext context) async {
    try {
      //Comienza el proceso de inicio de sesión interactivo
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      //Obteniendo detalles para la autenticación de la solicitud
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        //Creando nueva Credencial
        final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        print(googleUser.photoUrl);

        SharedPreferences photo = await SharedPreferences.getInstance();
        await photo.setString('photoGoogle', googleUser.photoUrl as String);
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }

    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Recuperando informacion del usuario de Google


  //ingresar por una cuenta de Facebook
  singInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Cerrar Sesion
  signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
