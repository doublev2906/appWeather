import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/model/item.dart';
import 'package:app_weather/model/language_entity.dart';
import 'package:app_weather/presentation/city/city_page.dart';
import 'package:app_weather/util/settings.dart';
import 'package:hive/hive.dart';


class Boxes{
  static Box<CityModel> getCitys() => Hive.box<CityModel>('citys');
  static Box<Item> getTopCities() => Hive.box<Item>('topCities');
  static Box<Item> getTopCitiesWorld() => Hive.box<Item>('topCitiesWorld');
  static Box<LanguageEntity?> getLanguage() => Hive.box<LanguageEntity?>('currentLanguage');
}