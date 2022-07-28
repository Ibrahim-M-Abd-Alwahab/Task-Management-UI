import 'package:flutter/material.dart';
import 'package:task_manegment_app/HomePage.dart';
import 'package:task_manegment_app/router.dart';

class CheckList extends StatelessWidget {
  const CheckList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: const checkList(),
    );
  }
}

class checkList extends StatefulWidget {
  const checkList({super.key});

  @override
  State<checkList> createState() => _checkListState();
}

class _checkListState extends State<checkList> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xfff96060),
        elevation: 0,
        title: const Text(
          "Add Check List",
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
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Title",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Lorem ipsum dolor sit amet,consectetur adipiscing elit.",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 20),
                            CheckboxListTile(
                              title: const Text('List Item 1'),
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 5),
                            CheckboxListTile(
                              title: const Text('List Item 2'),
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 5),
                            CheckboxListTile(
                              title: const Text('List Item 3'),
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 5),
                            CheckboxListTile(
                              title: const Text('List Item 4'),
                              value: _isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(height: 20),
                            const Text(
                              "Color",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.pink,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xfff4ca8f),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xff3d3a62),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xfff96060)),
                              child: const Center(
                                child: Text(
                                  "Done",
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
