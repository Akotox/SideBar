// To parse this JSON data, do
//
//     final searchUser = searchUserFromJson(jsonString);

import 'dart:convert';

SearchUser? searchUserFromJson(String str) => SearchUser.fromJson(json.decode(str));

String searchUserToJson(SearchUser? data) => json.encode(data!.toJson());

class SearchUser {
    SearchUser({
        this.firstName,
        this.lastName,
        this.accountNumber,
        this.twodAccountNumber,
        this.idNumber,
        this.mobileNumber,
        this.dynamicFields,
    });

    String? firstName;
    String? lastName;
    String? accountNumber;
    dynamic twodAccountNumber;
    String? idNumber;
    String? mobileNumber;
    List<dynamic>? dynamicFields;

    factory SearchUser.fromJson(Map<String, dynamic> json) => SearchUser(
        firstName: json["firstName"],
        lastName: json["lastName"],
        accountNumber: json["accountNumber"],
        twodAccountNumber: json["twodAccountNumber"],
        idNumber: json["idNumber"],
        mobileNumber: json["mobileNumber"],
        dynamicFields: json["dynamicFields"] == null ? [] : List<dynamic>.from(json["dynamicFields"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "accountNumber": accountNumber,
        "twodAccountNumber": twodAccountNumber,
        "idNumber": idNumber,
        "mobileNumber": mobileNumber,
        "dynamicFields": dynamicFields == null ? [] : List<dynamic>.from(dynamicFields!.map((x) => x)),
    };
}
