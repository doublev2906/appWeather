import 'package:app_weather/model/item.dart';
import 'package:app_weather/presentation/city/bloc/bottom_sheet_bloc.dart';
import 'package:app_weather/presentation/city/bloc/bottom_sheet_state.dart';
import 'package:app_weather/presentation/city/bloc/city_c_bloc.dart';
import 'package:app_weather/presentation/city/widget/search_widget.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:app_weather/util/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetSearch extends StatefulWidget {
  const BottomSheetSearch({Key? key}) : super(key: key);

  @override
  _BottomSheetSearchState createState() => _BottomSheetSearchState();
}

class _BottomSheetSearchState extends State<BottomSheetSearch> {
  late BottomSheetBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = BottomSheetBloc();
  }

  @override
  Widget build(BuildContext context) {
    var topCites = Boxes.getTopCities().values.toList().cast<Item>();
    var topCitesWorld = Boxes.getTopCitiesWorld().values.toList().cast<Item>();

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<BottomSheetBloc, BottomSheetState>(
          bloc: bloc,
          builder: (context, state) {
            return WillPopScope(

              onWillPop: () {
                if(state.status == BottomSheetStatus.onSearchResult){
                  bloc.onStatusNone();
                  return Future.value(false);
                }
                return Future.value(true);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.95,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: _buildHandle(context),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Center(
                      child: Text(
                        "Add City",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SearchWidget(
                        onChanged: (text) {
                          if (text.isNotEmpty) {
                            bloc.onSearch();
                          } else {
                            bloc.onStatusNone();
                          }
                        },
                        onSubmit: (text) {
                          bloc.onSearching(text);
                        },
                        hintText: "Search for city"),
                    const SizedBox(
                      height: 24,
                    ),
                    Visibility(
                        visible: state.status == BottomSheetStatus.onSearch ||
                            state.status == BottomSheetStatus.loading,
                        child: Center(
                          child: state.status == BottomSheetStatus.onSearch
                              ? const Text(
                                  "Tap Search to start searching.",
                                  style: TextStyle(color: Colors.grey),
                                )
                              : const CircularProgressIndicator(),
                        )),
                    Visibility(
                      visible: state.status == BottomSheetStatus.onSearchResult,
                        child: Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: (){
                                state.result[i].timeAdd = DateTime.now().millisecondsSinceEpoch;
                                Boxes.getCitys().add(state.result[i]);
                                context.read<CityCBloc>().addData(Item(data: state.result[i]));
                                context.read<MainPageBloc>().addData( state.result[i]);
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                margin:const EdgeInsets.only(left: 12),
                                child: Text(
                                  state.result[i].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.lightBlue),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, i) => const SizedBox(
                                height: 4,
                              ),
                          itemCount: state.result.length),
                    )),
                    Visibility(
                      visible: state.status == BottomSheetStatus.none,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildListCity("TOP CITIES", topCites),
                          const SizedBox(height: 16),
                          buildListCity("TOP CITIES - WORLD", topCitesWorld),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.08,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 2,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }

  Widget buildListCity(String title, List<Item> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Wrap(
          children: data
              .map((e) => Container(
                    margin: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        backgroundColor: const Color(0xffF0F0F0),
                        label: Text(
                          e.data.name,
                          style: TextStyle(
                              color: e.isSelected ? Colors.white : Colors.black,
                              fontWeight: e.isSelected
                                  ? FontWeight.w500
                                  : FontWeight.w400),
                        ),
                        selectedColor: Colors.black,
                        onSelected: (selected) {
                          e.isSelected = true;
                          e.data.timeAdd = DateTime.now().microsecondsSinceEpoch;
                          e.save();
                          context.read<CityCBloc>().addData(Item(data: e.data));
                          context.read<MainPageBloc>().addData(e.data);
                          Navigator.of(context).pop();
                        },
                        selected: e.isSelected),
                  ))
              .toList(),
        )
      ],
    );
  }
}
