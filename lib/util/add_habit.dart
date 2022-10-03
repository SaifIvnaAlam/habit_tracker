import 'package:flutter/material.dart';

class NewHabit extends StatelessWidget {
  final controller;
  // final timeController;
  VoidCallback onSave;
  NewHabit({
    Key? key,
    required this.controller,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      content: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "New Habit Name",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Habit duration",
                    suffix: Text('Min'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onSave, child: const Text("Add")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancle"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
