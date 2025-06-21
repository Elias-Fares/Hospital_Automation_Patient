import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';
import 'package:patient_app/data/appointments/models/appointment_type_model.dart';
import 'package:patient_app/data/appointments/models/clinic_model.dart';
import 'package:patient_app/core/models/user.dart';
import 'package:patient_app/data/childern/models/child_model.dart';

class AppointmentModel extends GeneralModel {
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
  final User? doctor;
  final Clinic? clinic;
  final dynamic vaccine;
  final AppointmentType? appointmentType;
  final Child? child;
  final User? user;

  AppointmentModel({
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
    this.doctor,
    this.clinic,
    this.vaccine,
    this.appointmentType,
    this.child,
    this.user,
  });

  AppointmentModel copyWith({
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
    User? doctor,
    Clinic? clinic,
    dynamic vaccine,
    AppointmentType? appointmentType,
    Child? child,
    User? user,
  }) =>
      AppointmentModel(
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
        doctor: doctor ?? this.doctor,
        clinic: clinic ?? this.clinic,
        vaccine: vaccine ?? this.vaccine,
        appointmentType: appointmentType ?? this.appointmentType,
        child: child ?? this.child,
        user: user ?? this.user,
      );

  factory AppointmentModel.fromRawJson(String str) =>
      AppointmentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
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
        doctor: json["doctor"] == null ? null : User.fromJson(json["doctor"]),
        clinic: json["clinic"] == null ? null : Clinic.fromJson(json["clinic"]),
        vaccine: json["vaccine"],
        appointmentType: json["appointment_type"] == null
            ? null
            : AppointmentType.fromJson(json["appointment_type"]),
        child: json["child"] == null ? null : Child.fromJson(json["child"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
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
        "doctor": doctor?.toJson(),
        "clinic": clinic?.toJson(),
        "vaccine": vaccine,
        "appointment_type": appointmentType?.toJson(),
        "child": child?.toJson(),
        "user": user?.toJson(),
      };

  @override
  GeneralModel fromJson(json) {
    return AppointmentModel.fromJson(json);
  }
}





