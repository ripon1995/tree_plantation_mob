import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tree_plantation_mobile/app/bindings/initial_bindings.dart';
import 'package:tree_plantation_mobile/app/routes/app_pages.dart';
import 'package:tree_plantation_mobile/flavors/build_config.dart';
import 'package:tree_plantation_mobile/flavors/env_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Garden Plan',
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide()))),
          textTheme: GoogleFonts.latoTextTheme()),
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBindings(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
