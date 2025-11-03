import 'dart:math';
import 'package:data_extraction_listing/card_listview.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridviewTypes extends StatelessWidget {
  GridviewTypes({super.key});

  List<Student> students = List.generate(500, (index) {
    return Student(
      id: index + 1,
      name: "Öğrenci ${index + 1}",
      male: Random().nextBool(),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gridview Çeşitleri")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          // boyutuna göre istiyorsak Count yerine Extend olan sınfı çağıracağız
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.orange[100 * (index % 10)],
              child: Text(students[index].name.toString()),
            );
          },
        ),
      ),
    );
  }

  GridView gridViewExtent() {
    return GridView.extent(
      maxCrossAxisExtent: 100,
      primary: true,
      padding: EdgeInsets.all(8),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: createContainers(6),
    );
  }

  GridView gridViewCount() {
    return GridView.count(
      primary: true,
      crossAxisCount: 4,
      padding: EdgeInsets.all(8),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: createContainers(20),
    );
  }
}

List<Widget> createContainers(int length) {
  return List.generate(length, (index) {
    var colorShade = 100 * ((index + 1) % 10);
    return Container(
      alignment: Alignment.center,
      color: Colors.purple[colorShade],
      child: Text("$colorShade", style: TextStyle(fontSize: 14)),
    );
  });
}
