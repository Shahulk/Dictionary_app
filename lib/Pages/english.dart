import 'package:dictionary_app/Controlls/db_control.dart';
import 'package:dictionary_app/Controlls/getx_controller.dart';
import 'package:dictionary_app/Pages/home.dart';
import 'package:dictionary_app/Pages/malayalam.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Englishpage extends StatelessWidget {
  const Englishpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Home(
        color: Colors.blue,
        appBarText: 'English -> മലയാളം ````',
        textField: 'type english word',
        pageRoute: () {
          Get.off(() => const malayalamScreen());
          dictionaryList.clear();
          dictionaryDataMap.clear();
          userInput.value = '';
        },
        listData: englishWordList,
      ),
    );
  }
}
