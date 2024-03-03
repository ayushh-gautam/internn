// To parse this JSON data, do
//
//     final homeDataModel = homeDataModelFromJson(jsonString);

import 'dart:convert';

HomeDataModel homeDataModelFromJson(String str) => HomeDataModel.fromJson(json.decode(str));

String homeDataModelToJson(HomeDataModel data) => json.encode(data.toJson());

class HomeDataModel {
    String? message;
    Data? data;

    HomeDataModel({
        this.message,
        this.data,
    });

    factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    List<Member>? members;
    int? currentPage;
    int? lastPage;
    String? nextPageUrl;
    dynamic prevPageUrl;
    int? perPage;

    Data({
        this.members,
        this.currentPage,
        this.lastPage,
        this.nextPageUrl,
        this.prevPageUrl,
        this.perPage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        members: json["members"] == null ? [] : List<Member>.from(json["members"]!.map((x) => Member.fromJson(x))),
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
        perPage: json["per_page"],
    );

    Map<String, dynamic> toJson() => {
        "members": members == null ? [] : List<dynamic>.from(members!.map((x) => x.toJson())),
        "current_page": currentPage,
        "last_page": lastPage,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
        "per_page": perPage,
    };
}

class Member {
    String? id;
    String? image;
    String? name;
    String? classification;
    String? email;
    String? phone;
    String? club;

    Member({
        this.id,
        this.image,
        this.name,
        this.classification,
        this.email,
        this.phone,
        this.club,
    });

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        classification: json["classification"],
        email: json["email"],
        phone: json["phone"],
        club: json["club"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "classification": classification,
        "email": email,
        "phone": phone,
        "club": club,
    };
}