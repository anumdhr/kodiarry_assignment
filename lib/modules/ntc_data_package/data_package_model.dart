// To parse this JSON data, do
//
//     final dataPackageModel = dataPackageModelFromJson(jsonString);

import 'dart:convert';

DataPackageModel dataPackageModelFromJson(String str) => DataPackageModel.fromJson(json.decode(str));

String dataPackageModelToJson(DataPackageModel data) => json.encode(data.toJson());

class DataPackageModel {
  final String? title;
  final List<Subpackage>? subpackages;

  DataPackageModel({
    this.title,
    this.subpackages,
  });

  factory DataPackageModel.fromJson(Map<String, dynamic> json) => DataPackageModel(
    title: json["title"],
    subpackages: json["subpackages"] == null ? [] : List<Subpackage>.from(json["subpackages"]!.map((x) => Subpackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subpackages": subpackages == null ? [] : List<dynamic>.from(subpackages!.map((x) => x.toJson())),
  };
}

class Subpackage {
  final String? title;
  final List<Datapackage>? datapackages;

  Subpackage({
    this.title,
    this.datapackages,
  });

  factory Subpackage.fromJson(Map<String, dynamic> json) => Subpackage(
    title: json["title"],
    datapackages: json["datapackages"] == null ? [] : List<Datapackage>.from(json["datapackages"]!.map((x) => Datapackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "datapackages": datapackages == null ? [] : List<dynamic>.from(datapackages!.map((x) => x.toJson())),
  };
}

class Datapackage {
  final int? pId;
  final String? title;
  final String? packageTypeTitle;
  final int? parentOrder;
  final int? childOrder;
  final String? subPackageTitle;
  final int? gift;
  final String? busicode;
  final dynamic offlinecode;
  final String? validity;
  final int? parentId;
  final DateTime? expiryDate;
  final DateTime? publishDate;
  final String? service;
  final String? serviceType;
  final int? amount;
  final String? description;

  Datapackage({
    this.pId,
    this.title,
    this.packageTypeTitle,
    this.parentOrder,
    this.childOrder,
    this.subPackageTitle,
    this.gift,
    this.busicode,
    this.offlinecode,
    this.validity,
    this.parentId,
    this.expiryDate,
    this.publishDate,
    this.service,
    this.serviceType,
    this.amount,
    this.description,
  });

  factory Datapackage.fromJson(Map<String, dynamic> json) => Datapackage(
    pId: json["p_id"],
    title: json["title"],
    packageTypeTitle: json["package_type_title"],
    parentOrder: json["parent_order"],
    childOrder: json["child_order"],
    subPackageTitle: json["sub_package_title"],
    gift: json["gift"],
    busicode: json["busicode"],
    offlinecode: json["offlinecode"],
    validity: json["validity"],
    parentId: json["parent_id"],
    expiryDate: json["expiry_date"] == null ? null : DateTime.parse(json["expiry_date"]),
    publishDate: json["publish_date"] == null ? null : DateTime.parse(json["publish_date"]),
    service: json["service"],
    serviceType: json["service_type"],
    amount: json["amount"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "p_id": pId,
    "title": title,
    "package_type_title": packageTypeTitle,
    "parent_order": parentOrder,
    "child_order": childOrder,
    "sub_package_title": subPackageTitle,
    "gift": gift,
    "busicode": busicode,
    "offlinecode": offlinecode,
    "validity": validity,
    "parent_id": parentId,
    "expiry_date": expiryDate?.toIso8601String(),
    "publish_date": publishDate?.toIso8601String(),
    "service": service,
    "service_type": serviceType,
    "amount": amount,
    "description": description,
  };
}
