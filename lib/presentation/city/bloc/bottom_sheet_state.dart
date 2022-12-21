import 'package:app_weather/model/city_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'bottom_sheet_state.freezed.dart';


@freezed
class BottomSheetState with _$BottomSheetState{
  factory BottomSheetState({
    @Default(BottomSheetStatus.none)BottomSheetStatus status,
    @Default([])List<CityModel> result,
    }) = _BottomSheetState;
}
enum BottomSheetStatus {loading,none,onSearch,onSearchResult}