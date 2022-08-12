import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tree_plantation_mobile/app/my_app.dart';
import 'package:tree_plantation_mobile/flavors/build_config.dart';
import 'package:tree_plantation_mobile/flavors/env_config.dart';
import 'package:tree_plantation_mobile/flavors/environment.dart';

import 'firebase_options.dart';
import 'package:firebase_performance/firebase_performance.dart';

void main() async{
  EnvConfig devConfig = EnvConfig(
    appName: "Tree plantation Dev",
    baseUrl: "https://treeplantation-backend.herokuapp.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebasePerformance performance = FirebasePerformance.instance;
  runApp(const MyApp());
}
