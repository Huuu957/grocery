import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationScreen extends StatefulWidget {
  late final String verificationId;

  VerificationScreen({required this.verificationId});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController verificationCodeController =
  TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool codeResent = false;

  Future<void> signInWithOTP() async {
    final String otp = verificationCodeController.text.trim();
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      // Handle successful sign-in with OTP
      // e.g., navigate to the next screen, show a success message, etc.
    } catch (e) {
      // Handle sign-in failure
      // e.g., show an error message, clear the fields, etc.
      print('Sign-in failed: $e');
    }
  }

  Future<void> resendCode() async {
    final String phoneNumber = _auth.currentUser?.phoneNumber ?? '';

    try {
      final PhoneVerificationCompleted verificationCompleted =
          (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Handle successful verification and sign-in
        // e.g., navigate to the next screen, show a success message, etc.
      };

      final PhoneVerificationFailed verificationFailed =
          (FirebaseAuthException e) {
        // Handle verification failure
        // e.g., show an error message, clear the fields, etc.
        print('Verification failed: ${e.message}');
      };

      final PhoneCodeSent codeSent =
          (String verificationId, int? resendToken) async {
        setState(() {
          widget.verificationId = verificationId;
          codeResent = true;
        });
      };

      final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
          (String verificationId) {
        setState(() {
          widget.verificationId = verificationId;
          codeResent = true;
        });
      };

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      // Handle resend code failure
      // e.g., show an error message, retry the operation, etc.
      print('Resend code failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Padding(
        padding: EdgeInsets.all(16.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextFormField(
    controller: verificationCodeController,
    decoration: InputDecoration(
    labelText: 'Verification Code',
    prefixIcon: Icon(Icons.confirmation_number),
    ),
    style: TextStyle(
    fontFamily: 'Cario',
    ),
    ),
    SizedBox(height: 16),
    ElevatedButton(
    onPressed: signInWithOTP,
    child: Text(
    'Submit',
    style: TextStyle(
    fontFamily: 'Cario',
    ),
    ),
    ),
    SizedBox(height: 16),
      GestureDetector(
        onTap: () {
          resendCode();
        },
        child: Text(
          codeResent ? 'Code Resent' : 'Resend Code',
          style: TextStyle(
            fontFamily: 'Cario',
            color: Colors.blue,
          ),
        ),
      ),
    ],
    ),
        ),
        ),
    );
  }
}
