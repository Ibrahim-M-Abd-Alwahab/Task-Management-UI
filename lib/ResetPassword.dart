// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:task_manegment_app/ForgotPassword.dart';
import 'package:task_manegment_app/LoginPage.dart';
import 'package:task_manegment_app/PasswordChangedSuccessfully.dart';
import 'package:task_manegment_app/router.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const resetPassword(),
    );
  }
}

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff000000),
          ),
          onPressed: () {
            AppRouter.NavigateToWidget(const ForgotPassword());
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 35,
                color: Color(0xff313131),
              ),
            ),
            const Text(
              "Reset code was sent to your email. Please enter the code and creae new password",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff9b9b9b),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Reset code",
              style: TextStyle(fontSize: 23),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: '****',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "New password",
              style: TextStyle(fontSize: 23),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your password here',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Confirm password",
              style: TextStyle(fontSize: 23),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Re-Enter your password here',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: openSuccessPage,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xffF96060),
                        borderRadius: BorderRadius.circular(7)),
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openSuccessPage() {
    AppRouter.NavigateToWidget(PasswordChangedSuccessfully());
  }
}
// 
