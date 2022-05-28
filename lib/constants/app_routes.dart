import 'package:get/get.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/splash_screen.dart';
import 'package:simon_says_hope/ui/create_feeling/create_feeling_screen.dart';
import 'package:simon_says_hope/ui/create_feeling/create_feeling_success_screen.dart';
import 'package:simon_says_hope/ui/home/home_screen.dart';
import 'package:simon_says_hope/ui/login/login_screen.dart';
import 'package:simon_says_hope/ui/main/main_screen.dart';
import 'package:simon_says_hope/ui/profile/profile_screen.dart';
import 'package:simon_says_hope/ui/signup/signup_screen.dart';

import '../ui/settings/settings_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashView()),
    GetPage(name: Globals.ROUTES_HOME, page: () => HomeScreen()),
    GetPage(name: Globals.ROUTES_LOGIN, page: () => LoginScreen()),
    GetPage(name: Globals.ROUTES_PROFILE, page: () => ProfileScreen()),
    GetPage(name: Globals.ROUTES_MAIN, page: () => MainScreen()),
    GetPage(name: Globals.ROUTES_SETTINGS, page: () => SettingsScreen()),
    GetPage(name: Globals.ROUTES_SIGNUP, page: () => SignupScreen()),
    GetPage(
        name: Globals.ROUTES_CREATE_FEELING, page: () => CreateFeelingScreen()),
    GetPage(
        name: Globals.ROUTES_CREATE_FEELING_SUCCESS,
        page: () => CreateFeelingSuccessScreen()),
  ];
}
