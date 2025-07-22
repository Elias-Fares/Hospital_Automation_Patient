class BookAppointmentEntity {
  final String? doctorId;
  final String? appointmentType;
  final String? date;
  final String? time;
  final String? type;
  final String? childId;
  final String? vaccineId;

  BookAppointmentEntity({
    this.doctorId,
    this.appointmentType,
    this.date,
    this.time,
    this.type,
    this.childId,
    this.vaccineId,
  });

  BookAppointmentEntity copyWith({
    String? doctorId,
    String? appointmentType,
    String? date,
    String? time,
    String? type,
    String? childId,
    String? vaccineId,
  }) {
    return BookAppointmentEntity(
        doctorId: doctorId ?? this.doctorId,
        appointmentType: appointmentType ?? this.appointmentType,
        date: date ?? this.date,
        time: time ?? this.time,
        type: type ?? this.type,
        childId: childId ?? this.childId,
        vaccineId: vaccineId ?? this.vaccineId);
  }

  @override
  String toString() {
    return 'BookAppointmentEntity(doctorId: $doctorId, childId: $childId appointmentType: $appointmentType, date: $date, type: $type, time: $time, vaccine ID: $vaccineId)';
  }
}
