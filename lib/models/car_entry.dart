// To parse this JSON data, do
//
//     final carEntry = carEntryFromJson(jsonString);

import 'dart:convert';

List<CarEntry> carEntryFromJson(String str) => List<CarEntry>.from(json.decode(str).map((x) => CarEntry.fromJson(x)));

String carEntryToJson(List<CarEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarEntry {
    String model;
    String pk;
    Fields fields;

    CarEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory CarEntry.fromJson(Map<String, dynamic> json) => CarEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int carHorsepower;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.carHorsepower,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        carHorsepower: json["car_horsepower"]
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "car_horsepower": carHorsepower,
    };
}
