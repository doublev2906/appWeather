import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/model/current_weather_model.dart';
import 'package:app_weather/presentation/city/bloc/city_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../service/base_api_service.dart';



class CityBloc extends Cubit<CityState>{
  CityBloc() : super( const CityState.loading());
  final baseApiService = BaseApiService(check: true);
  int selectedItem = 0;


  init(CityModel data) async {
    try{
      final response = await baseApiService.getWeatherWithLocation(lat: data.latitude.toString(), lon:data.longitude.toString());
      final mData = CurrentWeatherModel.fromJson(response);
      emit(CityStateData(mData));

    }catch(e){
      emit(CityState.error(e));
    }
  }
  initData() async{

  }

}