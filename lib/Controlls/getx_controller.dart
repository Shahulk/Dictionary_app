import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Model/data_model.dart';
import '../Radio_button.dart';

//
// class DictionaryController extends GetxController {}
//
// final DictionaryController controller = Get.put(DictionaryController());
final Box<DictonaryModel> dictionaryBox = Hive.box('dictionaryBox');

// Box dictionaryBox = Hive.box<DictonaryModel>('dictionaryBox');

var dictionaryList = <DictonaryModel>[].obs;
Rx<RadioValue> selectedRadioValue = RadioValue.startWith.obs;
var userInput = ''.obs;
var dictionaryDataMap = <String, List<dynamic>>{}.obs;

void englishWordList() {
  RegExp regEx;

  switch (selectedRadioValue.value) {
    case RadioValue.startWith:
      regEx = RegExp('^${userInput.value}');
      break;
    case RadioValue.endsWith:
      regEx = RegExp('${userInput.value}\$');
      break;
    default:
      regEx = RegExp(userInput.value);
  }
  dictionaryList.clear();
  dictionaryDataMap.clear();
  var result = dictionaryBox.values
      .where(
        (element) => element.Word.toLowerCase().contains(regEx),
      )
      .toList();
  dictionaryList.value = result;
  Set<String> dictionaryKeys = dictionaryDataMap.keys.toSet();


  // var dictionaryKeys = dictionaryDataMap.keys.toSet();
  for (var element in dictionaryList) {
    var Word = element.Word;
    if (dictionaryKeys.contains(Word)) {
      dictionaryDataMap [Word]
          !.add({'type': element.Part_of_speech, 'meaning': element.Meaning});
    } else {
      dictionaryDataMap[Word] = [
        {'type': element.Part_of_speech, 'meaning': element.Meaning}
      ];
      dictionaryKeys.add(Word);
    }
  }
}

void malayalamWordsList() {
  RegExp regEx;
  switch (selectedRadioValue.value) {
    case RadioValue.startWith:
      regEx = RegExp('^${userInput.value}');
      break;
    case RadioValue.endsWith:
      regEx = RegExp('${userInput.value}\$');
      break;
    default:
      regEx = RegExp(userInput.value);
  }
  // print(dictionaryDataMap);
  // print(userInput);
  dictionaryList.clear();
  dictionaryDataMap.clear();
  var result = dictionaryBox.values
      .where(
        (element) => element.Meaning.contains(regEx),
      )
      .toList();
  dictionaryList.value = result;
  if (userInput.value == '') {
    dictionaryList.clear();
    dictionaryDataMap.clear();
  }
  // Set<String> dictionaryKeys = dictionaryDataMap.keys.toSet();


  var dictionaryKeys = dictionaryDataMap.keys.toSet();
  for (var element in dictionaryList) {
    // var Meaning = element.Meaning;
    if (dictionaryKeys.contains(element.Meaning)) {
      dictionaryDataMap[element.Meaning]!.add({
        'type': element.Part_of_speech,
        'meaning': element.Word,
      });
    } else {
      dictionaryDataMap[element.Meaning] = [
        {
          'type': element.Part_of_speech,
          'meaning': element.Word,
        }
      ];
      // dictionaryKeys.add(Meaning);

    }
  }
}
