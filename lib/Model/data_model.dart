import 'package:hive/hive.dart';

part 'data_model.g.dart';

@HiveType(typeId: 1)
class DictonaryModel {
  @HiveField(0)
  final String Word;

  @HiveField(1)
  final String Part_of_speech;

  @HiveField(2)
  final String Meaning;

  DictonaryModel(
      {required this.Word,
      required this.Meaning,
      required this.Part_of_speech});
}
