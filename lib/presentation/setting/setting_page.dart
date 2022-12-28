import 'package:app_weather/common/navigator/router/app_router.dart';
import 'package:app_weather/generated/l10n.dart';
import 'package:app_weather/util/box.dart';
import 'package:app_weather/util/settings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../common/navigator/navigation/navigation.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.current.setting,style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
        titleSpacing: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: Boxes.getLanguage().listenable(),
        builder: (context,box,_) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                ListTile(
                  leading: const SizedBox(
                    height: 40,
                      width: 40,
                      child: Center(child: Icon(Icons.language))),
                  title: Text(S.current.language),
                  subtitle: Text(Setting.currentLanguage.code == 'vi'?"Tiếng Việt":"English"),
                  onTap: (){
                    navigation.navigateTo(AppRouter.language);
                  },
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
