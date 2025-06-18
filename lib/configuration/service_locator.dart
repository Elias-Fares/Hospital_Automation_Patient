import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:patient_app/core/base_dio/base_dio.dart';
import 'package:patient_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:patient_app/features/auth/data/repository/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  _initDio();
  // await _initSharedPreferencesService();
  _initBaseDio();
  _initAuth();
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

// Future<void> _initSharedPreferencesService() async {
//   final sharedPrefsService = SharedPreferencesService();
//   await sharedPrefsService.init();
//   getIt.registerSingleton(sharedPrefsService);
// }

void _initBaseDio() {
  getIt.registerLazySingleton(
    () => BaseDio(
      dioProject: getIt<Dio>(),
      // sharedPreferencesService: getIt<SharedPreferencesService>()
    ),
  );
}

void _initAuth() {
  getIt.registerLazySingleton(() => AuthRepository(
        authDataSource: AuthDataSource(baseDio: getIt<BaseDio>()),
      ));
}
