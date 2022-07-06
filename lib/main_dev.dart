import 'package:flutter/material.dart';
import 'package:tree_plantation_mobile/app/my_app.dart';
import 'package:tree_plantation_mobile/flavors/build_config.dart';
import 'package:tree_plantation_mobile/flavors/env_config.dart';
import 'package:tree_plantation_mobile/flavors/environment.dart';
// previous base url : "http://172.16.227.86:8000",
void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Tree plantation Dev",
    baseUrl: "https://treeplantation-backend.herokuapp.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}
