// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/core/base_dio/data_state.dart';
import 'package:patient_app/core/base_dio/errors_types_enum.dart';
import 'package:patient_app/core/base_dio/general_model.dart';
import 'package:patient_app/core/constant/constant.dart';

import '../../services/shared_preferences_service.dart';


class BaseDio {
  final Dio dioProject;
  final SharedPreferencesService sharedPreferencesService;
  BaseDio({required this.dioProject, required this.sharedPreferencesService});
  Future<DataState> get<T extends GeneralModel>({
    required String subUrl,
    String? token,
    String? url,
    bool needToken = false,
    required dynamic model,
    Object? data,
    bool isListOfModel = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("debugger $storedToken");
    }

    try {
      debugPrint("-------------------------------------");
      debugPrint("URL is ${url ?? Constant.baseUrl}$subUrl");
      debugPrint("-------------------------------------");
      debugPrint("Query Parameters is $queryParameters");
      debugPrint("-------------------------------------");
      debugPrint("Data is $data");
      debugPrint("-------------------------------------");
      final response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters, data: data);

      debugPrint(json.decode(response.data).toString());
      final responseData = json.decode(response.data)["data"];

      if (isListOfModel) {
        final List<T> dataList = [];
        responseData.forEach((customModel) {
          dataList.add(model.fromJson(customModel));
        });
        print("the reponse modeled");
        return DataSuccess(dataList);
      }

      final responseObject = model.fromJson(responseData);
      print("the reponse modeled");
      return DataSuccess(responseObject);
    } on DioException catch (e) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is DioException: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      // debugPrint("The StackTrace ${e.stackTrace}");
      // debugPrint("--------------End of Stacktrace----------------");
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is Other: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace $stacktrace");
      debugPrint("--------------End of Stacktrace----------------");
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  Future<DataState<T>> post<T extends GeneralModel>({
    required String subUrl,
    dynamic data,
    String? token,
    String? url,
    bool needToken = false,
    // T? model,
    dynamic model,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("debugger $storedToken");
    }

    try {
      debugPrint("-------------------------------------");
      debugPrint("URL is ${url ?? Constant.baseUrl}$subUrl");
      debugPrint("-------------------------------------");
      debugPrint("Query Parameters is $queryParameters");
      debugPrint("-------------------------------------");
      debugPrint("Data is $data");
      debugPrint("-------------------------------------");
      final response = await dioProject.post(
          "${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters,
          data: data);
      debugPrint(json.decode(response.data).toString());
      final responseData = json.decode(response.data)["data"];
      final responseObject = model?.fromJson(responseData);
      print("the reponse modeled");
      return DataSuccess<T>(responseObject);
    } on DioException catch (e) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is DioException: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace ${e.stackTrace}");
      // final ExceptionResponse exceptionResponse =
      //     ExceptionResponse(statusCode: 422, exceptionMessages: ["Error"]);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed(exceptionResponse);
    } catch (e, stacktrace) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is Other: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace $stacktrace");
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed(exceptionResponse);
    }
  }

  Future<DataState> delete(
      {required String subUrl,
      dynamic data,
      String? token,
      Map<String, dynamic>? queryParameters,
      bool needToken = false}) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("debugger $storedToken");
    }
    try {
      var response = await dioProject.delete("${Constant.baseUrl}$subUrl",
          data: data, queryParameters: queryParameters);
      return DataSuccess(response);
    } on DioException catch (e) {
      print(e.stackTrace);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      print(e);
      print('Stacktrace: $stacktrace');
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  // Future<DataState> getPagination<T extends GeneralModel>(
  //     {required String subUrl,
  //     String? token,
  //     String? url,
  //     required dynamic model,
  //     required PaginateReqEntity paginateReqEntity,
  //     bool needToken = false,
  //     Object? data,
  //     Map<String, dynamic>? queryParameters}) async {
  //   if (needToken) {
  //     dioProject.options.headers["Authorization"] =
  //         "Bearer ${token ?? LocalStaticVar.token}";
  //   }
  //   try {
  //     var response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
  //         queryParameters: queryParameters, data: data);

  //     final pageData = PaginationModel.fromJson(json.decode(response.data));
  //     final List<T> dataList = [];
  //     pageData.data?.forEach((modelData) {
  //       dataList.add(model.fromJson(modelData));
  //     });
  //     int totalPage =
  //         ((pageData.pagination?.totalpage ?? 10) / paginateReqEntity.perPage)
  //             .ceil();
  //     var result = PageEntity<T>(data: dataList, totalPage: totalPage);

  //     return DataSuccess(result);
  //   } on DioException catch (e) {
  //     print(e.stackTrace);
  //     final ExceptionResponse exceptionResponse = getExceptionResponse(e);
  //     return DataFailed<ExceptionResponse>(exceptionResponse);
  //   } catch (e, stacktrace) {
  //     print(e);
  //     print('Stacktrace: $stacktrace');
  //     final ExceptionResponse exceptionResponse = ExceptionResponse(
  //         statusCode: -888,
  //         exceptionMessages: ["Another exception was thrown"]);
  //     return DataFailed<ExceptionResponse>(exceptionResponse);
  //   }
  // }
  Future<DataState> basePost({
    required String subUrl,
    dynamic data,
    String? token,
    String? url,
    bool needToken = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      final storedToken = sharedPreferencesService.getToken();
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? storedToken}";

      debugPrint("debugger $storedToken");
    }
    // dioProject.options.headers["Accept-Language"] =
    //     AppLanguageKeys.appLang.value;

    try {
      debugPrint("-------------------------------------");
      debugPrint("URL is ${url ?? Constant.baseUrl}$subUrl");
      debugPrint("-------------------------------------");
      debugPrint("Query Parameters is $queryParameters");
      debugPrint("-------------------------------------");
      debugPrint("Data is $data");
      debugPrint("-------------------------------------");
      final response = await dioProject.post(
          "${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters,
          data: data);

      final responseData = json.decode(response.data);

      return DataSuccess(responseData);
    } on DioException catch (e) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is DioException: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace ${e.stackTrace}");
      // final ExceptionResponse exceptionResponse =
      //     ExceptionResponse(statusCode: 422, exceptionMessages: ["Error"]);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      debugPrint("-----------------------------------------------");
      debugPrint("The exception is Other: ${e.toString()}");
      debugPrint("-----------------------------------------------");
      debugPrint("The StackTrace $stacktrace");
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }
}
