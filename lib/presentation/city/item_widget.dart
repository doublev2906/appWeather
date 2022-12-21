import 'package:app_weather/model/item.dart';
import 'package:app_weather/presentation/city/bloc/city_bloc.dart';
import 'package:app_weather/presentation/city/bloc/city_c_bloc.dart';
import 'package:app_weather/presentation/city/bloc/city_state.dart';
import 'package:app_weather/presentation/city/city_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ticker_text/ticker_text.dart';

import '../../common/injector.dart';

class ItemWidget extends StatefulWidget {
  final bool showCheckBox;
  final Item item;

  const ItemWidget({Key? key, required this.showCheckBox, required this.item})
      : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> with SingleTickerProviderStateMixin  {
  late CityBloc bloc;
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    bloc = CityBloc()..init(widget.item.data);
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    offset = Tween<Offset>(begin: const Offset(1,0), end: const Offset(0, 0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(
        bloc: bloc,
        builder: (context, state) {
          return state.when((data) {
            WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      if(widget.showCheckBox) {
                        controller.forward();
                      }
                    });
            // if(widget.showCheckBox) {
            //   controller.forward();
            // }
            return DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        padding: const EdgeInsets.all(12),
                        height: 90,
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(12)),
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                        width: widget.showCheckBox
                            ? MediaQuery.of(context).size.width - 24 - 60
                            : MediaQuery.of(context).size.width - 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text(widget.item.data.name,
                                    style:
                                        const TextStyle(color: Colors.white))),
                            if (!widget.showCheckBox)
                              SizedBox(
                                width: 60,
                                child: Column(
                                  children: [
                                    Text(
                                        "${data.current.tempC.round().toString()}°C"),
                                    const SizedBox(height: 24),
                                    SizedBox(
                                        width: 60,
                                        child: Center(
                                          child: TickerText(
                                            scrollDirection: Axis.horizontal,
                                            speed: 20,
                                            startPauseDuration: const Duration(
                                                milliseconds: 500),
                                            returnDuration: const Duration(
                                                milliseconds: 800),
                                            primaryCurve: Curves.linear,
                                            returnCurve: Curves.easeIn,
                                            child: Text(
                                              data.current.condition.text,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              )
                          ],
                        ),
                      ),
                      if (widget.showCheckBox)
                        Flexible(
                          child: SlideTransition(
                            position: offset,
                            child: Checkbox(
                                value: widget.item.isChecked,
                                shape: const CircleBorder(),
                                onChanged: (val) {

                                  setState(() {
                                    widget.item.isChecked =
                                        !widget.item.isChecked;
                                    if(val != null){
                                      if(val){
                                        context.read<CityCBloc>().increaseSelectedItem();
                                      }else{
                                        context.read<CityCBloc>().decreaseSelectedItem();
                                      }

                                    }
                                  });
                                }),
                          ),
                        ),
                    ],
                  )),
            );
          },
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (err) => Container());
        });
  }
}
