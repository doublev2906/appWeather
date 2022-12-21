import 'package:app_weather/model/item.dart';
import 'package:app_weather/presentation/city/bloc/city_c_bloc.dart';
import 'package:app_weather/presentation/city/item_widget.dart';
import 'package:app_weather/presentation/city/widget/bottom_sheet_search.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CityPage extends StatefulWidget {
  const CityPage({Key? key}) : super(key: key);

  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage>
    with TickerProviderStateMixin  {
  bool showCheckBox = false;
  List<Item> listData = [];
  late AnimationController controller;
  late AnimationController bottomsheetAnimationController;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    offset =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0.0, 0.0))
            .animate(controller);
    bottomsheetAnimationController = BottomSheet.createAnimationController(this);
    bottomsheetAnimationController.duration = const Duration(milliseconds: 800);
    bottomsheetAnimationController.reverseDuration = const Duration(milliseconds: 500);
    bottomsheetAnimationController.drive(CurveTween(curve: Curves.easeIn));
    context.read<CityCBloc>().getData();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (showCheckBox) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: !showCheckBox
            ? const Text(
                "Manage cities",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              )
            : Builder(builder: (context) {
                final index = context.watch<CityCBloc>().state.selectedItem;
                return Text(
                  "$index selected",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                );
              }),
        titleSpacing: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: showCheckBox
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showCheckBox = false;
                    context.read<CityCBloc>().resetSelectedItem();
                  });
                },
                icon: const Icon(Icons.close))
            : null,
        actions: [
          !showCheckBox
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showCheckBox = true;
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 20,
                  ))
              : Builder(builder: (context) {
                  final selectedAll =
                      context.watch<CityCBloc>().state.selectedAll;
                  return Checkbox(
                      value: selectedAll,
                      shape: const CircleBorder(),
                      onChanged: (val) {
                        if (val != null) {
                          context.read<CityCBloc>().selectAll(val);
                        }
                      });
                }),
          const SizedBox(
            width: 14,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Builder(builder: (context) {
            final listData = context.watch<CityCBloc>().state.data;
            return ReorderableListView.builder(
                padding: EdgeInsets.only(bottom: showCheckBox ? 60 : 0),
                itemBuilder: (_, i) {
                  final item = ItemWidget(
                    item: listData[i],
                    showCheckBox: showCheckBox,
                  );
                  return SizedBox(
                    key: ValueKey(i),
                    height: 120,
                    child: GestureDetector(
                      onTap: (){
                        context.read<MainPageBloc>().changePage(i);
                        Navigator.of(context).pop<int>(i);
                      },
                      onLongPress: !showCheckBox
                          ? () {
                              setState(() {
                                showCheckBox = true;
                              });
                            }
                          : null,
                      child: item,
                    ),
                  );
                },
                itemCount: listData.length,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = listData.removeAt(oldIndex);
                    listData.insert(newIndex, item);
                  });
                });
          }),
          if (showCheckBox)
            Align(
              alignment: Alignment.bottomCenter,
              child: SlideTransition(
                position: offset,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -1),
                      color: Colors.black12,
                    )
                  ]),
                  child: InkWell(
                    onTap: () {
                      context.read<CityCBloc>().removeData();
                      setState(() {
                        showCheckBox = false;
                        context.read<CityCBloc>().resetSelectedItem();
                      });
                    },
                    child: Center(
                      child: Column(
                        children: const [
                          Icon(Icons.delete_outline),
                          SizedBox(height: 2),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: !showCheckBox
            ? FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      transitionAnimationController: bottomsheetAnimationController,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return const BottomSheetSearch();
                      });
                },
                child: const Icon(Icons.add),
              )
            : const SizedBox(),
      ),
    );
  }
}
