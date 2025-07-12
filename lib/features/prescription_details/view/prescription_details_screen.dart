import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient_app/data/perscriptions/models/prescription_model.dart';

class PrescriptionDetailsScreen extends ConsumerStatefulWidget {
  const PrescriptionDetailsScreen( {super.key, required this.prescriptionModel,});
  static const routeName = "/prescription_details_screen";

  final PrescriptionModel? prescriptionModel;

  @override
  ConsumerState<PrescriptionDetailsScreen> createState() =>
      _PrescriptionDetailsScreenState();
}

class _PrescriptionDetailsScreenState
    extends ConsumerState<PrescriptionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
