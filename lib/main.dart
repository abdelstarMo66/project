import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/views/layout_view.dart';
import 'package:flutter_application_1/views/login_view.dart';

import 'utils/api_helper.dart';
import 'utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ApiHelper.init();
  await CacheHelper.init();

  late Widget startingScreen;
  String? token = await CacheHelper.getData(key: "token");

  if (token != null) {
    startingScreen = const LayoutView();
  } else {
    startingScreen = const LoginView();
  }

  runApp(CheckOutApp(startingScreen: startingScreen));
}

class CheckOutApp extends StatelessWidget {
  final Widget startingScreen;

  const CheckOutApp({super.key, required this.startingScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Checkout App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0XFF57B4D7),
      ),
      home: startingScreen,
    );
  }
}
