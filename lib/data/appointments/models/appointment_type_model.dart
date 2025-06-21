import 'dart:convert';

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