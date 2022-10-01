import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_tracker/util/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List habitList = [
    ["coding", false, 0, 1],
    ["Read", false, 0, 10],
    ["Exercise", false, 0, 10],
    ["die", false, 0, 10],
  ];

  void habitStarted(int index) {
    var startTime = DateTime.now();
    int spentTime = habitList[index][2];
    setState(
      () {
        habitList[index][1] = !habitList[index][1];
      },
    );
    if (habitList[index][1]) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (!habitList[index][1]) {
            timer.cancel();
          }
          var cureentTime = DateTime.now();
          habitList[index][2] = spentTime +
              cureentTime.second -
              startTime.second +
              60 * (cureentTime.minute - startTime.minute) +
              60 * 60 * (cureentTime.hour - startTime.hour);
        });
      });
    }
  }

  void settingOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Setting for " + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Habit tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: ((context, index) {
            return HabitTile(
                timeGoal: habitList[index][3],
                timeSpent: habitList[index][2],
                habitName: habitList[index][0],
                habitStarted: habitList[index][1],
                ontap: () {
                  habitStarted(index);
                },
                settingsTapped: () {
                  settingOpened(index);
                });
          })),
    );
  }
}
