import 'package:app_weather/generated/l10n.dart';
import 'package:app_weather/model/language_entity.dart';
import 'package:app_weather/util/box.dart';
import 'package:hive/hive.dart';


class Setting{
  static List<LanguageEntity>  supportLanguage = [
    LanguageEntity("en", "English"),
    LanguageEntity("vi", "Vietnamese")
  ];
  static LanguageEntity currentLanguage = LanguageEntity("en", "English");
  static init(LanguageEntity? languageEntity){
    if(languageEntity != null){
      currentLanguage = languageEntity;
    }else{
      Boxes.getLanguage().add(currentLanguage);
    }
  }
  static String get currentCode => currentLanguage.code;

}
