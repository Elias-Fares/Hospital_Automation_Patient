import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/data/appointments/data_source/appointments_data_source.dart';
import 'package:patient_app/data/appointments/repository/appointment_repository.dart';
import 'package:patient_app/data/auth/data_source/auth_data_source.dart';
import 'package:patient_app/data/auth/repository/auth_repository.dart';
import 'package:patient_app/data/childern/data_source/children_data_source.dart';
import 'package:patient_app/data/childern/repository/children_repository.dart';
import 'package:patient_app/services/shared_preferences_service.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  _initDio();
  await _initSharedPreferencesService();
  _initBaseDio();
  _initAuth();
  _initChildren();
  _initAppointments();
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
            responseType: ResponseType.plain),
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
