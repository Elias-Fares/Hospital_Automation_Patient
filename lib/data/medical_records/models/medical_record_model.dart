import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';
import 'package:patient_app/core/models/doctor_model.dart';
import 'package:patient_app/core/models/prescription_medicine_model.dart';

class MedicalRecordModel extends GeneralModel {
  final DoctorModel? doctorInfo;
  final List<DoctorsAppointment>? doctorsAppointments;
  final List<DoctorPrescription>? doctorPrescription;

  MedicalRecordModel({
    this.doctorInfo,
    this.doctorsAppointments,
    this.doctorPrescription,
  });

  MedicalRecordModel copyWith({
    DoctorModel? doctorInfo,
    List<DoctorsAppointment>? doctorsAppointments,
    List<DoctorPrescription>? doctorPrescription,
  }) =>
      MedicalRecordModel(
        doctorInfo: doctorInfo ?? this.doctorInfo,
        doctorsAppointments: doctorsAppointments ?? this.doctorsAppointments,
        doctorPrescription: doctorPrescription ?? this.doctorPrescription,
      );

  factory MedicalRecordModel.fromRawJson(String str) =>
      MedicalRecordModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) =>
      MedicalRecordModel(
        doctorInfo: json["doctorInfo"] == null
            ? null
            : DoctorModel.fromJson(json["doctorInfo"]),
        doctorsAppointments: json["doctorsAppointments"] == null
            ? []
            : List<DoctorsAppointment>.from(json["doctorsAppointments"]!
                .map((x) => DoctorsAppointment.fromJson(x))),
        doctorPrescription: json["doctorPrescription"] == null
            ? []
            : List<DoctorPrescription>.from(json["doctorPrescription"]!
                .map((x) => DoctorPrescription.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "doctorInfo": doctorInfo?.toJson(),
        "doctorsAppointments": doctorsAppointments == null
            ? []
            : List<dynamic>.from(doctorsAppointments!.map((x) => x.toJson())),
        "doctorPrescription": doctorPrescription == null
            ? []
            : List<dynamic>.from(doctorPrescription!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return MedicalRecordModel.fromJson(json);
  }
}


class DoctorPrescription {
  final int? prescriptionsId;
  final String? code;
  final dynamic note;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? clinicId;
  final int? doctorId;
  final int? patientId;
  final dynamic childId;
  final DoctorModel? user;
  final Clinic? clinic;
  final List<PrescriptionMedicine>? prescriptionMedicines;

  DoctorPrescription({
    this.prescriptionsId,
    this.code,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
    this.doctorId,
    this.patientId,
    this.childId,
    this.user,
    this.clinic,
    this.prescriptionMedicines,
  });

  DoctorPrescription copyWith({
    int? prescriptionsId,
    String? code,
    dynamic note,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? clinicId,
    int? doctorId,
    int? patientId,
    dynamic childId,
    DoctorModel? user,
    Clinic? clinic,
    List<PrescriptionMedicine>? prescriptionMedicines,
  }) =>
      DoctorPrescription(
        prescriptionsId: prescriptionsId ?? this.prescriptionsId,
        code: code ?? this.code,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        clinicId: clinicId ?? this.clinicId,
        doctorId: doctorId ?? this.doctorId,
        patientId: patientId ?? this.patientId,
        childId: childId ?? this.childId,
        user: user ?? this.user,
        clinic: clinic ?? this.clinic,
        prescriptionMedicines:
            prescriptionMedicines ?? this.prescriptionMedicines,
      );

  factory DoctorPrescription.fromRawJson(String str) =>
      DoctorPrescription.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorPrescription.fromJson(Map<String, dynamic> json) =>
      DoctorPrescription(
        prescriptionsId: json["prescriptionsId"],
        code: json["code"],
        note: json["note"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        clinicId: json["clinic_id"],
        doctorId: json["doctor_id"],
        patientId: json["patient_id"],
        childId: json["child_id"],
        user: json["user"] == null ? null : DoctorModel.fromJson(json["user"]),
        clinic: json["clinic"] == null ? null : Clinic.fromJson(json["clinic"]),
        prescriptionMedicines: json["prescription_medicines"] == null
            ? []
            : List<PrescriptionMedicine>.from(json["prescription_medicines"]!
                .map((x) => PrescriptionMedicine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "prescriptionsId": prescriptionsId,
        "code": code,
        "note": note,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "clinic_id": clinicId,
        "doctor_id": doctorId,
        "patient_id": patientId,
        "child_id": childId,
        "user": user?.toJson(),
        "clinic": clinic?.toJson(),
        "prescription_medicines": prescriptionMedicines == null
            ? []
            : List<dynamic>.from(prescriptionMedicines!.map((x) => x.toJson())),
      };
}

class Clinic {
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

  Clinic({
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
  });

  Clinic copyWith({
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
  }) =>
      Clinic(
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
      );

  factory Clinic.fromRawJson(String str) => Clinic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
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
      };
}



class DoctorsAppointment {
  final int? appointmentsId;
  final dynamic recommendedVisitDate;
  final dynamic recommndedVisitNote;
  final String? state;
  final String? medicalDiagnosis;
  final DateTime? date;
  final String? time;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? clinicId;
  final dynamic vaccinId;
  final int? appointmentTypeId;
  final int? childId;
  final int? doctorId;
  final int? patientId;
  final DoctorModel? user;
  final AppointmentType? appointmentType;
  final Clinic? clinic;
  final dynamic vaccine;

  DoctorsAppointment({
    this.appointmentsId,
    this.recommendedVisitDate,
    this.recommndedVisitNote,
    this.state,
    this.medicalDiagnosis,
    this.date,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
    this.vaccinId,
    this.appointmentTypeId,
    this.childId,
    this.doctorId,
    this.patientId,
    this.user,
    this.appointmentType,
    this.clinic,
    this.vaccine,
  });

  DoctorsAppointment copyWith({
    int? appointmentsId,
    dynamic recommendedVisitDate,
    dynamic recommndedVisitNote,
    String? state,
    String? medicalDiagnosis,
    DateTime? date,
    String? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? clinicId,
    dynamic vaccinId,
    int? appointmentTypeId,
    int? childId,
    int? doctorId,
    int? patientId,
    DoctorModel? user,
    AppointmentType? appointmentType,
    Clinic? clinic,
    dynamic vaccine,
  }) =>
      DoctorsAppointment(
        appointmentsId: appointmentsId ?? this.appointmentsId,
        recommendedVisitDate: recommendedVisitDate ?? this.recommendedVisitDate,
        recommndedVisitNote: recommndedVisitNote ?? this.recommndedVisitNote,
        state: state ?? this.state,
        medicalDiagnosis: medicalDiagnosis ?? this.medicalDiagnosis,
        date: date ?? this.date,
        time: time ?? this.time,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        clinicId: clinicId ?? this.clinicId,
        vaccinId: vaccinId ?? this.vaccinId,
        appointmentTypeId: appointmentTypeId ?? this.appointmentTypeId,
        childId: childId ?? this.childId,
        doctorId: doctorId ?? this.doctorId,
        patientId: patientId ?? this.patientId,
        user: user ?? this.user,
        appointmentType: appointmentType ?? this.appointmentType,
        clinic: clinic ?? this.clinic,
        vaccine: vaccine ?? this.vaccine,
      );

  factory DoctorsAppointment.fromRawJson(String str) =>
      DoctorsAppointment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DoctorsAppointment.fromJson(Map<String, dynamic> json) =>
      DoctorsAppointment(
        appointmentsId: json["appointmentsId"],
        recommendedVisitDate: json["recommended_visit_date"],
        recommndedVisitNote: json["recommnded_visit_note"],
        state: json["state"],
        medicalDiagnosis: json["medical_diagnosis"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        clinicId: json["clinic_id"],
        vaccinId: json["vaccin_id"],
        appointmentTypeId: json["appointment_type_id"],
        childId: json["child_id"],
        doctorId: json["doctor_id"],
        patientId: json["patient_id"],
        user: json["user"] == null ? null : DoctorModel.fromJson(json["user"]),
        appointmentType: json["appointment_type"] == null
            ? null
            : AppointmentType.fromJson(json["appointment_type"]),
        clinic: json["clinic"] == null ? null : Clinic.fromJson(json["clinic"]),
        vaccine: json["vaccine"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentsId": appointmentsId,
        "recommended_visit_date": recommendedVisitDate,
        "recommnded_visit_note": recommndedVisitNote,
        "state": state,
        "medical_diagnosis": medicalDiagnosis,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "clinic_id": clinicId,
        "vaccin_id": vaccinId,
        "appointment_type_id": appointmentTypeId,
        "child_id": childId,
        "doctor_id": doctorId,
        "patient_id": patientId,
        "user": user?.toJson(),
        "appointment_type": appointmentType?.toJson(),
        "clinic": clinic?.toJson(),
        "vaccine": vaccine,
      };
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
