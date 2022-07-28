// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:task_manegment_app/HomePage.dart';
import 'package:task_manegment_app/router.dart';

class PasswordChangedSuccessfully extends StatelessWidget {
  const PasswordChangedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const passwordChangedSuccessfully(),
    );
  }
}

class passwordChangedSuccessfully extends StatefulWidget {
  const passwordChangedSuccessfully({super.key});

  @override
  State<passwordChangedSuccessfully> createState() =>
      pPasswordChangedSuccessfullyState();
}

class pPasswordChangedSuccessfullyState
    extends State<passwordChangedSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/success.png')),
              )),
          const Text("Succesful!", style: TextStyle(fontSize: 35)),
          const Text(
            "You have succesfully changed our password.\n Please use your new passwords to login!",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70),
          Center(
            child: InkWell(
              onTap: () {
                openHomePage();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                decoration: BoxDecoration(
                    color: const Color(0xffF96060),
                    borderRadius: BorderRadius.circular(7)),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openHomePage() {
    AppRouter.NavigateToWidget(const HomePage());
  }
}
