import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buton Türleri")
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_downward),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {}, 
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.grey
                ),
              ),
              child: Text("Text Button"),
            ),
            TextButton.icon(
              onPressed: () {},
              label: Text("Text Button İcon"),
              icon: Icon(Icons.add),
            ),
            ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.amber
            ), 
            child: Text("Elevated Button"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text("Elevated Button Icon"),
              icon: Icon(Icons.add),
            ),
            OutlinedButton(
            onPressed: () {}, 
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(16),
              side: BorderSide(
                color: Colors.green,
                width: 5,
              ),
              shape: StadiumBorder()
            ),
            child: Text("Outlined Button"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text("Outlined Button Icon"),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
