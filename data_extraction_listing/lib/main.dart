// import 'package:data_extraction_listing/card_listtile.dart';
// import 'package:data_extraction_listing/gridview_types.dart';
// import 'package:data_extraction_listing/card_listview.dart';
// import 'package:data_extraction_listing/dio.dart'; 
import 'package:data_extraction_listing/weather_app_example/main.dart';
// import 'package:data_extraction_listing/json_api_future.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      home: WeatherApp(),
      
    );
  }
}