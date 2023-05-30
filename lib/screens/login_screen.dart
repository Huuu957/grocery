import 'package:flutter/material.dart';
import 'package:grocery1/constant/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            const SizedBox(
              height: 50,
            ),
            Text(
              'تسجيل الدخول',
              style: getTextStyle(24, bluePrimary),
            ),
            Image.asset(
              'images/logo-png 3.png',
              width: 500,
              height: 225,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          'رقم الهاتف',
                          style: getTextStyle(16, bluePrimary),
                        ),
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'مثال: 07503139650',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: bluePrimary,
                        ),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the border radius as needed
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          'كلمة المرور',
                          style: getTextStyle(16, bluePrimary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      obscureText: !_isPasswordVisible,
                      onChanged: (value) {
                        setState(() {
                          _isPasswordVisible = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        prefixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color:
                                bluePrimary, // Set the desired color for the icon
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the border radius as needed
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: Implement forgot password functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Make the button transparent
                        shadowColor: Colors.transparent, // Remove shadow
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  // TODO: Add forgot password functionality
                                },
                                child: Text(
                                  'نسيت كلمة المرور؟',
                                  style: getTextStyle(12, bluePrimary),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'تذكر كلمة المرور',
                                style: getTextStyle(12, bluePrimary),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Implement login functionality
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        backgroundColor: const Color(0xFF00926E),
                      ),
                      child: const Text(
                        'تسجيل الدخول',
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: Implement create account functionality
                        },
                        child: Text(
                          'انشاء حسابك الأن',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            decoration: TextDecoration.underline,
                            color: bluePrimary,
                          ),
                        ),
                      ),
                      const Text(
                        'هل انت مستخدم جديد؟',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.grey,
                        ),
                      ),
                    ],
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
