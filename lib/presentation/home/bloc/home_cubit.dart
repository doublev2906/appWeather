import 'package:app_weather/service/base_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'home_state.dart';



class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super( const HomeState.loading());
  final baseApiService = BaseApiService(check: false);
  final geolocatorPlatform = GeolocatorPlatform.instance;


  init() async {
    emit(const HomeState.loading());
    try{
      final checkPermission = await handlerPermission();
      if(checkPermission){
        //21.03731702717133, 105.78255499661951
        //21.4040773976114, 106.13697655556724
        final position = await Geolocator.getCurrentPosition();
        final place = await placemarkFromCoordinates(position.latitude,position.longitude);
        // final data = await baseApiService.getWeatherWithLocation(lat: position.latitude.toString(), lon:position.longitude.toString());
        final data = await baseApiService.getCurrentLocation(lat: position.latitude.toString(), lon:position.longitude.toString());
        emit(HomeStateData(data));
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