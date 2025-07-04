import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'medicines_search_state.dart';
part 'medicines_search_view_model.g.dart';

@riverpod
class MedicinesSearchViewModel extends _$MedicinesSearchViewModel {
  @override
  MedicinesSearchState build() => MedicinesSearchState();

}

