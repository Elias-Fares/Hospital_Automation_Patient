import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/features/appointments/view/appointments.dart';
import 'package:patient_app/features/auth/view/screens/add_residential_address_screen.dart';
import 'package:patient_app/features/auth/view/screens/login_screen.dart';
import 'package:patient_app/features/auth/view/screens/reset_password_screen.dart';
import 'package:patient_app/features/auth/view/screens/sign_up_screen.dart';
import 'package:patient_app/features/auth/view/screens/upload_profile_image_screen.dart';
import 'package:patient_app/features/auth/view/screens/verification_code_screen.dart';
import 'package:patient_app/features/child_profile/view/child_profile_screen.dart';
import 'package:patient_app/features/children/view/children_s.dart';
import 'package:patient_app/features/main_screen/main_screen.dart';
import 'package:patient_app/features/notifications/view/notifications_screen.dart';
import 'package:patient_app/features/profile/view/profile_screen.dart';

class AppRouter {
  AppRouter._();
  static String initialRoute = "/appointments";
  // static String initialRoute = SignupScreen.routeName;

  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");

  static final router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialRoute,
      routes: [
        // ==============================================================//
        //Auth feature
        GoRoute(
          path: SignupScreen.routeName,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: VerificationCodeScreen.routeName,
          builder: (context, state) => const VerificationCodeScreen(),
        ),
        GoRoute(
          path: AddResidentialAddressScreen.routeName,
          builder: (context, state) => const AddResidentialAddressScreen(),
        ),
        GoRoute(
          path: ResetPasswordScreen.routeName,
          builder: (context, state) => const ResetPasswordScreen(),
        ),
        GoRoute(
          path: UploadProfileImageScreen.routeName,
          builder: (context, state) => const UploadProfileImageScreen(),
        ),

        //End of Auth features
        //====================================================================//

        //main screen
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                MainScreen(statefulNavigationShell: navigationShell),
            branches: [
              _appointmentsRoutes(),
              _childrenRoutes(),
              _notificationsRoute()
            ]),
      ]);

  static StatefulShellBranch _appointmentsRoutes() {
    return StatefulShellBranch(routes: [
      GoRoute(
          path: AppointmentsScreen.routeName,
          builder: (context, state) => const AppointmentsScreen(),
          routes:  [
            GoRoute(
              path: ProfileScreen.routeName,
              builder: (context, state) => const ProfileScreen(),
            )
          ])
    ]);
  }

  static StatefulShellBranch _childrenRoutes() {
    return StatefulShellBranch(routes: [
      GoRoute(
          path: ChildrenScreen.routeName,
          builder: (context, state) => const ChildrenScreen(),
          routes: [
            GoRoute(
              path: ChildProfileScreen.routeName,
              builder: (context, state) => const ChildProfileScreen(),
            )
          ])
    ]);
  }

  static StatefulShellBranch _notificationsRoute() {
    return StatefulShellBranch(routes: [
      GoRoute(
          path: NotificationsScreen.routeName,
          builder: (context, state) => const NotificationsScreen(),
          routes: const [])
    ]);
  }
}
