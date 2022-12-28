import 'package:app_weather/common/injector.dart';
import 'package:app_weather/common/navigator/navigation/navigation.dart';
import 'package:app_weather/common/navigator/router/app_router.dart';
import 'package:app_weather/generated/l10n.dart';
import 'package:app_weather/model/language_entity.dart';
import 'package:app_weather/presentation/home/home_page.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:app_weather/presentation/splash/splash_cubit.dart';
import 'package:app_weather/presentation/splash/splash_state.dart';
import 'package:app_weather/util/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashSate>(
      bloc: sl.get<SplashCubit>()..init(),
      listener: (context, state) async {
        if(state.navigateToMain){
          await context.read<MainPageBloc>().init();
          navigation.replaceTo(AppRouter.main);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/im_background.png"),
                fit: BoxFit.fill)),
      ),
    );
  }

  Future nativeToHomePage(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
        await Geolocator.requestPermission();
        navigation.replaceTo(AppRouter.home);
      });
    });
  }
}
