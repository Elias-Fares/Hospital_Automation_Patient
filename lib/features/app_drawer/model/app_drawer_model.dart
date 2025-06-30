import 'package:patient_app/features/departments/view/departments_screen.dart';
import 'package:patient_app/features/patient_doctors/view/patient_doctors_screen.dart';
import 'package:patient_app/features/medical_record/view/medical_record_screen.dart';
import 'package:patient_app/features/patient_prescription/view/patient_prescription_screen.dart';
import 'package:patient_app/features/profile/view/profile_screen.dart';

import '../../../configuration/res.dart';

class AppDrawerElement {
  final String iconPath;
  final String title;
  final String routeName;

  AppDrawerElement(
      {required this.iconPath, required this.title, required this.routeName});
}

class AppDrawerModel {
  AppDrawerModel._internal();
  static final AppDrawerModel _instance = AppDrawerModel._internal();

  static AppDrawerModel get instance => _instance;

  List<AppDrawerElement> getAppDrawerElement() {
    return [
      AppDrawerElement(
          iconPath: Res.drawerProfileIcon,
          title: "Profile",
          routeName: ProfileScreen.routeName),
      AppDrawerElement(
          iconPath: Res.drawerMedicalRecordsIcon,
          title: "Medical Records",
          routeName: MedicalRecordScreen.routeName),
      AppDrawerElement(
          iconPath: Res.drawerPrescriptionIcon,
          title: "Prescription",
          routeName: PatientPrescriptionScreen.routeName),
      AppDrawerElement(
          iconPath: Res.drawerDoctorsIcon,
          title: "Doctors",
          routeName: PatientDoctorsScreen.routeName),
      AppDrawerElement(
          iconPath: Res.drawerDepartmentIcon,
          title: "Departments",
          routeName: DepartmentsScreen.routeName),
      AppDrawerElement(
          iconPath: Res.drawerVaccinationIcon,
          title: "Vaccines",
          routeName: ""),
      AppDrawerElement(
          iconPath: Res.drawerPharmaciesIcon,
          title: "Pharmacies",
          routeName: ""),
      AppDrawerElement(
          iconPath: Res.drawerMedicineIcon,
          title: "Search for medicine",
          routeName: ""),
    ];
  }
}
