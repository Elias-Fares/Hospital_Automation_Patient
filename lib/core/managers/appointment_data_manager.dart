import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/entities/book_appointment_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'appointment_data_manager.g.dart';

@Riverpod(keepAlive: true)
AppointmentDataManager appointmentDataManager(Ref ref) {
  return AppointmentDataManager();
}

class AppointmentDataManager {
  BookAppointmentEntity _bookAppointmentEntity = BookAppointmentEntity();

  BookAppointmentEntity get current => _bookAppointmentEntity;

  void setDoctorId({required String? doctorId}) {
    _bookAppointmentEntity =
        _bookAppointmentEntity.copyWith(doctorId: doctorId);
  }

  void setAppointmentType({required String? appointmentType}) {
    _bookAppointmentEntity =
        _bookAppointmentEntity.copyWith(appointmentType: appointmentType);
  }

  void setDate({required String? date}) {
    _bookAppointmentEntity = _bookAppointmentEntity.copyWith(date: date);
  }

  void setType({required String? type}) {
    _bookAppointmentEntity = _bookAppointmentEntity.copyWith(type: type);
  }

  void setTime({required String? time}) {
    _bookAppointmentEntity = _bookAppointmentEntity.copyWith(time: time);
  }
  void setChildId({required String? childId}) {
    _bookAppointmentEntity = _bookAppointmentEntity.copyWith(childId: childId);
  }

  void reset() {
    _bookAppointmentEntity = BookAppointmentEntity();
  }


}
