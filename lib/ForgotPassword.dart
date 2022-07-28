// ignore_for_file: camel_case_types

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_manegment_app/LoginPage.dart';
import 'package:task_manegment_app/ResetPassword.dart';
import 'package:task_manegment_app/router.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const forgotPassword(),
    );
  }
}

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
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
            AppRouter.NavigateToWidget(const LoginPage());
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
              "Forgot Password",
              style: TextStyle(
                fontSize: 35,
                color: Color(0xff313131),
              ),
            ),
            const Text(
              "Please enter your email below to recevie your password reset instructions",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff9b9b9b),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Mail ID",
              style: TextStyle(fontSize: 23),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'pangcheo1210@gmail.com',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: InkWell(
                onTap: openResetPassword,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xffF96060),
                  ),
                  child: const Text(
                    "Send Request",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void openResetPassword() {
  AppRouter.NavigateToWidget(ResetPassword());
}
