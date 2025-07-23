import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';
import 'package:patient_app/core/models/user.dart';

class PharmacyModel extends GeneralModel {
  final int? pharmacyId;
  final String? name;
  final User? user;

  PharmacyModel({
    this.pharmacyId,
    this.name,
    this.user,
  });

  PharmacyModel copyWith({
    int? pharmacyId,
    String? name,
    User? user,
  }) =>
      PharmacyModel(
        pharmacyId: pharmacyId ?? this.pharmacyId,
        name: name ?? this.name,
        user: user ?? this.user,
      );

  factory PharmacyModel.fromRawJson(String str) =>
      PharmacyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PharmacyModel.fromJson(Map<String, dynamic> json) => PharmacyModel(
        pharmacyId: json["pharmacyId"],
        name: json["ph_name"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "pharmacyId": pharmacyId,
        "ph_name": name,
        "user": user?.toJson(),
      };

  @override
  GeneralModel fromJson(json) {
    return PharmacyModel.fromJson(json);
  }
}
