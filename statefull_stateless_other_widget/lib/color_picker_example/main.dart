import 'package:flutter/material.dart';
import 'package:statefull_stateless_other_widget/color_picker_example/pages/color_picker_page.dart';
import 'package:statefull_stateless_other_widget/color_picker_example/theme/app_theme.dart';

void main(List<String> args) {
  runApp(MyColorPicker());
}

class MyColorPicker extends StatelessWidget {
  const MyColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: ColorPickerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

