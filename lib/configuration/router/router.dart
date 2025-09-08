import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/medicine_classifier/view/medicine_classifier_screen.dart';
import 'my_go_router_observer.dart';
import '../../core/enums/params_values.dart';
import '../../core/models/medicine_model.dart';
import '../../core/params/child_appointment_params.dart';
import '../../core/params/medical_records_screen_params.dart';
import '../../core/params/prescriptions_screen_params.dart';
import '../../core/params/vaccine_table_screen_param.dart';
import '../../data/appointments/models/appointment_model.dart';
import '../../data/perscriptions/models/prescription_model.dart';
import '../../data/profile/models/user_profile_model.dart';
import '../../data/vaccines/models/vaccine_model.dart';
import '../../features/appointment_details/view/appointment_details_screen.dart';
import '../../features/appointments/view/appointments.dart';
import '../../features/auth/view/screens/add_residential_address_screen.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/reset_password_screen.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';
import '../../features/auth/view/screens/upload_profile_image_screen.dart';
import '../../features/auth/view/screens/verification_code_screen.dart';
import '../../features/book_appointment/view/book_appointment_screen.dart';
import '../../features/child_appointments/view/child_appointments_screen.dart';
import '../../features/child_profile/view/child_profile_screen.dart';
import '../../features/children/view/children_s.dart';
import '../../features/choose_appointment_date/view/choose_appointment_date_screen.dart';
import '../../features/department_details/view/department_details_screen.dart';
import '../../features/departments/view/departments_screen.dart';
import '../../features/doctor_profile/view/doctor_profile_screen.dart';
import '../../features/edit_profile/view/edit_profile_screen.dart';
import '../../features/main_screen/main_screen.dart';
import '../../features/medicine_details/view/medicine_details_screen.dart';
import '../../features/medicines_search/view/medicines_search_screen.dart';
import '../../features/notifications/view/notifications_screen.dart';
import '../../features/patient_doctors/view/patient_doctors_screen.dart';
import '../../features/medical_record/view/medical_record_screen.dart';
import '../../features/patient_prescription/view/patient_prescription_screen.dart';
import '../../features/pharmacies/view/pharmacies_screen.dart';
import '../../features/pharmacy_profile/view/pharmacy_profile_screen.dart';
import '../../features/prescription_details/view/prescription_details_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/vaccination_table/view/vaccination_table_screen.dart';
import '../../features/vaccine_details/view/vaccine_details_screen.dart';
import '../../features/vaccines/view/vaccines_screen.dart';

class AppRouter {
  AppRouter._();
  // static String initialRoute = getIt<> "/appointments";
  static String initialRoute = LoginScreen.routeName;

  static final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");

  static final router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialRoute,
      observers: [
        MyGoRouterObserver()
      ],
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
          redirect: (context, state) {
            return null;

            // debugPrint("redirect called");
            // final sharedPrefsService = getIt<SharedPreferencesService>();
            // final token = sharedPrefsService.getToken();
            // final isTokenEmpty = token?.isEmpty ?? true;
            // if (isTokenEmpty) {
            //   return null;
            // } else {
            //   return AppointmentsScreen.routeName;
            // }
          },
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
          routes: [
            GoRoute(
                path: AppointmentDetailsScreen.routeName,
                builder: (context, state) {
                  final appointmentModel = state.extra as AppointmentModel?;
                  return AppointmentDetailsScreen(
                    appointmentModel: appointmentModel,
                  );
                },
                routes: [
                  GoRoute(
                      path: DoctorProfileScreen.routeName,
                      builder: (context, state) {
                        final id = state.extra as String?;
                        return DoctorProfileScreen(
                          doctorId: id,
                        );
                      },
                      routes: [
                        GoRoute(
                            path: BookAppointmentScreen.routeName,
                            builder: (context, state) =>
                                const BookAppointmentScreen(),
                            routes: [
                              GoRoute(
                                path: ChooseAppointmentDateScreen.routeName,
                                builder: (context, state) =>
                                    const ChooseAppointmentDateScreen(),
                              )
                            ])
                      ])
                ])
          ]),
      GoRoute(
          path: ProfileScreen.routeName,
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              path: EditProfileScreen.routeName,
              builder: (context, state) {
                final userProfileData = state.extra as UserProfileData?;
                return EditProfileScreen(
                  userProfileData: userProfileData,
                );
              },
            )
          ]),
      GoRoute(
        path: MedicalRecordScreen.routeName,
        builder: (context, state) {
          final params = state.extra as MedicalRecordsScreenParams?;
          return MedicalRecordScreen(medicalRecordsScreenParams: params);
        },
      ),
      GoRoute(
          path: PatientPrescriptionScreen.routeName,
          builder: (context, state) {
            final params = state.extra as PrescriptionsScreenParams?;
            return PatientPrescriptionScreen(
              prescriptionsScreenParams: params ??
                  PrescriptionsScreenParams(comingFrom: ParamsValues.patient),
            );
          },
          routes: [
            GoRoute(
              path: PrescriptionDetailsScreen.routeName,
              builder: (context, state) {
                final prescriptionModel = state.extra as PrescriptionModel?;
                return PrescriptionDetailsScreen(
                  prescriptionModel: prescriptionModel,
                );
              },
            )
          ]),
      GoRoute(
          path: PatientDoctorsScreen.routeName,
          builder: (context, state) => const PatientDoctorsScreen(),
          routes: [
            GoRoute(
                path: DoctorProfileScreen.routeName,
                builder: (context, state) {
                  final id = state.extra as String?;
                  return DoctorProfileScreen(
                    doctorId: id,
                  );
                },
                routes: [
                  GoRoute(
                      path: BookAppointmentScreen.routeName,
                      builder: (context, state) =>
                          const BookAppointmentScreen(),
                      routes: [
                        GoRoute(
                          path: ChooseAppointmentDateScreen.routeName,
                          builder: (context, state) =>
                              const ChooseAppointmentDateScreen(),
                        )
                      ]),
                ]),
          ]),
      GoRoute(
          path: DepartmentsScreen.routeName,
          builder: (context, state) => const DepartmentsScreen(),
          routes: [
            GoRoute(
                path: DepartmentDetailsScreen.routeName,
                builder: (context, state) {
                  final departmentId = state.extra as int?;
                  return DepartmentDetailsScreen(
                    departmentId: departmentId,
                  );
                },
                routes: [
                  GoRoute(
                      path: DoctorProfileScreen.routeName,
                      builder: (context, state) {
                        final id = state.extra as String?;
                        return DoctorProfileScreen(
                          doctorId: id,
                        );
                      },
                      routes: [
                        GoRoute(
                            path: BookAppointmentScreen.routeName,
                            builder: (context, state) =>
                                const BookAppointmentScreen(),
                            routes: [
                              GoRoute(
                                path: ChooseAppointmentDateScreen.routeName,
                                builder: (context, state) =>
                                    const ChooseAppointmentDateScreen(),
                              )
                            ])
                      ])
                ])
          ]),
      GoRoute(
          path: VaccinesScreen.routeName,
          builder: (context, state) {
            return const VaccinesScreen();
          },
          routes: [
            GoRoute(
              path: VaccineDetailsScreen.routeName,
              builder: (context, state) {
                final vaccine = state.extra as VaccineModel?;
                return VaccineDetailsScreen(
                  vaccine: vaccine,
                );
              },
            )
          ]),
      GoRoute(
          path: PharmaciesScreen.routeName,
          builder: (context, state) {
            return const PharmaciesScreen();
          },
          routes: [
            GoRoute(
              path: PharmacyProfileScreen.routeName,
              builder: (context, state) {
                final pharmacyId = state.extra as int?;
                return PharmacyProfileScreen(pharmacyId: pharmacyId);
              },
            )
          ]),
      GoRoute(
          path: MedicinesSearchScreen.routeName,
          builder: (context, state) {
            return const MedicinesSearchScreen();
          },
          routes: [
            // GoRoute(
            //   path: PharmacyProfileScreen.routeName,
            //   builder: (context, state) {
            //     return const PharmacyProfileScreen();
            //   },
            // )
            GoRoute(
              path: PharmacyProfileScreen.routeName,
              builder: (context, state) {
                final pharmacyId = state.extra as int?;
                return PharmacyProfileScreen(pharmacyId: pharmacyId);
              },
            ),

            GoRoute(
              path: MedicineDetailsScreen.routeName,
              builder: (context, state) {
                final med = state.extra as MedicineModel?;
                return MedicineDetailsScreen(
                  med: med,
                );
              },
            ),
          ]),
      GoRoute(
        path: MedicineClassifierScreen.routeName,
        builder: (context, state) => MedicineClassifierScreen(),
      )
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
                builder: (context, state) {
                  final childId = state.extra as String?;

                  return ChildProfileScreen(
                    childId: childId,
                  );
                },
                routes: [
                  GoRoute(
                    path: ChildAppointmentsScreen.routeName,
                    builder: (context, state) {
                      final childAppointmentParams =
                          state.extra as ChildAppointmentParams?;
                      return ChildAppointmentsScreen(
                        childAppointmentParams:
                            childAppointmentParams ?? ChildAppointmentParams(),
                      );
                    },
                  ),
                  GoRoute(
                    path: VaccinationTableScreen.routeName,
                    builder: (context, state) {
                      final vaccineTableScreenParam =
                          state.extra as VaccineTableScreenParam?;
                      return VaccinationTableScreen(
                        vaccineTableScreenParam: vaccineTableScreenParam,
                      );
                    },
                  )
                ])
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
