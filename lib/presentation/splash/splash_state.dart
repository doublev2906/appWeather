import 'package:app_weather/model/city_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashSate with _$SplashSate{
  factory SplashSate({
    @Default(null) CityModel? currentCity,
    @Default(false) bool navigateToMain,
  }) = _SplashSate;
}