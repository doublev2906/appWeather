import 'package:app_weather/common/injector.dart';
import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/model/item.dart';
import 'package:app_weather/presentation/main/bloc/main_page_state.dart';
import 'package:app_weather/presentation/splash/splash_cubit.dart';
import 'package:app_weather/util/box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MainPageBloc extends Cubit<MainPageSate>{
  MainPageBloc() : super(MainPageSate());


  init() async {
    final citys = Boxes.getCitys().values.toList().cast<CityModel>();
    var topCites = Boxes.getTopCities().values.toList().cast<Item>();
    var topCitesWorld = Boxes.getTopCitiesWorld().values.toList().cast<Item>();
    final currentCity = sl.get<SplashCubit>().state.currentCity!;
    final listData = citys.map((e) => Item(data: e)).toList();
    listData.addAll(topCites.where((e) => e.isSelected));
    listData.addAll(topCitesWorld.where((e) => e.isSelected));
    listData.sort((o1,o2){
      return o1.data.timeAdd .compareTo(o2.data.timeAdd);
    });
    listData.insert(0, Item(data: currentCity));
    final cityData = listData.map((e) => e.data).toList();
    emit(state.copyWith(cities: cityData));

  }

  addData(CityModel city){
    emit(state.copyWith(cities: [...state.cities,city]));
  }
  changePage(int index){
    emit(state.copyWith(index: index));
  }

  hideIndicator(){
    emit(state.copyWith(showIndicator: false));
  }
  showIndicator(){
    emit(state.copyWith(showIndicator: true));
  }
  setDay(bool isDay){
    emit(state.copyWith(isDay: isDay));
  }

  removeData(CityModel city){
    final data = [...state.cities];
    data.removeWhere((e){
        return city.timeAdd == e.timeAdd;
      });

    emit(state.copyWith(cities: [...data],index: 0));
  }
}