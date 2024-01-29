import 'package:csv/csv.dart';
import 'package:dictionary_app/Model/data_model.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

final Box<DictonaryModel> dictionaryBox =
    Hive.box<DictonaryModel>('dictionaryBox');
List<List<dynamic>> data = [];

Future<void>loadAsset() async {
  if (dictionaryBox.isEmpty) {
    // print(dictionaryBox.length);
    final Mydata = await rootBundle.loadString("assets/olam-enml.csv");

    data = const CsvToListConverter().convert(Mydata, fieldDelimiter: '\t');
    for (int i = 1; i < data.length; i++) {
      final value = DictonaryModel(
          Word: data[i][1].toString().toLowerCase(),
          Part_of_speech: data[i][2].toString().toLowerCase(),
          Meaning: data[i][3].toString().toLowerCase(),);

     await dictionaryBox.add(value);
    }
    // print(dictionaryBox.length);
  } else {}
}
