
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/home/bloc/home_cubit.dart';
import 'navigator/navigation/navigation.dart';
import 'navigator/navigation/navigation_impl.dart';
import 'navigator/router/router_observer.dart';

final sl = GetIt.instance;

Future init() async{
  await initializeDependencies();
  injectorBloc();
}

Future initializeDependencies() async {
  /// [Shared]
  // sl.registerSingleton(await SharedPreferences.getInstance());

  /// [Navigation]
  sl.registerLazySingleton<Navigation>(() => NavigationImpl());

  /// [Navigator util]
  sl.registerSingleton(AppRouteObserver());

}
void injectorBloc() {
  sl.registerSingleton(HomeCubit());

}