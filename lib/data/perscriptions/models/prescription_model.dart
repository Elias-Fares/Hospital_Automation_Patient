import 'dart:convert';

import 'package:patient_app/core/base_dio/general_model.dart';
import 'package:patient_app/core/models/doctor_model.dart';
import 'package:patient_app/core/models/prescription_medicine_model.dart';

class PrescriptionModel extends GeneralModel {
  final int? prescriptionsId;
  final String? code;
  final String? note;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? clinicId;
  final int? doctorId;
  final dynamic patientId;
  final int? childId;
  final List<PrescriptionMedicine>? prescriptionMedicines;
  final DoctorModel? doctorModel;

  PrescriptionModel({
    this.prescriptionsId,
    this.code,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.clinicId,
    this.doctorId,
    this.patientId,
    this.childId,
    this.prescriptionMedicines,
    this.doctorModel,
  });

  PrescriptionModel copyWith(
          {int? prescriptionsId,
          String? code,
          String? note,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? clinicId,
          int? doctorId,
          dynamic patientId,
          int? childId,
          List<PrescriptionMedicine>? prescriptionMedicines,
          DoctorModel? doctorModel}) =>
      PrescriptionModel(
          prescriptionsId: prescriptionsId ?? this.prescriptionsId,
          code: code ?? this.code,
          note: note ?? this.note,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          clinicId: clinicId ?? this.clinicId,
          doctorId: doctorId ?? this.doctorId,
          patientId: patientId ?? this.patientId,
          childId: childId ?? this.childId,
          prescriptionMedicines:
              prescriptionMedicines ?? this.prescriptionMedicines,
          doctorModel: doctorModel ?? this.doctorModel);

  factory PrescriptionModel.fromRawJson(String str) =>
      PrescriptionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionModel(
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
        prescriptionMedicines: json["prescription_medicines"] == null
            ? []
            : List<PrescriptionMedicine>.from(json["prescription_medicines"]!
                .map((x) => PrescriptionMedicine.fromJson(x))),
        doctorModel: json["doctorP"] == null
            ? null
            : DoctorModel.fromJson(json["doctorP"]),
      );

  @override
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
        "doctorP": doctorModel?.toJson(),
        "prescription_medicines": prescriptionMedicines == null
            ? []
            : List<dynamic>.from(prescriptionMedicines!.map((x) => x.toJson())),
      };

  @override
  GeneralModel fromJson(json) {
    return PrescriptionModel.fromJson(json);
  }
}
