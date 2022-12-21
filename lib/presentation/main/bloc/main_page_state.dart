import 'package:app_weather/model/city_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_page_state.freezed.dart';

@freezed
class MainPageSate with _$MainPageSate{
  factory MainPageSate({
    @Default(0) int index,
    @Default([]) List<CityModel> cities,
    @Default(false) bool showIndicator,
    @Default(false) bool isDay,
  }) = _MainPageSate;
}