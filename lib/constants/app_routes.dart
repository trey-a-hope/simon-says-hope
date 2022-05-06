import 'package:get/get.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/splash_screen.dart';
import 'package:simon_says_hope/ui/create_feeling/create_feeling_screen.dart';
import 'package:simon_says_hope/ui/create_feeling_success_screen.dart';
import 'package:simon_says_hope/ui/home/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashView()),
    GetPage(name: Globals.ROUTES_HOME, page: () => HomeScreen()),
    GetPage(
        name: Globals.ROUTES_CREATE_FEELING, page: () => CreateFeelingScreen()),
    GetPage(
        name: Globals.ROUTES_CREATE_FEELING_SUCCESS,
        page: () => CreateFeelingSuccessScreen()),
  ];
}
