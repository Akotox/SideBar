// To parse this JSON data, do
//
//     final balanceEnquiry = balanceEnquiryFromJson(jsonString);

import 'dart:convert';

BalanceEnquiry? balanceEnquiryFromJson(String str) => BalanceEnquiry.fromJson(json.decode(str));

String balanceEnquiryToJson(BalanceEnquiry? data) => json.encode(data!.toJson());

class BalanceEnquiry {
    BalanceEnquiry({
        this.stan,
        this.authNumber,
        this.processedDateTime,
        this.responseCode,
        this.responseMsg,
        this.accountNumber,
        this.fees,
        this.currency,
        this.currencySymbol,
        this.available,
        this.ledger,
        this.allocations,
    });

    String? stan;
    String? authNumber;
    String? processedDateTime;
    int? responseCode;
    String? responseMsg;
    String? accountNumber;
    List<dynamic>? fees;
    String? currency;
    String? currencySymbol;
    String? available;
    String? ledger;
    List<dynamic>? allocations;

    factory BalanceEnquiry.fromJson(Map<String, dynamic> json) => BalanceEnquiry(
        stan: json["stan"],
        authNumber: json["authNumber"],
        processedDateTime: json["processedDateTime"],
        responseCode: json["responseCode"],
        responseMsg: json["responseMsg"],
        accountNumber: json["accountNumber"],
        fees: json["fees"] == null ? [] : List<dynamic>.from(json["fees"]!.map((x) => x)),
        currency: json["currency"],
        currencySymbol: json["currencySymbol"],
        available: json["available"],
        ledger: json["ledger"],
        allocations: json["allocations"] == null ? [] : List<dynamic>.from(json["allocations"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "stan": stan,
        "authNumber": authNumber,
        "processedDateTime": processedDateTime,
        "responseCode": responseCode,
        "responseMsg": responseMsg,
        "accountNumber": accountNumber,
        "fees": fees == null ? [] : List<dynamic>.from(fees!.map((x) => x)),
        "currency": currency,
        "currencySymbol": currencySymbol,
        "available": available,
        "ledger": ledger,
        "allocations": allocations == null ? [] : List<dynamic>.from(allocations!.map((x) => x)),
    };
}
