// main.dart
import 'package:e_commerce/route/route_constants.dart';
import 'package:e_commerce/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
 import 'package:e_commerce/theme/app_theme.dart';
import 'package:e_commerce/route/router.dart' as router;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize GetStorage
  await GetStorage.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize AuthService
    Get.put(AuthService());
    
    return MaterialApp( // Keep MaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Shop Template by The Flutter Way',
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      onGenerateRoute: router.generateRoute,
      initialRoute: onbordingScreenRoute,
      navigatorKey: Get.key, // Add this for GetX dialogs/snackbars
    );
  }
}