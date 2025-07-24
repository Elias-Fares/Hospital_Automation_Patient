import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/core/enums/params_values.dart';
import 'package:patient_app/data/childern/models/child_model.dart';

class BookAppointmentState {
  final String selectedProcedure;
  final ParamsValues paramsValue;
  final bool showChildrenList;
  final AsyncValue<List<ChildModel>>? childrenResponse;
  final String validationMessage;
  BookAppointmentState(
      {required this.selectedProcedure,
      required this.paramsValue,
      required this.showChildrenList,
      required this.childrenResponse,
      required this.validationMessage, 
      });

  BookAppointmentState copyWith(
      {String? selectedProcedure,
      ParamsValues? paramsValue,
      bool? showChildrenList,
      AsyncValue<List<ChildModel>>? childrenResponse,
      String? validationMessage
      }) {
    return BookAppointmentState(
        selectedProcedure: selectedProcedure ?? this.selectedProcedure,
        paramsValue: paramsValue ?? this.paramsValue,
        showChildrenList: showChildrenList ?? this.showChildrenList,
        childrenResponse: childrenResponse ?? this.childrenResponse,
        validationMessage: validationMessage ?? this.validationMessage
        );
  }
}
