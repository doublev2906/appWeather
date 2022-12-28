import 'package:app_weather/common/navigator/navigation/navigation.dart';
import 'package:app_weather/common/navigator/router/app_router.dart';
import 'package:app_weather/config/constant.dart';
import 'package:app_weather/generated/l10n.dart';
import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/presentation/home/air_quality_bottom_sheet.dart';
import 'package:app_weather/util/settings.dart';
import 'package:app_weather/util/util.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:app_weather/model/current_weather_model.dart';
import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:app_weather/presentation/home/bloc/home_state.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';

import '../../common/injector.dart';
import '../../model/forecast_weather_model.dart';

class HomePage extends StatefulWidget {
  final CityModel city;
  bool? isDay;
  final bool isCurrentCity;

  HomePage({Key? key, required this.city, this.isCurrentCity = false})
      : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  late final HomeCubit _bloc;
  var top = 0.0;
  final scrollController = ScrollController();
  bool isCollaspAppbar = false;

  @override
  void initState() {
    super.initState();
    _bloc = HomeCubit()..init(widget.city);
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
              widget.isDay = mData.current.isDay == 1;
              context.read<MainPageBloc>().setDay(mData.current.isDay == 1);
              final currentTime =
                  DateFormat(S.current.dateFormat).format(DateTime.now());
              final listHours = calculateHourArray(mData);
              setHomeWidget(mData);
              return DefaultTextStyle(
                style: TextStyle(
                    color:
                        mData.current.isDay != 1 ? Colors.white : Colors.black),
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        color: mData.current.isDay != 1
                            ? const Color(0xff1D212C)
                            : const Color(0xfffafafa),
                      ),
                      CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverLayoutBuilder(builder: (context, mConstraints) {
                            final scrolled = mConstraints.scrollOffset >
                                (180 - kToolbarHeight);
                            if (scrolled) {
                              sl.get<MainPageBloc>().hideIndicator();
                            } else {
                              sl.get<MainPageBloc>().showIndicator();
                            }
                            return SliverAppBar(
                                expandedHeight: 180.0,
                                floating: false,
                                pinned: true,
                                backgroundColor: scrolled
                                    ? mData.current.isDay != 1
                                        ? const Color(0xff1D212C)
                                        : const Color(0xfffafafa)
                                    : Colors.transparent,
                                elevation: 0,
                                bottom: PreferredSize(
                                    preferredSize: const Size.fromHeight(4.0),
                                    child: Container(
                                      color: scrolled
                                          ? mData.current.isDay != 1
                                              ? const Color(0xff2C3039)
                                              : const Color(0xffEEEEEE)
                                          : Colors.transparent,
                                      height: 0.8,
                                    )),
                                flexibleSpace: FlexibleSpaceBar(
                                  titlePadding: const EdgeInsets.only(
                                      left: 16, bottom: 12),
                                  expandedTitleScale: 1.8,
                                  title: Text(
                                    location,
                                    textAlign: TextAlign.start,
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(fontSize: 20),
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
                                      mData.current.tempC.round().toString(),
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
                                  "$currentTime\t ${mData.forecast.forecastday[0].day.maxtempC.round()}°C/${mData.forecast.forecastday[0].day.mintempC.round()}°C",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                buildQualityWidget(mData
                                    .forecast.forecastday[0].day.airQuality),
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
                                      final time = itemData.time.split(" ")[1];
                                      return SizedBox(
                                        height: 80,
                                        width: 60,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(time),
                                            SizedBox(
                                              height: 40,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "https:${itemData.condition.icon}",
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Text(
                                                "${itemData.tempC.round()}°C",
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
                                        final itemData =
                                            mData.forecast.forecastday[i];
                                        return SizedBox(
                                          height: 32,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(i == 0
                                                    ? S.current.today
                                                    : i == 1
                                                        ? S.current.tomorrow
                                                        : DateFormat(S.current
                                                                .dateFormatItem)
                                                            .format(
                                                                itemData.date)),
                                              ),
                                              CachedNetworkImage(
                                                imageUrl:
                                                    "https:${itemData.day.condition.icon}",
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(
                                                  Icons.error,
                                                  color: Colors.redAccent,
                                                ),
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
                                                    width: 120,
                                                    child: Text(
                                                      itemData
                                                          .day.condition.text,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 12),
                                                    child: Text(
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
                                      itemCount:
                                          mData.forecast.forecastday.length),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          final code = widget.isCurrentCity
                                              ? "Hanoi"
                                              : widget.city.name
                                                  .replaceAll(" ", "-");
                                          final uri = Uri.parse(
                                              "https://www.weather-forecast.com/locations/$code/forecasts/latest");
                                          await url_launcher.launchUrl(uri);
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 80, vertical: 12),
                                          decoration: BoxDecoration(
                                              color: widget.isDay ?? false
                                                  ? Color(0xfff2f2f2)
                                                  : Color(0xff3F424B),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(S.current.forecast),
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 36),
                                const Text(
                                  "Weather detail",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  child: GridView(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 2),
                                    children: [
                                      buildWeatherDetailWidget(
                                          S.current.feel_like,
                                          "${mData.current.feelslikeC.round()}°C"),
                                      buildWeatherDetailWidget(
                                          S.current.humidity,
                                          "${mData.current.humidity}%"),
                                      buildWeatherDetailWidget(
                                          mData.current.windDir,
                                          "${mData.current.windKph} km/h"),
                                      buildWeatherDetailWidget(
                                          S.current.uv, "${mData.current.uv}"),
                                      buildWeatherDetailWidget(
                                          S.current.visibility,
                                          "${mData.current.visKm}"),
                                      buildWeatherDetailWidget(
                                          S.current.air_pressure,
                                          "${mData.current.pressureMb}Mb"),
                                      buildWeatherDetailWidget(
                                          S.current.change_of_rain,
                                          "${mData.forecast.forecastday[0].day.dailyChanceOfRain}%"),
                                      buildWeatherDetailWidget(
                                          S.current.sunrise,
                                          mData.forecast.forecastday[0].astro
                                              .sunrise),
                                      buildWeatherDetailWidget(
                                          S.current.sunset,
                                          mData.forecast.forecastday[0].astro
                                              .sunset),
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
                error: (err) => Center(
                      child: Text(err.toString()),
                    ),
                nonePerMission: (String message) => const SizedBox());
          }),
    );
  }

  buildQualityWidget(AirQuality quality) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            builder: (context) {
              return AirQualityBottomSheet(
                quality: quality,
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(top: 4, bottom: 4, right: 8, left: 0),
        decoration: BoxDecoration(
            color:
                widget.isDay ?? false ? Color(0xfff2f2f2) : Color(0xff3F424B),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.air,
              color: Colors.greenAccent,
            ),
            SizedBox(
              width: 4,
            ),
            Text(getAirQualityText(quality.usEpaIndex))
          ],
        ),
      ),
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
    for (int i = 0; i < length; i++) {
      dateTimes.add(data.forecast.forecastday[1].hour[i]);
    }
    return dateTimes;
  }

  setHomeWidget(ForecastWeatherModel data) async {
    if (widget.isCurrentCity) {
      await HomeWidget.saveWidgetData<String>(
          "temp", "${data.current.tempC.round()}");
      await HomeWidget.saveWidgetData<bool>("isDay", data.current.isDay == 1);
      await HomeWidget.saveWidgetData<String>(
          "imageUrl", "https:${data.current.condition.icon}");
      await HomeWidget.saveWidgetData<String>("des",
          "${data.forecast.forecastday[0].day.maxtempC.round()}°C / ${data.forecast.forecastday[0].day.mintempC.round()}°C ${data.current.condition.text}");
      await HomeWidget.saveWidgetData<String>("location", widget.city.name);
      await HomeWidget.updateWidget(name: 'AppWidgetProvider');
    }
  }

  buildWeatherDetailWidget(String title, String content) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
