import 'package:flutter/material.dart';
import '../../../configuration/service_locator.dart';
import '../../../core/base_dio/data_state.dart';
import '../../../core/enums/params_values.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/managers/appointment_data_manager.dart';
import '../../../data/childern/repository/children_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'book_appointment_state.dart';
part 'book_appointment_view_model.g.dart';

@riverpod
class BookAppointmentViewModel extends _$BookAppointmentViewModel {
  @override
  BookAppointmentState build() {
    final manager = ref.read(appointmentDataManagerProvider);

    manager.setType(type: ParamsValues.patient.value);

    ref.onDispose(() {
      manager.setType(type: null);
      manager.setChildId(childId: null);
      manager.setAppointmentType(appointmentType: null);

      debugPrint("BookAppointmentViewModel Disposed!");
    });

    return BookAppointmentState(
        selectedProcedure: "",
        validationMessage: "",
        paramsValue: ParamsValues.patient,
        showChildrenList: false,
        childrenResponse: null);
  }

  final _childrenRepository = getIt<ChildrenRepository>();

  void selectChoice(String id) {
    state = state.copyWith(selectedProcedure: id);
    ref
        .read(appointmentDataManagerProvider)
        .setAppointmentType(appointmentType: id);
  }

  void selectParamValue(ParamsValues? value) {
    bool showChildrenList;
    if (value == ParamsValues.child) {
      getChildren();
      showChildrenList = true;
    } else {
      showChildrenList = false;
    }

    state =
        state.copyWith(paramsValue: value, showChildrenList: showChildrenList);
    ref.read(appointmentDataManagerProvider).setType(type: value?.value);
  }

  Future<void> getChildren() async {
    state = state.copyWith(childrenResponse: const AsyncValue.loading());

    final response = await _childrenRepository.getChildren();

    if (response is DataSuccess) {
      state = state.copyWith(childrenResponse: AsyncValue.data(response.data));
    } else {
      state = state.copyWith(
          childrenResponse: AsyncValue.error(
              response.exceptionResponse?.exceptionMessages.firstOrNull ?? "",
              StackTrace.current));
    }
  }

  List<String> getChildrenNames() {
    final result = state.childrenResponse?.asData?.value
        .map(
          (e) => joinStrings([
            e.child?.firstName,
            e.child?.lastName,
          ]),
        )
        .toList();

    return result ?? [];
  }

  void setChildId({required String? childId}) {
    ref.read(appointmentDataManagerProvider).setChildId(childId: childId);
  }

  void validatePage() {
    final entity = ref.read(appointmentDataManagerProvider).current;
    if (entity.type == null) {
      state = state.copyWith(
          validationMessage: "Please Select Who is the appointment for.");
      return;
    }
    if (entity.type == ParamsValues.child.value) {
      if (entity.childId == null) {
        state = state.copyWith(
            validationMessage:
                "The Appintment for child, so please select one.");
        return;
      }
    }

    if (entity.appointmentType == null) {
      state =
          state.copyWith(validationMessage: "Please select Appointment Type");
      return;
    }

    state = state.copyWith(validationMessage: "");
  }

  // void clearData() {
  //   try {
  //     final manager = ref.read(appointmentDataManagerProvider);

  //     manager.setType(type: null);
  //     manager.setChildId(childId: null);
  //     manager.setAppointmentType(appointmentType: null);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
