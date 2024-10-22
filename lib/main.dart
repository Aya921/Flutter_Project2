// ignore_for_file: body_might_complete_normally_nullable

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:second_project/screens/btn_nav.dart';

import 'package:second_project/screens/home.dart';
import 'package:second_project/screens/product.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => BtnNav());
        }
        if (settings.name == '/home') {
          return MaterialPageRoute(builder: (_) => Home());
        }

        if (settings.name == '/products') {
          final args = settings.arguments as Map;
          return MaterialPageRoute(builder: (_) => Product(data: args));
        }
      },
    
    );
  }
}
