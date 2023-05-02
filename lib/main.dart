// ignore_for_file: camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Services/Provider/provider.dart';
import '../Widgets/formulario/formPage.dart';
import '../Widgets/login/loginPage.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<mascotsProvider>(
            create: (_) => mascotsProvider())
      ],
      builder: (context, _) {
        return MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => const loginPage(),
            '/formulario': (context) => formPage(),
          },
          debugShowCheckedModeBanner: false,
        );
      }));
}

void setup() async {
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}
