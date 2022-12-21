import 'package:app_weather/common/navigator/navigation/navigation.dart';
import 'package:app_weather/common/navigator/router/app_router.dart';
import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:app_weather/presentation/home/home_page.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:app_weather/presentation/main/bloc/main_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin  {


  late TabController controller;
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 0, vsync: this);
    pageController = PageController();
  }

  // controller = TabController(length: state.cities.length, vsync: this);
  // final listItem = state.cities.map((e) => HomePage(city: e,)).toList();
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                BlocBuilder<MainPageBloc,MainPageSate>(
                  buildWhen: (oldSate, newSate){
                    return oldSate.cities.length != newSate.cities.length;
                  },
                  builder: (context,state) {
                    final listItem = state.cities.map((e) => HomePage(city: e,)).toList();
                    return PageView(
                      controller: pageController,
                        onPageChanged: (i){
                          context.read<MainPageBloc>().changePage(i);
                          final isDay = listItem[i].isDay;
                          if(isDay != null){
                            context.read<MainPageBloc>().setDay(isDay);
                          }
                        },
                      children: listItem,

                    );
                  }
                ),
                Builder(
                  builder: (context) {
                    final state = context.watch<MainPageBloc>().state;
                    controller = TabController(length: state.cities.length, vsync: this);
                    return Visibility(
                      visible: state.showIndicator,
                      child: Positioned(
                        left: 16,
                        top: 200,
                        child: TabPageSelector(
                          controller: controller..index = state.index,
                          color:Colors.lightBlue.withOpacity(0.4),
                          selectedColor:Colors.lightBlue,
                          borderStyle: BorderStyle.none,
                          indicatorSize: 6,
                        ),
                      ),
                    );
                  }
                ),
                Builder(
                  builder: (context) {
                    final isDay = context.watch<MainPageBloc>().state.isDay;
                    return Positioned(
                      top: 45,
                        right: 8,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  navigation.navigateTo(AppRouter.city).then(
                                          (value){
                                            if(value != null){
                                              pageController.jumpToPage(value);
                                            }

                                          });
                                },
                                icon: Icon(
                                  Icons.article_outlined,
                                  color:!isDay ? Color(0xfffafafa):Color(0xff1D212C),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon:  Icon(Icons.settings,
                                    color: !isDay ? Color(0xfffafafa):Color(0xff1D212C)))
                          ],
                        ),);
                  }
                )
              ],
            ),
          );
  }
}
