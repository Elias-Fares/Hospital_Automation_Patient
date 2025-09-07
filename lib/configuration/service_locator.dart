import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../core/base_dio/base_dio.dart';
import '../data/appointments/data_source/appointments_data_source.dart';
import '../data/appointments/repository/appointment_repository.dart';
import '../data/auth/data_source/auth_data_source.dart';
import '../data/auth/repository/auth_repository.dart';
import '../data/childern/data_source/children_data_source.dart';
import '../data/childern/repository/children_repository.dart';
import '../data/doctors/data_source/doctors_data_source.dart';
import '../data/doctors/repository/doctors_repository.dart';
import '../data/medical_records/data_source/medical_records_data_source.dart';
import '../data/medical_records/repository/medical_records_repository.dart';
import '../data/perscriptions/data_source/prescriptions_data_source.dart';
import '../data/perscriptions/repository/prescriptions_repository.dart';
import '../data/pharmacies/data_source/pharmacies_data_source.dart';
import '../data/pharmacies/repository/pharmacies_repository.dart';
import '../data/profile/data_source/profile_data_source.dart';
import '../data/profile/repository/profile_repository.dart';
import '../core/services/shared_preferences_service.dart';
import '../data/vaccines/data_source/vaccines_data_source.dart';
import '../data/vaccines/repository/vaccine_repository.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  _initDio();
  await _initSharedPreferencesService();
  _initBaseDio();
  _initAuth();
  _initChildren();
  _initAppointments();
  _initProfile();
  _intitDoctors();
  _initPrescriptions();
  _initMedicalRecords();
  _initVaccines();
  _initPharmacies();
}

void _initDio() {
  getIt.registerLazySingleton(() => Dio(
        BaseOptions(
            baseUrl: "",
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "charset": "utf-8",
              "Accept-Charset": "utf-8"
            },
            responseType: ResponseType.plain,
            connectTimeout: const Duration(seconds: 7)),
      ));
}

Future<void> _initSharedPreferencesService() async {
  final sharedPrefsService = SharedPreferencesService();
  await sharedPrefsService.init();
  getIt.registerSingleton(sharedPrefsService);
}

void _initBaseDio() {
  getIt.registerLazySingleton(
    () => BaseDio(
        dioProject: getIt<Dio>(),
        sharedPreferencesService: getIt<SharedPreferencesService>()),
  );
}

void _initAuth() {
  getIt.registerLazySingleton(() => AuthRepository(
        sharedPreferencesService: getIt<SharedPreferencesService>(),
        authDataSource: AuthDataSource(baseDio: getIt<BaseDio>()),
      ));
}

void _initChildren() {
  getIt.registerLazySingleton(
    () => ChildrenRepository(
        childrenDataSource: ChildrenDataSource(baseDio: getIt<BaseDio>())),
  );
}

void _initAppointments() {
  getIt.registerLazySingleton(
    () => AppointmentRepository(
        appointmentsDataSource:
            AppointmentsDataSource(baseDio: getIt<BaseDio>())),
  );
}

void _initProfile() {
  getIt.registerLazySingleton(
    () => ProfileRepository(
        profileDataSource: ProfileDataSource(
            baseDio: getIt<BaseDio>(),
            sharedPreferencesService: getIt<SharedPreferencesService>())),
  );
}

void _intitDoctors() {
  getIt.registerLazySingleton(
    () => DoctorsRepository(
        doctorsDataSource: DoctorsDataSource(baseDio: getIt<BaseDio>())),
  );
}

void _initPrescriptions() {
  getIt.registerLazySingleton(
    () => PrescriptionsRepository(
        prescriptionsDataSource:
            PrescriptionsDataSource(baseDio: getIt<BaseDio>())),
  );
}

void _initMedicalRecords() {
  getIt.registerLazySingleton(
    () => MedicalRecordsRepository(
        medicalRecordsDataSource:
            MedicalRecordsDataSource(baseDio: getIt<BaseDio>())),
  );
}

void _initVaccines() {
  getIt.registerLazySingleton(
    () => VaccineRepository(
        dataSource: VaccinesDataSource(baseDio: getIt<BaseDio>())),
  );
}

void _initPharmacies() {
  getIt.registerLazySingleton(
    () => PharmaciesRepository(
        dataSource: PharmaciesDataSource(baseDio: getIt<BaseDio>())),
  );
}
