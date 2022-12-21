import 'package:hive/hive.dart';

import 'city_model.dart';

part 'item.g.dart';


@HiveType(typeId: 1)
class Item extends HiveObject{

  @HiveField(0)
  bool isChecked;
  @HiveField(2)
  bool isSelected;
  @HiveField(1)
  final CityModel data;

  Item({this.isChecked = false,this.isSelected = false ,required this.data});
}