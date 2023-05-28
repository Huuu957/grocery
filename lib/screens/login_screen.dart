import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AuthService {
  static const String loginEndpoint = 'https://your-backend.com/login';

  Future<bool> login(String phone, String password) async {
    try {
      final dio = Dio();
      final response = await dio.post(loginEndpoint, data: {
        'phone': phone,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Login successful
        return true;
      } else {
        // Login failed
        return false;
      }
    } catch (e) {
      // Error occurred during login
      return false;
    }
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

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
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(
                    fontFamily: 'Cairo',
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Handle "Forgot Password" action
                },
                child: Text(
                  'نسيت كلمة السر؟',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontFamily: 'Cario',
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final phone = phoneController.text;
                  final password = passwordController.text;

                  // Call the login function
                  final loggedIn = await authService.login(phone, password);

                  if (loggedIn) {
                    // Handle successful login
                    // Navigate to the next screen, show a success message, etc.
                  } else {
                    // Handle failed login
                    // Show an error message, clear the fields, etc.
                  }
                },
                child: const Text('تسجيل الدخول',
                  style: TextStyle(
                  fontFamily: 'Cairo',
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


