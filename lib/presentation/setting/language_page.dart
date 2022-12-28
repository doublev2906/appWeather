import 'package:app_weather/generated/l10n.dart';
import 'package:app_weather/model/language_entity.dart';
import 'package:app_weather/util/settings.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:toast/toast.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  LanguageEntity languageCode = Setting.supportLanguage.where((e) => e.code == Setting.currentLanguage.code).first;
  @override
  Widget build(BuildContext context) {
    // final selectedValue
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.current.language,style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
        titleSpacing: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title:  Text(Setting.supportLanguage[0].value),
              leading: Radio<LanguageEntity>(
                value: Setting.supportLanguage[0],
                groupValue: languageCode,
                onChanged: (value) {
                  if(value != null){
                    setState(() {
                      languageCode = value;
                    });
                    Setting.currentLanguage.value = value.value;
                    Setting.currentLanguage.code = value.code;
                    Setting.currentLanguage.save();
                    Toast.show(S.current.settingChange);
                  }

                },
              ),
            ),
            ListTile(
              title: Text(Setting.supportLanguage[1].value),
              leading: Radio<LanguageEntity>(
                value: Setting.supportLanguage[1],
                groupValue: languageCode,
                onChanged: (value) {
                  if(value != null){
                    setState(() {
                      languageCode = value;
                    });
                    Setting.currentLanguage.value = value.value;
                    Setting.currentLanguage.code = value.code;
                    Setting.currentLanguage.save();
                    Toast.show(S.current.settingChange);
                  }
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
