import 'package:app_weather/common/injector.dart';
import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/model/item.dart';
import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:app_weather/presentation/splash/splash_state.dart';
import 'package:app_weather/util/box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';



class SplashCubit extends Cubit<SplashSate>{
  SplashCubit() : super(SplashSate());


  init() async {
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition();
    final place = await placemarkFromCoordinates(position.latitude,position.longitude);
    final currentCity = CityModel(name: place[4].name??"", latitude: position.latitude, longitude: position.longitude);
    emit(state.copyWith(currentCity: currentCity,navigateToMain: true));
  }

}