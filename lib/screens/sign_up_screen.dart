import 'package:flutter/material.dart';
import 'package:grocery1/constant/constant.dart';
import 'package:grocery1/widget/custom_text_form_field_model.dart';
import 'package:grocery1/widget/text_field_header_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              'انشاء الحساب',
              style: getTextStyle(24, bluePrimary),
            ),
            Image.asset(
              'images/logo-png 3.png',
              width: 500,
              height: 150,
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextFieldHeader(
                      labelText: 'رقم الهاتف', fontSize: 16.0, padding: 10.0),
                  const CustomTextFormField(labelText: 'مثال: 07503139650'),
                  const TextFieldHeader(
                      labelText: 'الاسم', fontSize: 16.0, padding: 10.0),
                  const CustomTextFormField(labelText: 'مثال: أحمد'),
                  const TextFieldHeader(
                      labelText: 'البلد', fontSize: 16.0, padding: 10.0),
                  const CustomTextFormField(labelText: 'مثال: العراق'),
                  const TextFieldHeader(
                      labelText: 'المحافظة', fontSize: 16.0, padding: 10.0),
                  const CustomTextFormField(labelText: 'مثال: بغداد'),
                  const TextFieldHeader(
                      labelText: 'العنوان', fontSize: 16.0, padding: 10.0),
                  const CustomTextFormField(
                      labelText: 'مثال: بغداد - المنصور - ابو جعفر المنصور'),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
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
                        'أنشاء الحساب',
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: Implement create account functionality
                        },
                        child: Text(
                          'انشئ حسابك الأن',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            decoration: TextDecoration.underline,
                            color: bluePrimary,
                          ),
                        ),
                      ),
                      const Text(
                        'هل تملك حساب؟',
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
