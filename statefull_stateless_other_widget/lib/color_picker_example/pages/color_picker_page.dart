import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:statefull_stateless_other_widget/color_picker_example/constans/colors.dart';
import 'package:statefull_stateless_other_widget/color_picker_example/widgets/color_display.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.blue;
  bool isCircular = false;
  bool isShowColorName = true;


  void _randomColor() {
    final colorList = colors.keys.toList();
    var randomColor = colorList[Random().nextInt(colorList.length)];
    while (randomColor == selectedColor) {
      randomColor = colorList[Random().nextInt(colorList.length)];
    }
    setState(() {
      selectedColor = randomColor;
    });
  }

  void _showColorCode() {
    int red = (selectedColor.r * 255.0).round() & 0xff;
    int green = (selectedColor.g * 255.0).round() & 0xff;
    int blue = (selectedColor.b * 255.0).round() & 0xff;
    Fluttertoast.showToast(
      msg: "RGB : ($red, $green, $blue)",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: selectedColor,
      textColor: selectedColor == Colors.yellow ? Colors.black : Colors.white,
      fontSize: 24.0,
    );
  }

  void _changeShape() {
    setState(() {
      isCircular = !isCircular;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Renk Seçici"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                isShowColorName = !isShowColorName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "",
                  child: Row(
                    children: [
                      isShowColorName
                          ? (Icon(Icons.visibility_off))
                          : (Icon(Icons.visibility)),
                      SizedBox(width: 4),
                      isShowColorName
                          ? Text("Renk Adını Gizle")
                          : Text("Renk Adını Göster"),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ColorDisplay(selectedColor: selectedColor, isCircular: isCircular),
              SizedBox(height: 10),
              isShowColorName ? Text(colors[selectedColor]!) : SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<Color>(
                      value: selectedColor,
                      items: colors.entries.map((entry) {
                        return DropdownMenuItem(
                          value: entry.key,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: entry.key,
                              ),
                              SizedBox(width: 4),
                              Text(entry.value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _randomColor,
                      child: Text("Rastgele"),
                    ),
                    IconButton(
                      onPressed: _showColorCode,
                      icon: Icon(Icons.info),
                    ),
                    IconButton(
                      onPressed: _changeShape,
                      icon: Icon(
                        isCircular
                            ? Icons.square_outlined
                            : Icons.circle_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

