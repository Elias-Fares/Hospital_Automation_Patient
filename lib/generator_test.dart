// import 'package:patient_app/core/base_dio/data_state.dart';

// class AuthRemoteDataSource extends _$GeneratedAuthRemoteDataSource {
//   late BaseDio baseDio;
//   final Dio dio;

//   AuthRemoteDataSource({required this.dio}) {
//     baseDio = BaseDio(dioProject: dio);
//   }

//   @ApiClient(
//     dio = baseDio,
//     endPoint = "/login",
//     type = "post",
//     model = LoginModel(),
//   )
//   @override
//   Future<DataState> login({required LoginBodyData loginBodyData,
//       required LoginQueryParams loginQueryParams});
// }

// class _$GeneratedAuthRemoteDataSource {
//   Future<DataState> login(
//       {required LoginBodyData loginBodyData,
//       required LoginQueryParams loginQueryParams}) async {
//     var response = await baseDio.post(
//       subUrl: "/login",
//       data:loginBodyData.toJson(),
//       queryParameters : loginQueryParams.toJson(),
//       model: LoginModel(),
//     );
//     return response;
//   }
// }
