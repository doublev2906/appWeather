import '../generated/l10n.dart';

String getAirQualityText(int index){
  switch(index){
    case 1:
      return S.current.level1;
    case 2:
      return S.current.level2;
    case 3:
      return S.current.level3;
    case 4:
      return S.current.level4;
    case 5:
      return S.current.level5;
    case 6:
      return S.current.level6;
  }
  return "";
}