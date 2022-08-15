import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? firebaseUser) async {
      user = (firebaseUser == null) ? null : firebaseUser;
      if (user != null && !user!.emailVerified) {
        await _sendEmailVerification();
      }
      isLoading = false;
      notifyListeners();
    });
  }

  _sendEmailVerification() async {
    try {
      await user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AuthException(
        'Unknown error while sending verification email!\n${e.code}',
      );
    }
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('Password is too weak!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('This email is already registered!');
      } else if (e.code == 'invalid-email') {
        throw AuthException('Invalid email address!');
      } else {
        throw AuthException(
          'Unknown error while creating user!\n${e.code}',
        );
      }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        throw AuthException('Email not validated, check your email inbox.');
      }
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email not found. Sign up!');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Wrong password! Try again.');
      } else if (e.code == 'invalid-email') {
        throw AuthException('Invalid email address!');
      } else {
        throw AuthException('Unknown error while login!\n${e.code}');
      }
    }
  }

  resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email not found. Sign up!');
      } else {
        throw AuthException('Unknown error during password reset!\n${e.code}');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
