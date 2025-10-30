import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _count = 0;

  void _increase () {
    setState(() {
      _count++;
    });
  }

  void _decrease() {
    setState(() {
      _count--;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bölüm 2"),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Butona basılma sayısı:",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              _count.toString(),
              style: Theme.of(
                context).textTheme.displayMedium?.copyWith(
                  color: _count < 0 ? Colors.red : Colors.green
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _increase();
              debugPrint("Sayacin suanki degeri: $_count");
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8,),
          FloatingActionButton(
            onPressed: () {
              _decrease();
              debugPrint("Sayacin suanki degeri: $_count");
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 8,),
          FloatingActionButton(
            onPressed: () {
              _reset();
              debugPrint("Sayacin suanki degeri: $_count");
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}