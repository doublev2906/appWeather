import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/item.dart';
part 'city_c_state.freezed.dart';


@freezed
class CityCState with _$CityCState{
  factory CityCState({
    @Default(CityCStateStatus.none)CityCStateStatus status,
    @Default([])List<Item> data,
    @Default(false)bool selectedAll,
    @Default(0) int selectedItem}) = _CityCState;
}
enum CityCStateStatus {showCheckBox,none}
