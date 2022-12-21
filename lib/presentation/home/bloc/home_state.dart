import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState(Map<String,dynamic> data, String location) = HomeStateData;
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.error(dynamic error) = HomeStateError;
  const factory HomeState.nonePerMission(String message) = HomeStateNonePerMission;
}
