import 'package:dictionary_app/Controlls/getx_controller.dart';
import 'package:dictionary_app/Pages/english.dart';
import 'package:dictionary_app/Pages/malayalam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RadioValue { startWith, contains, endsWith }

class RadioButton extends StatelessWidget {

  final String radioButtonText;
  final RadioValue value;
  final Color color;

   const RadioButton({
    Key?key,
    required this.radioButtonText,
    required this.value,
    required this.color,
  });


  @override
  Widget build(BuildContext context) {
    return Obx(() => RadioListTile(
        title: Text(radioButtonText),
        value: value,
        groupValue: selectedRadioValue.value,
        onChanged: (value) {
          selectedRadioValue.value = value!;
          color == Colors.blue? englishWordList(): malayalamWordsList();
          // print(value);
          // print(selectedRadioValue.value);
        },
      // activeColor: color,

    ));
  }
}
