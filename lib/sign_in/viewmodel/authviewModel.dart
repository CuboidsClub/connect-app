import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  FirebaseAuth _auth;
  late User _user;
  Status _status = Status.Uninitialized;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String verificationID = '';
  String? error;

  UserRepository.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((user) {
      _onAuthStateChanged(user);
    });
  }

  Status get status => _status;
  User get user => _user;

  Future<void> signIn(String id, String phone) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .where('id', isEqualTo: id)
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();
      if (snapshot.size == 0) {
        error = 'Your employee id or phone didnt match';
      } else {
        await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {},
          codeSent: (String verificationId, int? resendToken) {},
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationID = verificationId;
          },
        );
      }
      notifyListeners();
    } catch (e) {
      _status = Status.Unauthenticated;
      error = 'SomeThing went wrong, Please try again';
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

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
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
