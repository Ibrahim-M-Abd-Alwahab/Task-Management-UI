import 'dart:async';
import 'package:task_manegment_app/router.dart';
import 'package:flutter/material.dart';
import 'package:task_manegment_app/Onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.navKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), openOnBoard); // call back function
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
      ),
    );
  }
}

void openOnBoard() {
  AppRouter.NavigateToWidget(Onboarding());
}
