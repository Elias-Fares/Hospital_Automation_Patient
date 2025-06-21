import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';

import 'package:patient_app/core/models/user.dart';

class ChildProfileModel extends GeneralModel {
  final int? childId;
  final String? firstName;
  final String? lastName;
  final String? fatherFirstName;
  final String? fatherLastName;
  final String? motherFirstName;
  final String? motherLastName;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? birthCertificateImgUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? employeeId;
  final User? user;

  ChildProfileModel({
    this.childId,
    this.firstName,
    this.lastName,
    this.fatherFirstName,
    this.fatherLastName,
    this.motherFirstName,
    this.motherLastName,
    this.dateOfBirth,
    this.gender,
    this.birthCertificateImgUrl,
    this.createdAt,
    this.updatedAt,
    this.employeeId,
    this.user,
  });

  ChildProfileModel copyWith({
    int? childId,
    String? firstName,
    String? lastName,
    String? fatherFirstName,
    String? fatherLastName,
    String? motherFirstName,
    String? motherLastName,
    DateTime? dateOfBirth,
    String? gender,
    String? birthCertificateImgUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? employeeId,
    User? user,
  }) =>
      ChildProfileModel(
        childId: childId ?? this.childId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        fatherFirstName: fatherFirstName ?? this.fatherFirstName,
        fatherLastName: fatherLastName ?? this.fatherLastName,
        motherFirstName: motherFirstName ?? this.motherFirstName,
        motherLastName: motherLastName ?? this.motherLastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        birthCertificateImgUrl:
            birthCertificateImgUrl ?? this.birthCertificateImgUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        employeeId: employeeId ?? this.employeeId,
        user: user ?? this.user,
      );

  factory ChildProfileModel.fromRawJson(String str) =>
      ChildProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChildProfileModel.fromJson(Map<String, dynamic> json) =>
      ChildProfileModel(
        childId: json["childId"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fatherFirstName: json["father_first_name"],
        fatherLastName: json["father_last_name"],
        motherFirstName: json["mother_first_name"],
        motherLastName: json["mother_last_name"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        birthCertificateImgUrl: json["birth_certificate_img_url"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        employeeId: json["employee_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "childId": childId,
        "first_name": firstName,
        "last_name": lastName,
        "father_first_name": fatherFirstName,
        "father_last_name": fatherLastName,
        "mother_first_name": motherFirstName,
        "mother_last_name": motherLastName,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "birth_certificate_img_url": birthCertificateImgUrl,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "employee_id": employeeId,
        "user": user?.toJson(),
      };

  @override
  GeneralModel fromJson(json) {
    return ChildProfileModel.fromJson(json);
  }
}
