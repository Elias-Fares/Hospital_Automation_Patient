import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';

import '../../../core/models/user.dart';

import 'dart:convert';

class DepartmentModel extends GeneralModel {
  final int? clinicId;
  final String? firstAvailableTime;
  final String? name;
  final bool? providesVaccines;
  final bool? isDeactivated;
  final dynamic deactivationReason;
  final DateTime? creationDate;
  final dynamic closingDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deactivatedBy;
  final List<User>? users;
  final List<WorkDay>? workDays;
  final List<ClinicService>? clinicServices;

  DepartmentModel({
    this.clinicId,
    this.firstAvailableTime,
    this.name,
    this.providesVaccines,
    this.isDeactivated,
    this.deactivationReason,
    this.creationDate,
    this.closingDate,
    this.createdAt,
    this.updatedAt,
    this.deactivatedBy,
    this.users,
    this.workDays,
    this.clinicServices,
  });

  DepartmentModel copyWith({
    int? clinicId,
    String? firstAvailableTime,
    String? name,
    bool? providesVaccines,
    bool? isDeactivated,
    dynamic deactivationReason,
    DateTime? creationDate,
    dynamic closingDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deactivatedBy,
    List<User>? users,
    List<WorkDay>? workDays,
    List<ClinicService>? clinicServices,
  }) =>
      DepartmentModel(
        clinicId: clinicId ?? this.clinicId,
        firstAvailableTime: firstAvailableTime ?? this.firstAvailableTime,
        name: name ?? this.name,
        providesVaccines: providesVaccines ?? this.providesVaccines,
        isDeactivated: isDeactivated ?? this.isDeactivated,
        deactivationReason: deactivationReason ?? this.deactivationReason,
        creationDate: creationDate ?? this.creationDate,
        closingDate: closingDate ?? this.closingDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deactivatedBy: deactivatedBy ?? this.deactivatedBy,
        users: users ?? this.users,
        workDays: workDays ?? this.workDays,
        clinicServices: clinicServices ?? this.clinicServices,
      );

  factory DepartmentModel.fromRawJson(String str) =>
      DepartmentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
        clinicId: json["clinicId"],
        firstAvailableTime: json["first_available_time"],
        name: json["name"],
        providesVaccines: json["provides_vaccines"],
        isDeactivated: json["is_deactivated"],
        deactivationReason: json["deactivation_reason"],
        creationDate: json["creation_date"] == null
            ? null
            : DateTime.parse(json["creation_date"]),
        closingDate: json["closing_date"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deactivatedBy: json["deactivated_by"],
        users: json["users"] == null
            ? []
            : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
        workDays: json["work_days"] == null
            ? []
            : List<WorkDay>.from(
                json["work_days"]!.map((x) => WorkDay.fromJson(x))),
        clinicServices: json["clinic_Services"] == null
            ? []
            : List<ClinicService>.from(
                json["clinic_Services"]!.map((x) => ClinicService.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clinicId": clinicId,
        "first_available_time": firstAvailableTime,
        "name": name,
        "provides_vaccines": providesVaccines,
        "is_deactivated": isDeactivated,
        "deactivation_reason": deactivationReason,
        "creation_date":
            "${creationDate!.year.toString().padLeft(4, '0')}-${creationDate!.month.toString().padLeft(2, '0')}-${creationDate!.day.toString().padLeft(2, '0')}",
        "closing_date": closingDate,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deactivated_by": deactivatedBy,
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x)),
        "work_days": workDays == null
            ? []
            : List<dynamic>.from(workDays!.map((x) => x.toJson())),
        "clinic_Services": clinicServices == null
            ? []
            : List<dynamic>.from(clinicServices!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return DepartmentModel.fromJson(json);
  }
}

class ClinicService {
  final int? clinicServicesId;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? clinicId;

  ClinicService({
    this.clinicServicesId,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
  });

  ClinicService copyWith({
    int? clinicServicesId,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? clinicId,
  }) =>
      ClinicService(
        clinicServicesId: clinicServicesId ?? this.clinicServicesId,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        clinicId: clinicId ?? this.clinicId,
      );

  factory ClinicService.fromRawJson(String str) =>
      ClinicService.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClinicService.fromJson(Map<String, dynamic> json) => ClinicService(
        clinicServicesId: json["Clinic_ServicesId"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        clinicId: json["clinic_id"],
      );

  Map<String, dynamic> toJson() => {
        "Clinic_ServicesId": clinicServicesId,
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "clinic_id": clinicId,
      };
}

class WorkDay {
  final String? day;
  final int? workDaysId;
  final String? workStartTime;
  final String? workEndTime;

  WorkDay({
    this.day,
    this.workDaysId,
    this.workStartTime,
    this.workEndTime,
  });

  WorkDay copyWith({
    String? day,
    int? workDaysId,
    String? workStartTime,
    String? workEndTime,
  }) =>
      WorkDay(
        day: day ?? this.day,
        workDaysId: workDaysId ?? this.workDaysId,
        workStartTime: workStartTime ?? this.workStartTime,
        workEndTime: workEndTime ?? this.workEndTime,
      );

  factory WorkDay.fromRawJson(String str) => WorkDay.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WorkDay.fromJson(Map<String, dynamic> json) => WorkDay(
        day: json["day"],
        workDaysId: json["work_DaysId"],
        workStartTime: json["work_start_time"],
        workEndTime: json["work_end_time"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "work_DaysId": workDaysId,
        "work_start_time": workStartTime,
        "work_end_time": workEndTime,
      };
}
