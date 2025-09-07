import 'dart:convert';

import '../../../core/base_dio/general_model.dart';
import '../../../core/models/user.dart';

class ChildProfileModel extends GeneralModel {
  final ChildProfileData? childProfileData;
  final DateTime? lastAppointment;
  final DateTime? lastVaccine;
  final int? numOfGuardian;

  ChildProfileModel({
    this.childProfileData,
    this.lastAppointment,
    this.lastVaccine,
    this.numOfGuardian,
  });

  ChildProfileModel copyWith({
    ChildProfileData? childProfileData,
    DateTime? lastAppointment,
    DateTime? lastVaccine,
    int? numOfGuardian,
  }) =>
      ChildProfileModel(
        childProfileData: childProfileData ?? this.childProfileData,
        lastAppointment: lastAppointment ?? this.lastAppointment,
        lastVaccine: lastVaccine ?? this.lastVaccine,
        numOfGuardian: numOfGuardian ?? this.numOfGuardian,
      );

  factory ChildProfileModel.fromRawJson(String str) =>
      ChildProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChildProfileModel.fromJson(Map<String, dynamic> json) =>
      ChildProfileModel(
        childProfileData: json["data"] == null ? null : ChildProfileData.fromJson(json["data"]),
        lastAppointment: json["last_appointment"] == null
            ? null
            : DateTime.parse(json["last_appointment"]),
        lastVaccine: json["last_vaccine"] == null
            ? null
            : DateTime.parse(json["last_vaccine"]),
        numOfGuardian: json["numOfGuardian"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "data":childProfileData?.toJson(),
        "last_appointment":
            "${lastAppointment!.year.toString().padLeft(4, '0')}-${lastAppointment!.month.toString().padLeft(2, '0')}-${lastAppointment!.day.toString().padLeft(2, '0')}",
        "last_vaccine": lastVaccine?.toIso8601String(),
        "numOfGuardian": numOfGuardian,
      };

  @override
  GeneralModel fromJson(json) {
    return ChildProfileModel.fromJson(json);
  }
}

class ChildProfileData {
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

  ChildProfileData({
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

  ChildProfileData copyWith({
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
      ChildProfileData(
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

  factory ChildProfileData.fromRawJson(String str) => ChildProfileData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChildProfileData.fromJson(Map<String, dynamic> json) => ChildProfileData(
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
}

