import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/app_routes.dart';
import 'constants/app_themes.dart';
import 'constants/globals.dart';
import 'initialize_dependencies.dart';
import 'package:get/get.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Wait for firebase app to initialize.
  await Firebase.initializeApp();

  // Force disable Crashlytics collection while doing every day development.
  // Handle Crashlytics enabled status when not in Debug,
  await FirebaseCrashlytics.instance
      .setCrashlyticsCollectionEnabled(kDebugMode ? false : true);

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // Initialize Get Storage.
  await GetStorage.init();

  // Inject Get Storage.
  Get.lazyPut(() => GetStorage(), fenix: true);

  // Set status bar color to black.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  MyApp({Key? key}) : super(key: key);

  /// Get storage instance.
  final GetStorage _getStorage = Get.find();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Set theme of app.
    Get.changeThemeMode(_getStorage.read(Globals.DARK_MODE_ENABLED) ?? false
        ? ThemeMode.dark
        : ThemeMode.light);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Critic',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: InitialBinding(),
      initialRoute: Globals.ROUTES_MAIN,
      getPages: AppRoutes.routes,
    );
  }
}
