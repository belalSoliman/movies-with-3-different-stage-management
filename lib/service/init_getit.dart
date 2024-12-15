import 'package:get_it/get_it.dart';
import 'package:movies/service/api_service.dart';
import 'package:movies/service/navigation_service/navigation_sevice.dart';

final getIt = GetIt.instance;
void setUpLocator() {
  getIt.registerLazySingleton<NavigationSevice>(() => NavigationSevice());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
