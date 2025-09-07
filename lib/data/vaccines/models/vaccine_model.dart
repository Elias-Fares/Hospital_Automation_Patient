import 'dart:convert';

import '../../../core/base_dio/general_model.dart';

class VaccineModel extends GeneralModel {
  final int? vaccinesId;
  final String? name;
  final String? description;
  final int? minAge;
  final int? maxAge;
  final String? minAgeUnit;
  final String? maxAgeUnit;
  final int? visitNumber;
  final int? quantity;
  final String? state;
  final List<Interaction>? interactions;

  VaccineModel({
    this.vaccinesId,
    this.name,
    this.description,
    this.minAge,
    this.maxAge,
    this.minAgeUnit,
    this.maxAgeUnit,
    this.visitNumber,
    this.quantity,
    this.state,
    this.interactions,
  });

  VaccineModel copyWith({
    int? vaccinesId,
    String? name,
    String? description,
    int? minAge,
    int? maxAge,
    String? minAgeUnit,
    String? maxAgeUnit,
    int? visitNumber,
    int? quantity,
    String? state,
    List<Interaction>? interactions,
  }) =>
      VaccineModel(
        vaccinesId: vaccinesId ?? this.vaccinesId,
        name: name ?? this.name,
        description: description ?? this.description,
        minAge: minAge ?? this.minAge,
        maxAge: maxAge ?? this.maxAge,
        minAgeUnit: minAgeUnit ?? this.minAgeUnit,
        maxAgeUnit: maxAgeUnit ?? this.maxAgeUnit,
        visitNumber: visitNumber ?? this.visitNumber,
        quantity: quantity ?? this.quantity,
        state: state ?? this.state,
        interactions: interactions ?? this.interactions,
      );

  factory VaccineModel.fromRawJson(String str) =>
      VaccineModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VaccineModel.fromJson(Map<String, dynamic> json) => VaccineModel(
        vaccinesId: json["vaccinesId"],
        name: json["name"],
        description: json["description"],
        minAge: json["minAge"],
        maxAge: json["maxAge"],
        minAgeUnit: json["minAgeUnit"],
        maxAgeUnit: json["maxAgeUnit"],
        visitNumber: json["visit_number"],
        quantity: json["quantity"],
        state: json["state"],
        interactions: json["interactions"] == null
            ? []
            : List<Interaction>.from(
                json["interactions"]!.map((x) => Interaction.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "vaccinesId": vaccinesId,
        "name": name,
        "description": description,
        "minAge": minAge,
        "maxAge": maxAge,
        "minAgeUnit": minAgeUnit,
        "maxAgeUnit": maxAgeUnit,
        "visit_number": visitNumber,
        "quantity": quantity,
        "state": state,
        "interactions": interactions == null
            ? []
            : List<dynamic>.from(interactions!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return VaccineModel.fromJson(json);
  }
}

class Interaction {
  final int? interactionsId;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? vaccinId;

  Interaction({
    this.interactionsId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.vaccinId,
  });

  Interaction copyWith({
    int? interactionsId,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? vaccinId,
  }) =>
      Interaction(
        interactionsId: interactionsId ?? this.interactionsId,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        vaccinId: vaccinId ?? this.vaccinId,
      );

  factory Interaction.fromRawJson(String str) =>
      Interaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Interaction.fromJson(Map<String, dynamic> json) => Interaction(
        interactionsId: json["interactionsId"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        vaccinId: json["vaccin_id"],
      );

  Map<String, dynamic> toJson() => {
        "interactionsId": interactionsId,
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "vaccin_id": vaccinId,
      };
}
