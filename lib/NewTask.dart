import 'package:flutter/material.dart';
import 'package:task_manegment_app/HomePage.dart';
import 'package:task_manegment_app/router.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const newTask(),
    );
  }
}

class newTask extends StatefulWidget {
  const newTask({super.key});

  @override
  State<newTask> createState() => _newTaskState();
}

class _newTaskState extends State<newTask> {
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );
  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xfff96060),
        elevation: 0,
        title: const Text(
          "New Task",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
            onPressed: () {
              AppRouter.NavigateToWidget(const HomePage());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 30,
              color: const Color(0xfff96060),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black.withOpacity(0.8),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "For",
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: const Text(
                            "Assignee",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Text(
                          "In",
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: const Text(
                            "Project",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      color: Colors.grey.withOpacity(0.2),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Title",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Description",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5)),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                )),
                            child: const TextField(
                              maxLines: 6,
                              decoration: InputDecoration(
                                hintText: 'Add description here ',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.5))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.attach_file,
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(15),
                            color: Colors.grey.withOpacity(0.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Flexible(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Due Date',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: const Color(0xff6074F9)),
                                  onPressed: () {
                                    _restorableDatePickerRouteFuture.present();
                                  },
                                  child: const Text(
                                    'Any Time',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Add member",
                                  style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 0.16,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                  child: const Text(
                                    "Anyone",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xfff96060)),
                            child: const Center(
                              child: Text(
                                "Add Task",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
