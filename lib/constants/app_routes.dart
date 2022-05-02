import 'package:get/get.dart';
import 'package:simon_says_hope/constants/globals.dart';
import 'package:simon_says_hope/splash_screen.dart';
import 'package:simon_says_hope/ui/home/home_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashView()),
    GetPage(name: Globals.ROUTES_HOME, page: () => HomeScreen()),

    // GetPage(name: Globals.ROUTES_CONTACT, page: () => ContactView()),
    // GetPage(
    //     name: Globals.ROUTES_CREATE_CRITIQUE, page: () => CreateCritiqueView()),
    // GetPage(name: Globals.ROUTES_EDIT_PROFILE, page: () => EditProfileView()),
    // GetPage(name: Globals.ROUTES_HOME, page: () => HomeView()),
    // GetPage(name: Globals.ROUTES_LOGIN, page: () => const LoginPage()),
    // GetPage(name: Globals.ROUTES_MAIN, page: () => const MainView()),
    // GetPage(name: Globals.ROUTES_MOVIE_DETAILS, page: () => MovieDetailsView()),
    // GetPage(name: Globals.ROUTES_PROFILE, page: () => ProfileView()),
    // GetPage(
    //     name: Globals.ROUTES_RECOMMENDATIONS,
    //     page: () => RecommendationsView()),
    // GetPage(name: Globals.ROUTES_SEARCH_MOVIES, page: () => SearchMoviesView()),
    // GetPage(name: Globals.ROUTES_SEARCH_USERS, page: () => SearchUsersView()),
    // GetPage(name: Globals.ROUTES_SETTINGS, page: () => SettingsView()),
    // GetPage(
    //     name: Globals.ROUTES_TERMS_OF_SERVICE,
    //     page: () => TermsOfServicePage()),
    // GetPage(name: Globals.ROUTES_USERS_LIST, page: () => UsersListView()),
    // GetPage(name: Globals.ROUTES_WATCH_LIST, page: () => WatchListView()),
  ];
}
