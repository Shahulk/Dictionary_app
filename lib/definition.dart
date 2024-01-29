// import 'package:dictionary/controller/searchcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Controlls/getx_controller.dart';
import 'Model/data_model.dart';
import 'history.dart';

final Box<DictonaryModel> dictionaryBox = Hive.box('dictionaryBox');

void definitionPage(var id, Color color) async {
  var data;
  if (dictionaryDataMap.containsKey(id)) {
    data = dictionaryDataMap[id];
    // print(data);
  }
  if (color == Colors.blue) {
    if (EnghistoryMap.keys.contains(id)) {
    } else {
      EnghistoryMap[id] = data;
    }
  } else {
    if (MalhistoryMap.keys.contains(id)) {
    } else {
      MalhistoryMap[id] = data;
    }
  }
  await Get.dialog(Padding(
    padding: const EdgeInsets.all(20),
    child: Scaffold(
      appBar: AppBar(
        title: Text(
          '\'$id\' meaning',
          softWrap: true,
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      String partOfSpeechText = data[index]['type'];
                      switch (partOfSpeechText) {
                        case 'n ':
                          partOfSpeechText = 'noun';
                          break;
                        case 'phr':
                          partOfSpeechText = 'phrase';
                          break;
                        case 'idm':
                          partOfSpeechText = 'idiom';
                          break;
                        case 'a':
                          partOfSpeechText = 'Adjective';
                          break;
                        case 'v':
                          partOfSpeechText = 'verb';
                          break;
                      }
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text('${data[index]['meaning']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            ),
                            Expanded(child: Text(partOfSpeechText,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold) ,),),
                          ],
                        ),
                      );
                    }))),
      ]),
    ),
  ));
}
