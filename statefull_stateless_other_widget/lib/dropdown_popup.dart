import 'package:flutter/material.dart';

class DropdownPopup extends StatelessWidget {
  const DropdownPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown ve Popup"),
        actions: [PopupMenuBtn()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropDownBtn(),
            PopupMenuBtn()
          ],
        ),
      ),
    );
  }
}

class DropDownBtn extends StatefulWidget {
  const DropDownBtn({super.key});

  @override
  State<DropDownBtn> createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {

  final _cities =  ["Adana","Çorum","Bursa","Ankara","İstanbul"];
  // ignore: prefer_typing_uninitialized_variables
  var _selectedCity;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedCity,
      hint: Text("Şehir Seçiniz"),
      // items: [
      //   DropdownMenuItem(value: "Adana",child: Text("Adana"),),
      //   DropdownMenuItem(value: "Çorum",child: Text("Çorum"),),
      //   DropdownMenuItem(value: "Bursa",child: Text("Bursa"),),
      //   DropdownMenuItem(value: "Ankara",child: Text("Ankara"),),
      // ], 
      items: _cities.map((String city) => DropdownMenuItem(value: city,child: Text(city),),).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCity = value!;
        });
      },
    );
  }
}

class PopupMenuBtn extends StatefulWidget {
  const PopupMenuBtn({super.key});

  @override
  State<PopupMenuBtn> createState() => _PopupMenuBtnState();
}

class _PopupMenuBtnState extends State<PopupMenuBtn> {

  final _cities =  ["Adana","Çorum","Bursa","Ankara","İstanbul"];
  var _selectedCity = "Ankara";

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: _selectedCity,
      itemBuilder: (context) {
      return _cities.map((String city) {
        return PopupMenuItem(
          value: city,
          child: Text(city),);
      },).toList();
    },
    onSelected: (value) {
      setState(() {
        _selectedCity = value;
      });
    },
    );
  }
}