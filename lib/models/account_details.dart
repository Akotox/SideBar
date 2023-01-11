// To parse this JSON data, do
//
//     final accountDetails = accountDetailsFromJson(jsonString);

import 'dart:convert';

AccountDetails? accountDetailsFromJson(String str) => AccountDetails.fromJson(json.decode(str));

String accountDetailsToJson(AccountDetails? data) => json.encode(data!.toJson());

class AccountDetails {
    AccountDetails({
        this.stan,
        this.authNumber,
        this.processedDateTime,
        this.responseCode,
        this.responseMsg,
        this.accountNumber,
        this.personDetail,
    });

    String? stan;
    String? authNumber;
    String? processedDateTime;
    int? responseCode;
    String? responseMsg;
    String? accountNumber;
    PersonDetail? personDetail;

    factory AccountDetails.fromJson(Map<String, dynamic> json) => AccountDetails(
        stan: json["stan"],
        authNumber: json["authNumber"],
        processedDateTime: json["processedDateTime"],
        responseCode: json["responseCode"],
        responseMsg: json["responseMsg"],
        accountNumber: json["accountNumber"],
        personDetail: PersonDetail.fromJson(json["personDetail"]),
    );

    Map<String, dynamic> toJson() => {
        "stan": stan,
        "authNumber": authNumber,
        "processedDateTime": processedDateTime,
        "responseCode": responseCode,
        "responseMsg": responseMsg,
        "accountNumber": accountNumber,
        "personDetail": personDetail!.toJson(),
    };
}

class PersonDetail {
    PersonDetail({
        this.firstName,
        this.lastName,
        this.accountNumber,
        this.twodAccountNumber,
        this.idNumber,
        this.dateOfBirth,
        this.nationality,
        this.mobileNumber,
        this.email,
        this.address1,
        this.address2,
        this.address3,
        this.occupation,
        this.lastUpdate,
        this.dynamicFields,
        this.accountAccesses,
    });

    String? firstName;
    String? lastName;
    String? accountNumber;
    dynamic twodAccountNumber;
    String? idNumber;
    DateTime? dateOfBirth;
    String? nationality;
    String? mobileNumber;
    String? email;
    String? address1;
    String? address2;
    String? address3;
    String? occupation;
    DateTime? lastUpdate;
    DynamicFields? dynamicFields;
    List<AccountAccess?>? accountAccesses;

    factory PersonDetail.fromJson(Map<String, dynamic> json) => PersonDetail(
        firstName: json["firstName"],
        lastName: json["lastName"],
        accountNumber: json["accountNumber"],
        twodAccountNumber: json["twodAccountNumber"],
        idNumber: json["idNumber"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationality: json["nationality"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        address3: json["address3"],
        occupation: json["occupation"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        dynamicFields: DynamicFields.fromJson(json["dynamicFields"]),
        accountAccesses: json["accountAccesses"] == null ? [] : List<AccountAccess?>.from(json["accountAccesses"]!.map((x) => AccountAccess.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "accountNumber": accountNumber,
        "twodAccountNumber": twodAccountNumber,
        "idNumber": idNumber,
        "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "nationality": nationality,
        "mobileNumber": mobileNumber,
        "email": email,
        "address1": address1,
        "address2": address2,
        "address3": address3,
        "occupation": occupation,
        "lastUpdate": lastUpdate?.toIso8601String(),
        "dynamicFields": dynamicFields!.toJson(),
        "accountAccesses": accountAccesses == null ? [] : List<dynamic>.from(accountAccesses!.map((x) => x!.toJson())),
    };
}

class AccountAccess {
    AccountAccess({
        this.type,
        this.number,
    });

    String? type;
    String? number;

    factory AccountAccess.fromJson(Map<String, dynamic> json) => AccountAccess(
        type: json["type"],
        number: json["number"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "number": number,
    };
}

class DynamicFields {
    DynamicFields({
        this.documents,
        this.dynamicFieldsDefault,
    });

    List<Default?>? documents;
    List<Default?>? dynamicFieldsDefault;

    factory DynamicFields.fromJson(Map<String, dynamic> json) => DynamicFields(
        documents: json["Documents"] == null ? [] : List<Default?>.from(json["Documents"]!.map((x) => Default.fromJson(x))),
        dynamicFieldsDefault: json["Default"] == null ? [] : List<Default?>.from(json["Default"]!.map((x) => Default.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Documents": documents == null ? [] : List<dynamic>.from(documents!.map((x) => x!.toJson())),
        "Default": dynamicFieldsDefault == null ? [] : List<dynamic>.from(dynamicFieldsDefault!.map((x) => x!.toJson())),
    };
}

class Default {
    Default({
        this.name,
        this.value,
        this.dataType,
        this.options,
    });

    String? name;
    String? value;
    String? dataType;
    List<String?>? options;

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        name: json["name"],
        value: json["value"],
        dataType: json["dataType"],
        options: json["options"] == null ? [] : json["options"] == null ? [] : List<String?>.from(json["options"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "dataType": dataType,
        "options": options == null ? [] : options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
    };
}
