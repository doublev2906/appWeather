import 'package:app_weather/common/injector.dart';
import 'package:app_weather/generated/l10n.dart';
import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/model/item.dart';
import 'package:app_weather/model/language_entity.dart';
import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:app_weather/presentation/splash/splash_state.dart';
import 'package:app_weather/util/box.dart';
import 'package:app_weather/util/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';



class SplashCubit extends Cubit<SplashSate>{
  SplashCubit() : super(SplashSate());


  init() async {
    try{
      await Geolocator.requestPermission();
      final position = await Geolocator.getCurrentPosition();
      final place = await placemarkFromCoordinates(position.latitude,position.longitude);
      print(place);
      final currentCity = CityModel(name:place[0].name??"", latitude: position.latitude, longitude: position.longitude);
      emit(state.copyWith(currentCity: currentCity,navigateToMain: true));
    }catch(e){
      print(e);
    }

  }

}