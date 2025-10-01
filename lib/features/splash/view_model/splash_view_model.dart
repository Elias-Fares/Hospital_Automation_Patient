import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../configuration/service_locator.dart';
import '../../../data/auth/repository/auth_repository.dart';
import '../../appointments/view/appointments.dart';
import '../../auth/view/screens/login_screen.dart';
part 'splash_state.dart';
part 'splash_view_model.g.dart';

@riverpod
class SplashViewModel extends _$SplashViewModel {
  @override
  SplashState build() => SplashState();

  final _repository = getIt<AuthRepository>();

  Future<void> redirection(BuildContext context) async {
    final token = _repository.getToken() ?? "";

    if (token.isEmpty) {
      context.go(LoginScreen.routeName);
    } else {
      context.go(AppointmentsScreen.routeName);
    }
  }
}
