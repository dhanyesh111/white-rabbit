// To parse this JSON data, do
//
//     final employeeListingModel = employeeListingModelFromJson(jsonString);

import 'dart:convert';

List<EmployeeListingModel> employeeListingModelFromJson(String str) =>
    List<EmployeeListingModel>.from(
        json.decode(str).map((x) => EmployeeListingModel.fromJson(x)));

String employeeListingModelToJson(List<EmployeeListingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeListingModel {
  EmployeeListingModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  String? profileImage;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  factory EmployeeListingModel.fromJson(Map<String, dynamic> json) =>
      EmployeeListingModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        profileImage: json["profile_image"] ?? "",
        address: json["address"] == null
            ? Address()
            : Address.fromJson(json["address"]),
        phone: json["phone"] ?? "",
        website: json["website"] ?? "",
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "profile_image": profileImage,
        "address": (address ?? Address()).toJson(),
        "phone": phone,
        "website": website,
        "company": (company ?? Company()).toJson(),
      };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
      };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"] ?? "",
        lng: json["lng"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] ?? "",
        catchPhrase: json["catchPhrase"] ?? "",
        bs: json["bs"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
