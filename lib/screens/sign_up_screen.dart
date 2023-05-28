import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery1/screens/verification_code_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> verifyPhoneNumber() async {
    final String phoneNumber = phoneNumberController.text.trim();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Handle successful verification and sign-up
        // e.g., navigate to the next screen, show a success message, etc.
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        // e.g., show an error message, clear the fields, etc.
        print('فشل التحقق: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          this.verificationId = verificationId;
        });
      },
    );
  }

  Future<void> signUpWithOTP() async {
    final String phoneNumber = phoneNumberController.text.trim();
    final String name = nameController.text.trim();
    final String country = countryController.text.trim();
    final String city = cityController.text.trim();
    final String address = addressController.text.trim();

    try {
      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: phoneNumber,
        password: phoneNumber,
      );

      // Navigate to the verification screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationScreen(
            verificationId: verificationId,
          ),
        ),
      );
    } catch (e) {
      // Handle sign-up failure
      // e.g., show an error message, clear the fields, etc.
      print('فشل التحقق $e');
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
    controller: phoneNumberController,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
    labelText: 'رقم الهاتف',
    prefixIcon: Icon(Icons.phone),
    ),
    style: TextStyle(
    fontFamily: 'Cario',
    ),
    ),
    SizedBox(height: 16),
    TextFormField(
    controller: nameController,
    decoration: InputDecoration(
    labelText: 'الاسم',
    prefixIcon: Icon(Icons.person),
    ),
    style: TextStyle(
    fontFamily: 'Cario',
    ),
    ),
    SizedBox(height: 16),
    TextFormField(
    controller: countryController,
    decoration: InputDecoration(
    labelText: 'البلد',
    prefixIcon: Icon(Icons.location_on),
    ),
    style: TextStyle(
    fontFamily: 'Cario',
    ),
    ),
    SizedBox(height: 16),
    TextFormField(
    controller: cityController,
    decoration: InputDecoration(
    labelText: 'المحافظة',
    prefixIcon: Icon(Icons.location_city),
    ),
    style: TextStyle(
    fontFamily: 'Cario',
    ),
    ),
    SizedBox(height: 16),
    TextFormField(
    controller: addressController,
    decoration: InputDecoration(
      labelText: 'العنوان',
      prefixIcon: Icon(Icons.home),
    ),
      style: TextStyle(
        fontFamily: 'Cario',
      ),
    ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: signUpWithOTP,
        child: Text(
          'انشاء الحساب',
          style: TextStyle(
            fontFamily: 'Cario',
          ),
        ),
      ),
      SizedBox(height: 16),
      GestureDetector(
        onTap: () {
          // Handle "Already have an account" action
          // e.g., navigate to the login screen
        },
        child: Text(
          'هل لديك حساب؟ قم بستجيل الدخول',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontFamily: 'Cario',
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

