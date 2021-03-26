import 'package:biher_noticeboard/sign_in/views/otp_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Status { Uninitialized, Authenticated, Unauthenticated }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  late User _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String verificationID = '';
  String? error;
  bool loading = false;

  UserRepository.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((user) {
      _onAuthStateChanged(user);
    });
  }

  Status get status => _status;
  User get user => _user;

  Future<void> signIn(String id, String phone, BuildContext context) async {
    try {
      notifyListeners();
      loading = true;
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .where('id', isEqualTo: id)
          .where('phone', isEqualTo: phone)
          .get();
      if (snapshot.docs.length < 0) {
        error = 'Your employee id or phone didnt match';
        showMessage(context);
      } else {
        await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {
            verificationID = verificationId;
            navigateTo(context);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      _status = Status.Unauthenticated;
      error = 'Something went wrong, Please try again';
      showMessage(context);
      notifyListeners();
    }
  }

  Future<void> signWithOtp(String smsCode) async {
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: smsCode,
    );

    // Sign the user in (or link) with the credential
    await _auth.signInWithCredential(phoneAuthCredential);
  }

  navigateTo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpPage()));
  }

  showMessage(BuildContext context) {
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error!),
        ),
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
