import 'package:dictionary_app/Controlls/db_control.dart';
import 'package:dictionary_app/Model/data_model.dart';
import 'package:dictionary_app/Pages/english.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'Pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DictonaryModelAdapter().typeId)) {
    Hive.registerAdapter(DictonaryModelAdapter());
  }
  ;
  await Hive.openBox<DictonaryModel>('dictionaryBox');
  loadAsset();
  runApp(
    const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: Englishpage()),
  );
}
