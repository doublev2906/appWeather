
import 'package:hive_flutter/hive_flutter.dart';

part 'language_entity.g.dart';

@HiveType(typeId: 2)
class LanguageEntity extends HiveObject{
  @HiveField(0)
  String code;
  @HiveField(1)
  String value;

  LanguageEntity(this.code, this.value);
}