import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/childern/models/child_model.dart';

class ChildrenState {
  final AsyncValue<List<ChildModel>>? childrenResponse;

  ChildrenState({this.childrenResponse});

  ChildrenState copyWith({AsyncValue<List<ChildModel>>? childrenResponse}) =>
      ChildrenState(
          childrenResponse: childrenResponse ?? this.childrenResponse);
}
