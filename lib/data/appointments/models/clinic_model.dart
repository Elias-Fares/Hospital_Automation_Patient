import 'dart:convert';

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
