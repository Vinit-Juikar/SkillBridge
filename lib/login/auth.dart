

import 'package:firebase_auth/firebase_auth.dart';

// class PhoneNumber extends StatefulWidget {
//   static String verify = '';

//   const PhoneNumber({Key? key}) : super(key: key);

//   @override
//   State<PhoneNumber> createState() => _PhoneNumberState();
// }
class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  // Future<void> verifyPhoneNumber({
  //   required String phone,
  // }) async{
  //   FirebaseAuth.instance.verifyPhoneNumber(
  //                       phoneNumber: phone,
  //                       verificationCompleted:
  //                           (PhoneAuthCredential credential) {},
  //                       verificationFailed: (FirebaseAuthException e) {},
  //                       codeSent: (String verificationId, int? resendToken) {
  //                         PhoneNumber.verify = verificationId;
  //                         Navigator.pushNamed(context, 'verify');
  //                       },
  //                       codeAutoRetrievalTimeout: (String verificationId) {},
  //                     );
  // }
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  Future<void> signOut()async{
    await _firebaseAuth.signOut();
  }
}