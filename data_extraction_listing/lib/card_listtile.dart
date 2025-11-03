import 'package:flutter/material.dart';

class CardListtile extends StatefulWidget {
  const CardListtile({super.key});

  @override
  State<CardListtile> createState() => _CardListtileState();
}

class _CardListtileState extends State<CardListtile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card ve Listtile Kullanımı"),),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            color: Colors.green[100],
            shadowColor: Colors.green[50],
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                line(),
                line(),
                line(),
                line(),
                line(),
                line(),
                line(),
                line(),
                line(),
                line(),
                line(),
                line(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column line() {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text("Furkan Gökoluk"),
              subtitle: Text("Flutter Geliştiricisi"),
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              trailing: Icon(Icons.arrow_right),
            ),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.purple,
            )
          ],
        );
  }
}

