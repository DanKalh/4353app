import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/home.dart';

class AuthService {
  // Determine if the user is authenticated
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  // Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Sign in
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  // Sign in with email and password
  signInWithEmail(String email, String password) {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  // Register with email and password
  registerWithEmail(String email, String password) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }
}
