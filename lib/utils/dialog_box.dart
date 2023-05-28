import 'package:fcb_donate/utils/button.dart';
import 'package:fcb_donate/utils/costom_textfield.dart';
import 'package:flutter/material.dart';
class MyDialogBox extends StatefulWidget {
  const MyDialogBox({super.key});

  @override
  State<MyDialogBox> createState() => _MyDialogBoxState();
}

class _MyDialogBoxState extends State<MyDialogBox> {
  TextEditingController addDateController = TextEditingController();
  mydialog() {
    showDialog(
      builder: (
        context,
      ) {
        return AlertDialog(
          content: Column(children: [
            CustomTextField(
                hintText: "Add Date", controller: addDateController),
            CustomTextField(
                hintText: "Add Date", controller: addDateController),
          ]),
          actions: [CustomButton(widget: const Text("Send"))],
        );
      },
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return mydialog();
  }
}
