import 'package:app_weather/model/current_weather_model.dart';
import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:app_weather/presentation/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../model/forecast_weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _bloc;
  var top = 0.0;
  final scrollController = ScrollController();
  bool isCollaspAppbar = false;

  @override
  void initState() {
    super.initState();
    _bloc = HomeCubit()
      ..init();
  }

  bool isAppBarExpanded() {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: _bloc,
          builder: (context, state) {
            return state.when((data, location) {
              final mData = ForecastWeatherModel.fromJson(data);
              final currentTime = DateFormat("MMM d EE").format(DateTime.now());
              final listHours = calculateHourArray(mData);
              return DefaultTextStyle(
                style: const TextStyle(color: Colors.white),

                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.lightBlueAccent,
                      ),
                      CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverLayoutBuilder(builder: (context, mConstraints) {
                            final scrolled = mConstraints.scrollOffset >
                                (180 - kToolbarHeight);
                            return SliverAppBar(
                                expandedHeight: 180.0,
                                floating: false,
                                pinned: true,
                                backgroundColor: scrolled
                                    ? Colors.blueGrey
                                    : Colors.transparent,
                                elevation: 0,
                                bottom: PreferredSize(
                                    preferredSize: const Size.fromHeight(4.0),
                                    child: Container(
                                      color: scrolled
                                          ? Colors.white
                                          : Colors.transparent,
                                      height: 1.0,
                                    )),
                                actions: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.article_outlined,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.more_vert,
                                          color: Colors.white))
                                ],
                                flexibleSpace: FlexibleSpaceBar(
                                  titlePadding: const EdgeInsets.only(
                                      left: 16, bottom: 12),
                                  expandedTitleScale: 1.8,
                                  title: Text(
                                    location.name ?? "",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                ));
                          }),
                          SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          mData.current.tempC.round()
                                              .toString(),
                                          style: const TextStyle(fontSize: 72),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "°C",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              mData.current.condition.text,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "$currentTime\t ${mData.forecast
                                          .forecastday[0].day.maxtempC
                                          .round()}°C/${mData.forecast
                                          .forecastday[0].day.mintempC
                                          .round()}°C",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    SizedBox(
                                      height: 80,
                                      child: ListView.separated(
                                        itemCount: listHours.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, index) {
                                          final itemData = listHours[index];
                                          final time = itemData.time.split(
                                              " ")[1];
                                          return Container(
                                            height: 80,
                                            width: 60,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(time),
                                                SizedBox(
                                                  height: 40,
                                                  child: Image.network(
                                                    "https:${itemData.condition
                                                        .icon}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(left: 6),
                                                  child: Text(
                                                    "${itemData.tempC
                                                        .round()}°C",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(
                                            width: 8,
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Divider(
                                        height: 1,
                                        color: Colors.white.withOpacity(0.4),
                                      ),
                                    ),
                                    SizedBox(
                                      // height: 240,
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (_, i) {
                                            final itemData = mData.forecast.forecastday[i];
                                            return Container(
                                              height: 32,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    child:  Text(i==0?"Today":i==1?"Tomorrow":DateFormat("EEE").format(itemData.date)),
                                                  ),
                                                  Image.network(
                                                    "https:${itemData.day.condition
                                                        .icon}",
                                                    fit: BoxFit.cover,
                                                    height: 32,
                                                    width: 32,
                                                  ),
                                                  const SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width:120,
                                                            child: Text(
                                                              itemData.day.condition.text,
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                right: 16),
                                                            child:
                                                             Text(
                                                                "${itemData.day.maxtempC.round()} / ${itemData.day.mintempC.round()}°C"),
                                                          )
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (_, i) =>
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          itemCount: mData.forecast.forecastday.length),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Container(
                                              margin: const EdgeInsets.only(top: 10),
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 80, vertical: 12),
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius:
                                                  BorderRadius.circular(16)),
                                              child:
                                              const Text("15 days weather forcast"),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(height: 36),
                                    const Text("Weather detail",style: TextStyle(fontWeight: FontWeight.w700),),
                                    SizedBox(
                                      child: GridView(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 2
                                        ),
                                        children: [
                                          buildWeatherDetailWidget("Feel like", "29°C"),
                                          buildWeatherDetailWidget("Humidity", "90%"),
                                          buildWeatherDetailWidget("SSW wind", "Level 1"),
                                          buildWeatherDetailWidget("UV", "Very weak"),
                                          buildWeatherDetailWidget("Visibility", "9 km"),
                                          buildWeatherDetailWidget("Air pressure", "1011 hPa"),
                                          buildWeatherDetailWidget("Change of rain", "3%"),
                                          buildWeatherDetailWidget("Sunrise", "06:16"),
                                          buildWeatherDetailWidget("Sunset", "17:13"),
                                        ],

                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (err) => Center(child: Text(err.toString()),),
                nonePerMission: (String message) => const SizedBox());
          }),
    );
  }

  List<Hour> calculateHourArray(ForecastWeatherModel data) {
    List<Hour> dateTimes = [];
    for (var e in data.forecast.forecastday[0].hour) {
      final dTime = DateFormat("yyyy-MM-dd HH:mm").parse(e.time);
      if (dTime.isAfter(DateTime.now())) {
        dateTimes.add(e);
      }
    }
    int length = 24 - dateTimes.length;
    for (int i = 0; i <= length; i++) {
      dateTimes.add(data.forecast.forecastday[1].hour[i]);
    }
    return dateTimes;
  }


  buildWeatherDetailWidget(String title, String content){
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,style: const TextStyle(
            fontWeight: FontWeight.w300
          ),),
          Text(content,style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400
          ),)
        ],
      ),
    );
  }
}
