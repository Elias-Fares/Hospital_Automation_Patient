import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';
import 'package:patient_app/core/models/work_day.dart';

class DoctorProfileModel extends GeneralModel {
  final int? userId;
  final String? role;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final bool? verifiedResetPassword;
  final bool? verifiedAccount;
  final String? phoneNumber;
  final String? addressGovernorate;
  final String? addressCity;
  final String? addressRegion;
  final String? addressStreet;
  final String? addressNote;
  final String? specialty;
  final String? imgurl;
  final dynamic medicalLicenseImgUrl;
  final String? gender;
  final bool? isSuspended;
  final dynamic suspendingReason;
  final bool? isResigned;
  final dynamic workStartDate;
  final dynamic workEndDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? clinicId;
  final dynamic resignedBy;
  final dynamic suspendedBy;
  final int? acceptedBy;
  final List<AppointmentType>? appointmentTypes;
  final List<WorkDay>? workDays;

  DoctorProfileModel({
    this.userId,
    this.role,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.verifiedResetPassword,
    this.verifiedAccount,
    this.phoneNumber,
    this.addressGovernorate,
    this.addressCity,
    this.addressRegion,
    this.addressStreet,
    this.addressNote,
    this.specialty,
    this.imgurl,
    this.medicalLicenseImgUrl,
    this.gender,
    this.isSuspended,
    this.suspendingReason,
    this.isResigned,
    this.workStartDate,
    this.workEndDate,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
    this.resignedBy,
    this.suspendedBy,
    this.acceptedBy,
    this.appointmentTypes,
    this.workDays,
  });

  DoctorProfileModel copyWith({
    int? userId,
    String? role,
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
    bool? verifiedResetPassword,
    bool? verifiedAccount,
    String? phoneNumber,
    String? addressGovernorate,
    String? addressCity,
    String? addressRegion,
    String? addressStreet,
    String? addressNote,
    String? specialty,
    String? imgurl,
    dynamic medicalLicenseImgUrl,
    String? gender,
    bool? isSuspended,
    dynamic suspendingReason,
    bool? isResigned,
    dynamic workStartDate,
    dynamic workEndDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? clinicId,
    dynamic resignedBy,
    dynamic suspendedBy,
    int? acceptedBy,
    List<AppointmentType>? appointmentTypes,
    List<WorkDay>? workDays,
  }) =>
      DoctorProfileModel(
        userId: userId ?? this.userId,
        role: role ?? this.role,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        middleName: middleName ?? this.middleName,
        verifiedResetPassword:
            verifiedResetPassword ?? this.verifiedResetPassword,
        verifiedAccount: verifiedAccount ?? this.verifiedAccount,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        addressGovernorate: addressGovernorate ?? this.addressGovernorate,
        addressCity: addressCity ?? this.addressCity,
        addressRegion: addressRegion ?? this.addressRegion,
        addressStreet: addressStreet ?? this.addressStreet,
        addressNote: addressNote ?? this.addressNote,
        specialty: specialty ?? this.specialty,
        imgurl: imgurl ?? this.imgurl,
        medicalLicenseImgUrl: medicalLicenseImgUrl ?? this.medicalLicenseImgUrl,
        gender: gender ?? this.gender,
        isSuspended: isSuspended ?? this.isSuspended,
        suspendingReason: suspendingReason ?? this.suspendingReason,
        isResigned: isResigned ?? this.isResigned,
        workStartDate: workStartDate ?? this.workStartDate,
        workEndDate: workEndDate ?? this.workEndDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        clinicId: clinicId ?? this.clinicId,
        resignedBy: resignedBy ?? this.resignedBy,
        suspendedBy: suspendedBy ?? this.suspendedBy,
        acceptedBy: acceptedBy ?? this.acceptedBy,
        appointmentTypes: appointmentTypes ?? this.appointmentTypes,
        workDays: workDays ?? this.workDays,
      );

  factory DoctorProfileModel.fromRawJson(String str) =>
      DoctorProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) =>
      DoctorProfileModel(
        userId: json["userId"],
        role: json["role"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        middleName: json["middle_name"],
        verifiedResetPassword: json["verified_reset_password"],
        verifiedAccount: json["verified_account"],
        phoneNumber: json["phone_number"],
        addressGovernorate: json["address_governorate"],
        addressCity: json["address_city"],
        addressRegion: json["address_region"],
        addressStreet: json["address_street"],
        addressNote: json["address_note"],
        specialty: json["specialty"],
        imgurl: json["imgurl"],
        medicalLicenseImgUrl: json["medical_license_img_url"],
        gender: json["gender"],
        isSuspended: json["is_suspended"],
        suspendingReason: json["suspending_reason"],
        isResigned: json["is_resigned"],
        workStartDate: json["work_start_date"],
        workEndDate: json["work_end_date"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        clinicId: json["clinic_id"],
        resignedBy: json["resigned_by"],
        suspendedBy: json["suspended_by"],
        acceptedBy: json["accepted_by"],
        appointmentTypes: json["appointment_types"] == null
            ? []
            : List<AppointmentType>.from(json["appointment_types"]!
                .map((x) => AppointmentType.fromJson(x))),
        workDays: json["work_days"] == null
            ? []
            : List<WorkDay>.from(
                json["work_days"]!.map((x) => WorkDay.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "role": role,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "middle_name": middleName,
        "verified_reset_password": verifiedResetPassword,
        "verified_account": verifiedAccount,
        "phone_number": phoneNumber,
        "address_governorate": addressGovernorate,
        "address_city": addressCity,
        "address_region": addressRegion,
        "address_street": addressStreet,
        "address_note": addressNote,
        "specialty": specialty,
        "imgurl": imgurl,
        "medical_license_img_url": medicalLicenseImgUrl,
        "gender": gender,
        "is_suspended": isSuspended,
        "suspending_reason": suspendingReason,
        "is_resigned": isResigned,
        "work_start_date": workStartDate,
        "work_end_date": workEndDate,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "clinic_id": clinicId,
        "resigned_by": resignedBy,
        "suspended_by": suspendedBy,
        "accepted_by": acceptedBy,
        "appointment_types": appointmentTypes == null
            ? []
            : List<dynamic>.from(appointmentTypes!.map((x) => x.toJson())),
        "work_days": workDays == null
            ? []
            : List<dynamic>.from(workDays!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return DoctorProfileModel.fromJson(json);
  }
}

class AppointmentType {
  final int? appointmentTypesId;
  final String? typeName;
  final int? standardDuration;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? doctorId;

  AppointmentType({
    this.appointmentTypesId,
    this.typeName,
    this.standardDuration,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.doctorId,
  });

  AppointmentType copyWith({
    int? appointmentTypesId,
    String? typeName,
    int? standardDuration,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? doctorId,
  }) =>
      AppointmentType(
        appointmentTypesId: appointmentTypesId ?? this.appointmentTypesId,
        typeName: typeName ?? this.typeName,
        standardDuration: standardDuration ?? this.standardDuration,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        doctorId: doctorId ?? this.doctorId,
      );

  factory AppointmentType.fromRawJson(String str) =>
      AppointmentType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppointmentType.fromJson(Map<String, dynamic> json) =>
      AppointmentType(
        appointmentTypesId: json["appointment_typesId"],
        typeName: json["type_name"],
        standardDuration: json["standard_duration"],
        description: json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        doctorId: json["doctor_id"],
      );

  Map<String, dynamic> toJson() => {
        "appointment_typesId": appointmentTypesId,
        "type_name": typeName,
        "standard_duration": standardDuration,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "doctor_id": doctorId,
      };
}

// class WorkDay {
//   final int? workDaysId;
//   final String? day;
//   final String? workStartTime;
//   final String? workEndTime;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic pharmacyId;
//   final int? doctorId;
//   final dynamic clinicId;

//   WorkDay({
//     this.workDaysId,
//     this.day,
//     this.workStartTime,
//     this.workEndTime,
//     this.createdAt,
//     this.updatedAt,
//     this.pharmacyId,
//     this.doctorId,
//     this.clinicId,
//   });

//   WorkDay copyWith({
//     int? workDaysId,
//     String? day,
//     String? workStartTime,
//     String? workEndTime,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     dynamic pharmacyId,
//     int? doctorId,
//     dynamic clinicId,
//   }) =>
//       WorkDay(
//         workDaysId: workDaysId ?? this.workDaysId,
//         day: day ?? this.day,
//         workStartTime: workStartTime ?? this.workStartTime,
//         workEndTime: workEndTime ?? this.workEndTime,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         pharmacyId: pharmacyId ?? this.pharmacyId,
//         doctorId: doctorId ?? this.doctorId,
//         clinicId: clinicId ?? this.clinicId,
//       );

//   factory WorkDay.fromRawJson(String str) => WorkDay.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory WorkDay.fromJson(Map<String, dynamic> json) => WorkDay(
//         workDaysId: json["work_DaysId"],
//         day: json["day"],
//         workStartTime: json["work_start_time"],
//         workEndTime: json["work_end_time"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         pharmacyId: json["pharmacy_id"],
//         doctorId: json["doctor_id"],
//         clinicId: json["clinic_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "work_DaysId": workDaysId,
//         "day": day,
//         "work_start_time": workStartTime,
//         "work_end_time": workEndTime,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "pharmacy_id": pharmacyId,
//         "doctor_id": doctorId,
//         "clinic_id": clinicId,
//       };
// }
