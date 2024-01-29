import 'package:dictionary_app/Model/data_model.dart';
import 'package:dictionary_app/Controlls/db_control.dart';
import 'package:dictionary_app/Radio_button.dart';
import 'package:dictionary_app/definition.dart';
import 'package:dictionary_app/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Controlls/getx_controller.dart';

class Home extends StatelessWidget {
  final Color color;
  final String appBarText;
  final String textField;
  final VoidCallback pageRoute;
  final Function listData;

  //
  Home({
    required this.color,
    required this.appBarText,
    required this.textField,
    required this.pageRoute,
    required this.listData,
  });

  RadioValue selectedRadio = RadioValue.startWith;

  // Future<void> DictionaryBox() async {
  //   await Hive.openBox<DictonaryModel>('dictionaryBox');
  // }

  @override
  Widget build(BuildContext context) {
    final TextEditingController myController = TextEditingController();
    userInput.value = '';
    return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.grey,
          child: Center(child: Text("Eng->മലയാളം  Dictionary",style: TextStyle(fontSize: 35),)),
        ),
        appBar: AppBar(
          backgroundColor: color,
          toolbarHeight: 100,
          title: Text(
            appBarText,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: color == Colors.blue ? () {} : pageRoute,
                    style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text(
                      "Eng->മലയാളം",
                      style: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: color == Colors.white ? () {} : pageRoute,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text(
                      "മലയാളം->Eng",
                      style: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 40),
              child: IconButton(
                  onPressed: () {
                    Get.defaultDialog(title: 'Share');
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 25,
                    color: Colors.yellow,
                  )),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Obx(
                () => ListView.builder(
                    itemCount: dictionaryDataMap.length,
                    itemBuilder: (context, index) {
                      final data = dictionaryDataMap.keys.elementAt(index);
                      // print(data.Word);
                      return GestureDetector(
                        onTap: () {
                          definitionPage(data, color);
                        },
                        child: Card(
                          margin: EdgeInsets.all(4),
                          elevation: 1,
                          child: ListTile(
                            title: Text(data),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Container(
                height: 80,
                width: double.infinity,
                color: color,
                alignment: Alignment.centerLeft,
                child: Obx(
                  ()=> Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            historyPage(color);
                          },
                            icon: const Icon(
                            Icons.history,
                            size: 30,
                            color: Colors.white,
                          )),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('^ ')),
                          ],
                          controller: myController,
                          onChanged: (value) {
                            userInput.value = value;
                            listData();
                            // print(dictionaryDataMap);
                          },
                          decoration: InputDecoration(
                              hintText: textField,
                              hintStyle: const TextStyle(fontSize: 15),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        ),
                      ),
                      userInput.isEmpty?
                           Expanded(
                              // flex: 10,
                              child: IconButton(
                              icon: const Icon(
                                Icons.keyboard_voice_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.defaultDialog(
                                  title: "tell something"
                                );
                                // loadAsset();
                              },
                            )):
                         Expanded(
                              child: IconButton(
                              onPressed: () {
                                dictionaryList.clear();
                                dictionaryDataMap.clear();
                                myController.clear();
                                userInput.value = '';
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            )),
                  
                    ],
                  
                  ),
                )),
            Row(
              children: [
                Flexible(
                  child: RadioButton(
                    radioButtonText: 'startWith',
                    value: RadioValue.startWith,
                    color: color,
                  ),
                ),
                Expanded(
                    child: RadioButton(
                        radioButtonText: 'contains',
                        value: RadioValue.contains,
                        color: color)),
                Expanded(
                    child: RadioButton(
                  radioButtonText: 'endsWith',
                  value: RadioValue.endsWith,
                  color: color,
                )),
              ],
            )
          ],
        ));
  }
}
