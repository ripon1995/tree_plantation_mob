import 'package:flutter/material.dart';
import 'package:tree_plantation_mobile/app/my_app.dart';
import 'package:tree_plantation_mobile/flavors/build_config.dart';
import 'package:tree_plantation_mobile/flavors/env_config.dart';
import 'package:tree_plantation_mobile/flavors/environment.dart';

void main() {
  EnvConfig prodConfig = EnvConfig(
    appName: "Tree Plantation Prod",
    baseUrl: "https://treeplantation-backend.herokuapp.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  runApp(const MyApp());
}
