import 'dart:convert';

import 'package:app_weather/config/build_config.dart';
import 'package:app_weather/service/remote_api_service.dart';
import 'package:app_weather/util/settings.dart';

import 'package:http/http.dart' as http;

import '../model/city_model.dart';

class BaseApiService extends RemoteApiService{

  //https://api.weatherapi.com/v1/forecast.json?key=367cf3477e0345fa8d932522222409&q=21.05,105.73&days=5

  Future<Map<String,dynamic>> getWeatherWithLocation({required String lat, required String lon, String unit = "metric"}) async {
    try{
      final response = await dio.get("v1/current.json?key=${BuildConfig.apiKey}&q=$lat,$lon&lang=${Setting.currentLanguage.code}");
      print(response.data);
      return response.data as Map<String,dynamic>;
    }catch(e){
      throw handlerError(e);
    }
  }

  Future<Map<String,dynamic>> getWeatherForecast({required String lat, required String lon,int days = 7}) async {
    try{
      final response = await dio.get("v1/forecast.json?key=${BuildConfig.apiKey}&q=$lat,$lon&days=$days&aqi=yes&lang=${Setting.currentLanguage.code}");
      print(response.data);
      return response.data as Map<String,dynamic>;
    }catch(e){
      throw handlerError(e);
    }
  }


  Future<List<CityModel>> searchCitys({required String name}) async {
    String url = "https://api.api-ninjas.com/v1/city?name=$name";
    final headers = {
      "X-Api-Key":"x95in2nTxd0IoZ/2ssFWEA==EhTiU9F6pFxo28RX"
    };
    final response = await http.get(Uri.parse(url),headers: headers);
    final body = response.body;
    final jsonBody = jsonDecode(body);
    return (jsonBody as List).map((e) => CityModel.fromJson(e)).toList();

  }

  BaseApiService({bool check = true}) : super(check: check) ;
}