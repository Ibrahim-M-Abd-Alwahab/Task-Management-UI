import 'package:flutter/material.dart';
import 'package:task_manegment_app/ForgotPassword.dart';
import 'package:task_manegment_app/HomePage.dart';
import 'package:task_manegment_app/Onboarding.dart';
import 'package:task_manegment_app/router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: loginPage(),
    );
  }
}

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // To Remove App Bar Shadow
        backgroundColor: Colors.transparent, // شفاف
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff000000),
          ),
          onPressed: () {
            AppRouter.NavigateToWidget(onboarding());
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
              "Welcome back!",
              style: TextStyle(
                fontSize: 35,
                color: Color(0xff313131),
              ),
            ),
            const Text(
              "Sign in to continue...",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff9b9b9b),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Username",
              style: TextStyle(fontSize: 23),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'John Doe',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Password",
              style: TextStyle(fontSize: 23),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your password here',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: openForgotPassword,
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xffF96060),
                  ),
                  child: InkWell(
                    onTap: openHomePage,
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
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

  void openForgotPassword() {
    AppRouter.NavigateToWidget(const ForgotPassword());
  }
  void openHomePage() {
    AppRouter.NavigateToWidget(const HomePage());
  }
}
