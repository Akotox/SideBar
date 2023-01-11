// To parse this JSON data, do
//
//     final innbucksUser = innbucksUserFromJson(jsonString);

import 'dart:convert';

InnbucksUser? innbucksUserFromJson(String str) => InnbucksUser.fromJson(json.decode(str));

String innbucksUserToJson(InnbucksUser? data) => json.encode(data!.toJson());

class InnbucksUser {
    InnbucksUser({
        this.userName,
        this.password,
        this.identifier,
    });

    String? userName;
    String? password;
    String? identifier;

    factory InnbucksUser.fromJson(Map<String, dynamic> json) => InnbucksUser(
        userName: json["userName"],
        password: json["password"],
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "identifier": identifier,
    };
}
