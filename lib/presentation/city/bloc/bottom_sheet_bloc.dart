import 'package:app_weather/presentation/city/bloc/bottom_sheet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/base_api_service.dart';



class BottomSheetBloc extends Cubit<BottomSheetState>{
  BottomSheetBloc() : super(BottomSheetState());
  final baseApiService = BaseApiService(check: true);


  onSearch(){
    emit(state.copyWith(status: BottomSheetStatus.onSearch));
  }
  onStatusNone(){
    emit(state.copyWith(status: BottomSheetStatus.none));
  }

  onSearching(String cityName) async {
    emit(state.copyWith(status: BottomSheetStatus.loading,result: []));
    final data = await baseApiService.searchCitys(name: cityName);
    emit(state.copyWith(status: BottomSheetStatus.onSearchResult,result: data));
  }

}