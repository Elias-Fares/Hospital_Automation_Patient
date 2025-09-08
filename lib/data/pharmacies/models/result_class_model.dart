import 'dart:convert';

import '../../../core/base_dio/general_model.dart';

class ResultClassModel extends GeneralModel {
  final String? result;

  ResultClassModel({
    this.result,
  });

  ResultClassModel copyWith({
    String? result,
  }) =>
      ResultClassModel(
        result: result ?? this.result,
      );

  factory ResultClassModel.fromRawJson(String str) =>
      ResultClassModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultClassModel.fromJson(Map<String, dynamic> json) =>
      ResultClassModel(
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
      };

  @override
  GeneralModel fromJson(json) {
    return ResultClassModel.fromJson(json);
  }
}
