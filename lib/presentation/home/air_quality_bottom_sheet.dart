import 'package:app_weather/config/constant.dart';
import 'package:app_weather/model/forecast_weather_model.dart';
import 'package:app_weather/util/settings.dart';
import 'package:app_weather/util/util.dart';
import 'package:app_weather/util/widget.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class AirQualityBottomSheet extends StatefulWidget {
  final AirQuality quality;

  const AirQualityBottomSheet({Key? key, required this.quality})
      : super(key: key);

  @override
  _AirQualityBottomSheetState createState() => _AirQualityBottomSheetState();
}

class _AirQualityBottomSheetState extends State<AirQualityBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Color? color;
    switch (widget.quality.usEpaIndex) {
      case 1 :
        color = Colors.green;
        break;
      case 2:
        color = Colors.greenAccent;
        break;
      case 3:
        color = Colors.yellowAccent;
        break;
      case 4:
        color = Colors.redAccent;
        break;
      case 5:
        color = Colors.red;
        break;
      case 6:
        color = Colors.red;
        break;
    }
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: buildHandle(context),
          ),
           Text(
            S.current.airBottomsheetTitle,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  backgroundColor:color,
                  child: Text("${widget.quality.usEpaIndex}",style: const TextStyle(color: Colors.white,fontSize: 40),),
                ),
              ),
              const SizedBox(width: 20,),
              Text(getAirQualityText(widget.quality.usEpaIndex),style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500
              ),)
            ],

          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Co: ${widget.quality.co.round()} μg/m3",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
              Text("O3: ${widget.quality.o3.round()} μg/m3",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("No2: ${widget.quality.no2.round()} μg/m3",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
              Text("So2: ${widget.quality.so2.round()} μg/m3",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("pm2_5: ${widget.quality.pm25.round()} μg/m3",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
              Text("pm10: ${widget.quality.pm10.round()} μg/m3",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
