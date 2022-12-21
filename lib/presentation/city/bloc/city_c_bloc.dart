import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/model/item.dart';
import 'package:app_weather/presentation/city/city_page.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:app_weather/presentation/splash/splash_cubit.dart';
import 'package:app_weather/util/box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../common/injector.dart';
import '../../home/bloc/home_cubit.dart';
import 'city_c_state.dart';



class CityCBloc extends Cubit<CityCState>{
  CityCBloc(): super(CityCState(status: CityCStateStatus.none));

  getData() async {

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
    emit(state.copyWith(data: listData));
  }
  addData(Item data){
    emit(state.copyWith(data: [...state.data,data]));
  }
  removeData(){
    final data = [...state.data];
    data.removeWhere((e){
      if(e.isChecked){
        sl.get<MainPageBloc>().removeData(e.data);
        if(e.isSelected){
          e.isSelected = false;
          e.save();
        }else{
          e.data.delete();
        }
      }
      return e.isChecked;
    });
    emit(state.copyWith(data: [...data]));
  }

  selectAll(bool isSelectedAll){
    final data = state.data;
    if(isSelectedAll){
      for (var e in data) {
        e.isChecked = true;
      }
    }else{
      for (var e in data) {
        e.isChecked = false;
      }
    }
    emit(state.copyWith(selectedAll: isSelectedAll, data: [...data],selectedItem: isSelectedAll?data.length:0));
  }
  
  increaseSelectedItem(){
    int quantity = state.selectedItem + 1;
    emit(state.copyWith(selectedItem: quantity));
  }
  decreaseSelectedItem(){
    int quantity = state.selectedItem - 1;
    if(quantity < 0) quantity = 0;
    emit(state.copyWith(selectedItem: quantity));
  }
  resetSelectedItem(){
    final data = state.data;
    for (var e in data) {
      e.isChecked = false;
    }
    emit(state.copyWith(selectedItem: 0,data: [...data],selectedAll: false));
  }

}