import 'dart:convert';
import 'package:data_extraction_listing/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JsonApiFutureBuilder extends StatelessWidget {
  const JsonApiFutureBuilder({super.key});

  Future<List<Person>> _loadJson() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      var jsonString = await rootBundle.loadString('assets/data/persons.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      // debugPrint(jsonMap['persons'][0]['likeColors'][1].toString());
      // debugPrint(jsonMap['persons'][1]['address'][0]['city'].toString());

      List<dynamic> jsonList = jsonMap["persons"];
      List<Person> persons = jsonList.map((e) => Person.fromJson(e)).toList();

      for (var person in persons) {
        debugPrint(person.name);
      }

      return persons;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lokal JSON Dosyasını Okuma")),
      body: FutureBuilder<List<Person>>(
        future: _loadJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var persons = snapshot.data!;
            return listPersons(persons);
          } else if (snapshot.hasError) {
            return Center(child: Text('ERROR'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  ListView listPersons(List<Person> persons) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        var person = persons[index];
        return ListTile(
          title: Text(person.name),
          leading: CircleAvatar(child: Text(person.id.toString()),),
          subtitle: Text(person.address.toString()),
        );
      },
    );
  }
}
