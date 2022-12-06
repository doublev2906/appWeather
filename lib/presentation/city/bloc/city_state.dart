import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/city_model.dart';
part 'city_state.freezed.dart';

@freezed
abstract class CityState with _$CityState {
  const factory CityState(List<CityModel> data) = CityStateData;
  const factory CityState.loading() = CityStateLoading;
  const factory CityState.error(dynamic error) = CityStateError;
}
