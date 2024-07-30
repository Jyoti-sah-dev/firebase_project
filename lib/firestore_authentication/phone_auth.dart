import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PhoneAuthStore extends StatefulWidget {
  const PhoneAuthStore({super.key});

  @override
  _PhoneAuthStoreState createState() => _PhoneAuthStoreState();
}

class _PhoneAuthStoreState extends State<PhoneAuthStore> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String _verificationId = "";

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        _savePhoneNumber(_phoneController.text);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  Future<void> _signInWithPhoneNumber() async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _codeController.text,
    );

    await _auth.signInWithCredential(credential);
    _savePhoneNumber(_phoneController.text);
  }

  Future<void> _savePhoneNumber(String phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }

  Future<String?> _getPhoneNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: Text('Verify Phone Number'),
            ),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: 'Verification Code',
              ),
            ),
            ElevatedButton(
              onPressed: _signInWithPhoneNumber,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveUserDetails(User user) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    await users.doc(user.uid).set({
      'uid': user.uid,
      'phoneNumber': user.phoneNumber,
    });
  }

  // Future<void> _signInWithPhoneNumber() async {
  //   final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //     verificationId: _verificationId,
  //     smsCode: _codeController.text,
  //   );
  //
  //   final UserCredential userCredential =
  //       await _auth.signInWithCredential(credential);
  //   _savePhoneNumber(_phoneController.text);
  //   _saveUserDetails(userCredential.user!);
  // }
}
