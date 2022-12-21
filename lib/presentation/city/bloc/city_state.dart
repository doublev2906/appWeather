import 'package:app_weather/model/current_weather_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_state.freezed.dart';

@freezed
abstract class CityState with _$CityState {
  const factory CityState(CurrentWeatherModel data) = CityStateData;
  const factory CityState.loading() = CityStateLoading;
  const factory CityState.error(dynamic error) = CityStateError;
}
