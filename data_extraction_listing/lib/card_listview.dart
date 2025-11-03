import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

// ignore: must_be_immutable
class CardListView extends StatelessWidget {
  CardListView({super.key});

  List<Student> students = List.generate(
    100,
    (index) => Student(
      id: index,
      name: "Öğrenci adı: ${index + 1} numaralı öğrenci",
      male: Random().nextBool(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card ve ListView Kullanımı")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            SmartDialog.show(
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${students[index].name} \nCinsiyeti : ${students[index].male ? 'Erkek' : 'Kız'} ",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            );
          },
          child: Card(
            color: students[index].male ? Colors.blue : Colors.pink,
            child: ListTile(
              title: Text(students[index].name),
              leading: CircleAvatar(child: Text(index.toString())),
            ),
          ),
        ),
      ),
    );
  }
}

class Student {
  final int id;
  final String name;
  final bool male;

  Student({required this.id, required this.name, required this.male});
}
