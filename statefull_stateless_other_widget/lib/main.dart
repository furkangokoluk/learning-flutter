import 'package:flutter/material.dart';
import 'package:statefull_stateless_other_widget/color_picker_example/main.dart';
// import 'package:statefull_stateless_other_widget/dropdown_popup.dart';
// import 'package:statefull_stateless_other_widget/image_widget.dart';
// import 'package:statefull_stateless_other_widget/buttons.dart';
// import 'package:statefull_stateless_other_widget/stateless_stateful.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: false,
        textTheme: TextTheme(labelLarge: TextStyle(fontSize: 24)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          )
        )
      ),
      home: MyColorPicker(),
    );
  }
}
