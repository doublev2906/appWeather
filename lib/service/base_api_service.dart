import 'package:app_weather/config/build_config.dart';
import 'package:app_weather/service/remote_api_service.dart';

class BaseApiService extends RemoteApiService{

  //https://api.weatherapi.com/v1/forecast.json?key=367cf3477e0345fa8d932522222409&q=21.05,105.73&days=5

  Future<Map<String,dynamic>> getWeatherWithLocation({required String lat, required String lon, String unit = "metric"}) async {
    try{
      final response = await dio.get("v1/current.json?key=${BuildConfig.apiKey}&q=$lat,$lon");
      print(response.data);
      return response.data as Map<String,dynamic>;
    }catch(e){
      throw handlerError(e);
    }
  }

  Future<Map<String,dynamic>> getWeatherForecast({required String lat, required String lon,int days = 7}) async {
    try{
      final response = await dio.get("v1/forecast.json?key=${BuildConfig.apiKey}&q=$lat,$lon&days=$days");
      print(response.data);
      return response.data as Map<String,dynamic>;
    }catch(e){
      throw handlerError(e);
    }
  }


  Future<Map<String,dynamic>> getCurrentLocation({required String lat, required String lon, String unit = "metric"}) async {
    try{
      final response = await dio.get("data/2.5/weather?lat=$lat&lon=$lon&appid=${BuildConfig.apiKey1}&units=$unit");
      return response.data as Map<String,dynamic>;
    }catch(e){
      throw handlerError(e);
    }
  }

  BaseApiService({bool check = true}) : super(check: check) ;
}