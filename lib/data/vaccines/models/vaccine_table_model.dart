import 'dart:convert';

import '../../../core/base_dio/general_model.dart';
import '../../../core/models/child.dart';
import '../../../core/models/user.dart';


import 'vaccine_model.dart';

class VaccineTableModel extends GeneralModel {
  final int? vaccinationTableId;
  final String? state;
  final DateTime? receivingDate;
  final DateTime? nextVisitDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? vaccineProviderId;
  final int? vaccineId;
  final int? childId;
  final Child? child;
  final VaccineModel? vaccine;
  final User? user;

  VaccineTableModel({
    this.vaccinationTableId,
    this.state,
    this.receivingDate,
    this.nextVisitDate,
    this.createdAt,
    this.updatedAt,
    this.vaccineProviderId,
    this.vaccineId,
    this.childId,
    this.child,
    this.vaccine,
    this.user,
  });

  VaccineTableModel copyWith({
    int? vaccinationTableId,
    String? state,
    DateTime? receivingDate,
    DateTime? nextVisitDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? vaccineProviderId,
    int? vaccineId,
    int? childId,
    Child? child,
    VaccineModel? vaccine,
    User? user,
  }) =>
      VaccineTableModel(
        vaccinationTableId: vaccinationTableId ?? this.vaccinationTableId,
        state: state ?? this.state,
        receivingDate: receivingDate ?? this.receivingDate,
        nextVisitDate: nextVisitDate ?? this.nextVisitDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        vaccineProviderId: vaccineProviderId ?? this.vaccineProviderId,
        vaccineId: vaccineId ?? this.vaccineId,
        childId: childId ?? this.childId,
        child: child ?? this.child,
        vaccine: vaccine ?? this.vaccine,
        user: user ?? this.user,
      );

  factory VaccineTableModel.fromRawJson(String str) =>
      VaccineTableModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VaccineTableModel.fromJson(Map<String, dynamic> json) =>
      VaccineTableModel(
        vaccinationTableId: json["vaccinationTableId"],
        state: json["state"],
        receivingDate: json["receiving_date"] == null
            ? null
            : DateTime.parse(json["receiving_date"]),
        nextVisitDate: json["next_visit_date"] == null
            ? null
            : DateTime.parse(json["next_visit_date"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        vaccineProviderId: json["vaccine_provider_id"],
        vaccineId: json["vaccine_id"],
        childId: json["child_id"],
        child: json["child"] == null ? null : Child.fromJson(json["child"]),
        vaccine:
            json["vaccine"] == null ? null : VaccineModel.fromJson(json["vaccine"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "vaccinationTableId": vaccinationTableId,
        "state": state,
        "receiving_date": receivingDate?.toIso8601String(),
        "next_visit_date":
            "${nextVisitDate!.year.toString().padLeft(4, '0')}-${nextVisitDate!.month.toString().padLeft(2, '0')}-${nextVisitDate!.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "vaccine_provider_id": vaccineProviderId,
        "vaccine_id": vaccineId,
        "child_id": childId,
        "child": child?.toJson(),
        "vaccine": vaccine?.toJson(),
        "user": user?.toJson(),
      };

  @override
  GeneralModel fromJson(json) {
    return VaccineTableModel.fromJson(json);
  }
}

