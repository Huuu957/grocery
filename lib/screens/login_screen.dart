import 'package:flutter/material.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatefulWidget {
  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text(
              'تسجيل الدخول',
              style: TextStyle(
                color: Color(0xFF0C2461),
                fontFamily: 'Cairo',
                fontSize: 24,
              ),
            ),
            Container(
              child: Image.asset(
                'images/logo-png 3.png',
                width: 500,
                height: 225,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'مثال: 07503139650',
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      prefixIcon: IconButton(
                        icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'هل نسيت كلمة المرور؟',
                      style: TextStyle(
                        color: Color(0xFF0C2461),
                        fontFamily: 'Cario',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement login functionality
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ), backgroundColor: const Color(0xFF00926E),),
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 150.0),
                  GestureDetector(
                    onTap: () {
                      // TODO: Implement create account functionality
                    },
                    child: Text(
                      'انشاء حساب',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
