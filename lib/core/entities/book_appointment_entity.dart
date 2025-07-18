class BookAppointmentEntity {
  final String? doctorId;
  final String? appointmentType;
  final String? date;
  final String? time;
  final String? type;
  final String? childId;

  BookAppointmentEntity({
    this.doctorId,
    this.appointmentType,
    this.date,
    this.time,
    this.type,
    this.childId,
  });

  BookAppointmentEntity copyWith({
    String? doctorId,
    String? appointmentType,
    String? date,
    String? time,
    String? type,
    String? childId,
  }) {
    return BookAppointmentEntity(
        doctorId: doctorId ?? this.doctorId,
        appointmentType: appointmentType ?? this.appointmentType,
        date: date ?? this.date,
        time: time ?? this.time,
        type: type ?? this.type,
        childId: childId ?? this.childId);
  }

  @override
  String toString() {
    return 'BookAppointmentEntity(doctorId: $doctorId, childId: $childId appointmentType: $appointmentType, date: $date, type: $type, time: $time)';
  }
}
