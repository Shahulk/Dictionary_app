import 'package:dictionary_app/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controlls/getx_controller.dart';
import 'english.dart';

class malayalamScreen extends StatelessWidget {
  const malayalamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Home(
        color: Colors.black,
        appBarText: 'മലയാളം -> English ...',
        textField: 'മലയാളത്തിൽ ടൈപ്പ് ചെയ്യുക',
        pageRoute: () {
          Get.off(
            () => const Englishpage(),
          );
          dictionaryList.clear();
          userInput.value = '';
          dictionaryDataMap.clear();

        },
        listData: malayalamWordsList,
      ),
    );
  }
}
