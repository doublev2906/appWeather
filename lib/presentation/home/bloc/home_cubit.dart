import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:app_weather/service/base_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../common/injector.dart';
import 'home_state.dart';



class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super( const HomeState.loading());
  final baseApiService = BaseApiService(check: true);
  final geolocatorPlatform = GeolocatorPlatform.instance;
  CityModel? currentCity;


  init(CityModel city) async {
    emit(const HomeState.loading());
    sl.get<MainPageBloc>().hideIndicator();
    try{
      final checkPermission = await handlerPermission();
      if(checkPermission){
        final data = await baseApiService.getWeatherForecast(lat: city.latitude.toString(), lon:city.longitude.toString());
        emit(HomeStateData(data,city.name));
        sl.get<MainPageBloc>().showIndicator();
      }
    }catch(e){
      emit(HomeState.error(e));
    }
  }

  Future<bool> handlerPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(const HomeState.nonePerMission("Chưa được cấp quyền truy cập vị trí"));
        return false;
      }else if(permission == LocationPermission.deniedForever){
        emit(const HomeState.nonePerMission("Chưa được cấp quyền truy cập vị trí"));
        return false;
      }else{
        return true;
      }
    }else{
      return true;
    }
  }

}