

import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:app_weather/presentation/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _bloc;
  var top = 0.0;
  final scrollController = ScrollController();
  bool isCollaspAppbar = false;

  @override
  void initState() {
    super.initState();
    _bloc = HomeCubit()..init();
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
            return state.when((data) {
              return DefaultTextStyle(
                style: const TextStyle(color: Colors.white),

                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.lightBlueAccent,
                      ),
                      CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverLayoutBuilder(builder: (context, mConstraints) {
                            final scrolled = mConstraints.scrollOffset > (180-kToolbarHeight);
                            print(
                                " $scrolled ${mConstraints.scrollOffset} ${ kToolbarHeight}");
                            return SliverAppBar(
                                expandedHeight: 180.0,
                                floating: false,
                                pinned: true,
                                backgroundColor:
                                    scrolled ? Colors.blueGrey : Colors.transparent,
                                elevation: 0,

                                bottom: PreferredSize(
                                    preferredSize: const Size.fromHeight(4.0),
                                child: Container(
                                  color:scrolled? Colors.white:Colors.transparent,
                                  height: 1.0,
                                )),
                                actions: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.article_outlined,color: Colors.white,)),
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert,color: Colors.white))
                                ],
                                flexibleSpace: const FlexibleSpaceBar(
                                  titlePadding:EdgeInsets.only(left: 16,bottom: 12),
                                  expandedTitleScale: 1.8,
                                  title: const Text(
                                    "Nam Tu Liem",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ));
                          }),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 100,),
                                  Row(
                                    children: [
                                      const Text("26",style: const TextStyle(fontSize: 72),),
                                      const SizedBox(width: 8,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("°C",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                          const Text("Mostly clear",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Text("Nov 14 Mon\t 29°C/24°C",style: TextStyle(
                                    fontWeight: FontWeight.w500
                                  ),),
                                  const SizedBox(height: 24,),
                                  SizedBox(
                                    height: 80,
                                    child: ListView.separated(
                                        itemCount: 24,
                                        shrinkWrap: true,

                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_,index){

                                          return Container(
                                            height: 80,
                                            width: 60,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text("23:00"),
                                                SizedBox(
                                                  height: 40,
                                                  child:Image.network("http://cdn.weatherapi.com/weather/64x64/day/116.png",fit: BoxFit.cover,),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 6),
                                                  child: const Text("29°C",textAlign: TextAlign.center,),
                                                )
                                              ],
                                            ),
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) {return const SizedBox(width: 8,); },),
                                  ),
                                  const SizedBox(height: 12,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Divider(height: 1,color: Colors.white.withOpacity(0.4),),
                                  ),
                                  SizedBox(
                                    // height: 240,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (_,i){
                                          return Container(
                                            height: 32,
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 100,
                                                  child: const Text("Today"),
                                                ),
                                                Image.network("http://cdn.weatherapi.com/weather/64x64/day/116.png",fit: BoxFit.cover,height: 32,width: 32,),
                                                const SizedBox(width: 16,),
                                                Expanded(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        const Text("Thunderstorm",overflow: TextOverflow.ellipsis,),
                                                        const Padding(
                                                          padding: EdgeInsets.only(right: 16),
                                                          child: const Text("29 / 24°C"),
                                                        )
                                                      ],))
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (_,i)=>const SizedBox(height: 4,),
                                        itemCount: 12),
                                  )
                                ],
                              ),
                            )
                          )
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
                error: (err) => const SizedBox(),
                nonePerMission: (String message) => const SizedBox());
          }),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const _BodyWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
        body: const Center(
          child: const Text("Hello"),
        ));
  }
}
