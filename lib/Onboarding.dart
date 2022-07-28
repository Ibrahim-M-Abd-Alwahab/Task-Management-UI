import 'package:flutter/material.dart';
import 'package:task_manegment_app/LoginPage.dart';
import 'package:task_manegment_app/router.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: onboarding(),
    );
  }
}

class onboarding extends StatefulWidget {
  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage:
        true, // Save the current [page] with [PageStorage] and restore it if this controller's scrollable is recreated.
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onboard1", "Welcome to Aking",
                        "Whats going to happen tomorrow?"),
                    onBoardPage("onboard2", "Work Happens",
                        "Get notified when work happens."),
                    onBoardPage("onboard3", "Task and Assignments",
                        "Task and assign them to colleagues."),
                  ],
                  onPageChanged: (value) {
                    setCurrentPage(value);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/path1.png'),
                fit: BoxFit.fill,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: openLoginPage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 3,
                              offset: const Offset(0, 9),
                            )
                          ]),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: openLoginPage,
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        fontFamily: 'AvenirNextRoundedPro-Demi',
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      duration: const Duration(
        milliseconds: 100,
      ),
      decoration: BoxDecoration(
        color: (currentPage == pageNo) ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Column onBoardPage(String img, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$img.png'),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  openLoginPage() {
    AppRouter.NavigateToWidget(LoginPage());
  }
}
