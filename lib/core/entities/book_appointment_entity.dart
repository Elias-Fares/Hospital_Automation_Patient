class BookAppointmentEntity {
  final String? doctorId;
  final String? appointmentType;
  final String? date;
  final String? time;
  final String? type;

  BookAppointmentEntity({
    this.doctorId,
    this.appointmentType,
    this.date,
    this.time,
    this.type,
  });

  BookAppointmentEntity copyWith({
    String? doctorId,
    String? appointmentType,
    String? date,
    String? time,
    String? type,
  }) {
    return BookAppointmentEntity(
      doctorId: doctorId ?? this.doctorId,
      appointmentType: appointmentType ?? this.appointmentType,
      date: date ?? this.date,
      time: time ?? this.time,
      type: type ?? this.type,
    );
  }

  @override
  String toString() {
    return 'BookAppointmentEntity(doctorId: $doctorId, appointmentType: $appointmentType, date: $date, type: $type, time: $time)';
  }
}
