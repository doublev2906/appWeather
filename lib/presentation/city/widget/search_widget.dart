import 'package:app_weather/presentation/city/bloc/bottom_sheet_bloc.dart';
import 'package:app_weather/presentation/city/bloc/bottom_sheet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SearchWidget extends StatefulWidget {

  final ValueChanged<String> onChanged;
  final String hintText;
  final ValueChanged<String> onSubmit;

  const SearchWidget({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.grey);

    return Builder(
      builder: (context) {
        final status = context.watch<BottomSheetBloc>().state.status;
        if(status == BottomSheetStatus.none){
          controller.clear();
          widget.onChanged('');
          text = "";
        }
        final style = text.isEmpty ? styleHint : styleActive;
        return KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            if(!isKeyboardVisible){
              FocusScope.of(context).requestFocus(FocusNode());
            }
            return Container(
              height: 40,
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                border: Border.all(color: Colors.black26),
              ),
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.search,
                onSubmitted: widget.onSubmit,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: style.color),
                  suffixIcon: text.isNotEmpty
                      ? GestureDetector(
                    child: Icon(Icons.close, color: style.color),
                    onTap: () {
                      controller.clear();
                      widget.onChanged('');
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState((){
                        text = "";
                      });
                    },
                  )
                      : null,
                  hintText: widget.hintText,
                  hintStyle: styleHint,
                  border: InputBorder.none,
                ),
                style: style,
                onChanged: (text){
                  setState((){
                    this.text = text;
                  });
                  widget.onChanged(text);

                },
              ),
            );
          }
        );
      }
    );
  }
}