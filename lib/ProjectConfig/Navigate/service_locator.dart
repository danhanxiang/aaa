import 'package:get_it/get_it.dart';
import 'NavigateService.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton(NavigateService());
}
