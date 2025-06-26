import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';

class UserProfileModel extends GeneralModel {
  final UserProfileData? userProfileData;
  final DateTime? lastAppointment;
  final DateTime? nextVisit;

  UserProfileModel({
    this.userProfileData,
    this.lastAppointment,
    this.nextVisit,
  });

  UserProfileModel copyWith({
    UserProfileData? userProfileData,
    DateTime? lastAppointment,
    DateTime? nextVisit,
  }) =>
      UserProfileModel(
        userProfileData: userProfileData ?? this.userProfileData,
        lastAppointment: lastAppointment ?? this.lastAppointment,
        nextVisit: nextVisit ?? this.nextVisit,
      );



  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        userProfileData: json["data"] == null ? null : UserProfileData.fromJson(json["data"]),
        lastAppointment: json["last_appointment"] == null
            ? null
            : DateTime.parse(json["last_appointment"]),
        nextVisit: json["next_visit"] == null
            ? null
            : DateTime.parse(json["next_visit"]),
      );

  Map<String, dynamic> toJson() => {
        "data": userProfileData?.toJson(),
        "last_appointment":
            "${lastAppointment!.year.toString().padLeft(4, '0')}-${lastAppointment!.month.toString().padLeft(2, '0')}-${lastAppointment!.day.toString().padLeft(2, '0')}",
        "next_visit":
            "${nextVisit!.year.toString().padLeft(4, '0')}-${nextVisit!.month.toString().padLeft(2, '0')}-${nextVisit!.day.toString().padLeft(2, '0')}",
      };

  @override
  GeneralModel fromJson(json) {
    return UserProfileModel.fromJson(json);
  }
}

class UserProfileData {
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
  final dynamic specialty;
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
  final dynamic clinicId;
  final dynamic resignedBy;
  final dynamic suspendedBy;
  final dynamic acceptedBy;

  UserProfileData({
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
  });

  UserProfileData copyWith({
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
    dynamic specialty,
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
    dynamic clinicId,
    dynamic resignedBy,
    dynamic suspendedBy,
    dynamic acceptedBy,
  }) =>
      UserProfileData(
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
      );


  factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
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
      );

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
      };
}
