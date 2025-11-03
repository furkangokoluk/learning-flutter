// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    int id;
    String name;
    bool male;
    List<String> likeColors;
    List<Address> address;

    Person({
        required this.id,
        required this.name,
        required this.male,
        required this.likeColors,
        required this.address,
    });

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        male: json["male"],
        likeColors: List<String>.from(json["likeColors"].map((x) => x)),
        address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "male": male,
        "likeColors": List<dynamic>.from(likeColors.map((x) => x)),
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
    };
}

class Address {
    String city;
    String district;
    String type;

    Address({
        required this.city,
        required this.district,
        required this.type,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        district: json["district"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "district": district,
        "type": type,
    };

    @override
  String toString() {
    return "İl : $city, İlçe : $district";
  }
}
