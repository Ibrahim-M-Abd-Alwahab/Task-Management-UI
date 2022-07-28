import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_manegment_app/CheckList.dart';
import 'package:task_manegment_app/NewNote.dart';
import 'package:task_manegment_app/NewTask.dart';
import 'package:task_manegment_app/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  String filtterType = "today";
  DateTime today = DateTime.now();
  var monthNames = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AGU",
    "SEPT",
    "OCT",
    "NOV",
    "DEC"
  ];
  String taskPop = "close";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                centerTitle: true,
                backgroundColor: const Color(0xfff96060),
                elevation: 0,
                title: const Text(
                  "Work List",
                  style: TextStyle(fontSize: 25),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.short_text,
                      size: 30,
                    ),
                  )
                ],
              ),
              Container(
                height: 70,
                color: const Color(0xfff96060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFiltter("today");
                          },
                          child: const Text(
                            "Today",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filtterType == "today")
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFiltter("monthly");
                          },
                          child: const Text(
                            "Monthly",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filtterType == "monthly")
                              ? Colors.white
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              (filtterType == "monthly")
                  ? TableCalendar(
                      firstDay: DateTime.utc(2022, 7, 27),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                      calendarFormat: _calendarFormat,
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                    )
                  : Container(),
              Expanded(
                // list of tasks
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "Today ${monthNames[today.month - 1]}, ${today.day}/${today.year}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                      taskWidget(
                        Color(0xfff96060),
                        "Metting with someone",
                        "9:00 AM",
                      ),
                      taskWidget(
                        Colors.green,
                        "Take Your Medicines",
                        "9:00 AM",
                      ),
                      taskWidget(
                        Colors.blue,
                        "Metting with someone",
                        "9:00 AM",
                      ),
                      taskWidget(
                        Color(0xfff96060),
                        "Metting with someone",
                        "9:00 AM",
                      ),
                      taskWidget(
                        Colors.green,
                        "Take Your Medicines",
                        "9:00 AM",
                      ),
                      taskWidget(
                        Colors.blue,
                        "Metting with someone",
                        "9:00 AM",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 110,
                child: Stack(children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xff292e4e),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(children: const [
                              Icon(Icons.check_circle, color: Colors.white),
                              SizedBox(height: 5),
                              Text("My Task",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14))
                            ]),
                          ),
                          Container(
                            child: Column(children: const [
                              Icon(Icons.menu, color: Colors.white),
                              SizedBox(height: 5),
                              Text("Menu",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14))
                            ]),
                          ),
                          Container(width: 80),
                          Container(
                            child: Column(children: const [
                              Icon(Icons.content_paste, color: Colors.white),
                              SizedBox(height: 5),
                              Text("Quick",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14))
                            ]),
                          ),
                          Container(
                            child: Column(children: const [
                              Icon(Icons.account_circle, color: Colors.white),
                              SizedBox(height: 5),
                              Text("Profile",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14))
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 0,
                    right: 0,
                    child: InkWell(
                      onTap: openTaskPop,
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xfff96060), Color(0xfff68888)]),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                            child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xffffffff),
                            letterSpacing: 0.24,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
          Container(
            child: (taskPop == "open")
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: InkWell(
                        onTap: closeTaskPop,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(
                                height: 1,
                              ),
                              InkWell(
                                onTap: openNewTask,
                                child: Container(
                                  child: const Text(
                                    "Add Task",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: openNewNote,
                                child: Container(
                                  child: const Text(
                                    "Add Quick Note",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: openNewCheckList,
                                child: Container(
                                  child: const Text(
                                    "Add Check List",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 1),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  openTaskPop() {
    taskPop = "open";
    setState(() {});
  }

  closeTaskPop() {
    taskPop = "close";
    setState(() {});
  }

  changeFiltter(String filtter) {
    filtterType = filtter;
    setState(() {});
  }

  Slidable taskWidget(Color customColor, String title, String time) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        // dismissible: DismissiblePane(onDismissed: () {
        //   setState(() {});
        // }),
        children: [
          SlidableAction(
            onPressed: (doNothing) {},
            backgroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (doNothing) {},
            backgroundColor: customColor,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: const Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1)
        ]),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: customColor, width: 4),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          Container(
            height: 50,
            width: 5,
            color: customColor,
          ),
        ]),
      ),
    );
  }
}

void openNewTask() {
  AppRouter.NavigateToWidget(const NewTask());
}

void openNewNote() {
  AppRouter.NavigateToWidget(const NewNote());
}

void openNewCheckList() {
  AppRouter.NavigateToWidget(const CheckList());
}
