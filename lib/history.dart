
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'definition.dart';

var EnghistoryMap = {}.obs;
var MalhistoryMap = {}.obs;
void historyPage(Color color) {
  Get.dialog(
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
              'History',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    if (color == Colors.blue){
                      EnghistoryMap.clear();
                    } else{
                      MalhistoryMap.clear();
                    }
                    // color == Colors.blue ? EnghistoryMap : MalhistoryMap;
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ))
            ]),
        body: Obx(
              () => ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  definitionPage(
                      color == Colors.blue
                          ? EnghistoryMap.keys.elementAt(index)
                          : MalhistoryMap.keys.elementAt(index),
                      color);
                },
                child: Card(
                  color: Colors.grey,
                  child: ListTile(
                    title: Text(
                      color == Colors.blue
                          ? EnghistoryMap.keys.elementAt(index)
                          : MalhistoryMap.keys.elementAt(index),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
            itemCount: color == Colors.blue
                ? EnghistoryMap.length
                : MalhistoryMap.length,
          ),
        ),
      ),
    ),
  );
}
