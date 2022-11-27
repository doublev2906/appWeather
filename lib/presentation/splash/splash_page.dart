import 'package:app_weather/common/navigator/navigation/navigation.dart';
import 'package:app_weather/common/navigator/router/app_router.dart';
import 'package:app_weather/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        nativeToHomePage(context);
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/im_background.png"),fit: BoxFit.fill)
          ),
        );
      },
    );
  }

  Future nativeToHomePage(BuildContext context) async{
    WidgetsBinding.instance.addPostFrameCallback((_){

      Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
        await Geolocator.requestPermission();
        navigation.replaceTo(AppRouter.home);
      });
    });
  }
}
