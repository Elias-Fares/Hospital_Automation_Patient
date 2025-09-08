import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/style/app_colors.dart';
import '../../../core/validators/fields_validator.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/buttons/loading_button.dart';
import '../../../core/widgets/cards/icon_container.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../view_model/medicine_classifier_view_model.dart';
part 'widget/header_widget.dart';
part 'widget/warning_banner.dart';
part 'widget/result_card.dart';
part 'widget/result_selection.dart';

class MedicineClassifierScreen extends ConsumerStatefulWidget {
  const MedicineClassifierScreen({super.key});
  static const routeName = "/medicine_classifier_screen";

  @override
  ConsumerState<MedicineClassifierScreen> createState() =>
      _MedicineClassifierScreenState();
}

class _MedicineClassifierScreenState
    extends ConsumerState<MedicineClassifierScreen>
    with TickerProviderStateMixin {
  final _medicineNameController = TextEditingController();
  final _composition1Controller = TextEditingController();
  final _composition2Controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _isAnalyzing = false;
  Map<String, dynamic>? _result;
  late AnimationController _pulseController;
  late AnimationController _resultController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _resultController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _medicineNameController.dispose();
    _composition1Controller.dispose();
    _composition2Controller.dispose();
    _pulseController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  // Future<void> _analyzeMedicine() async {
  //   if (_medicineNameController.text.trim().isEmpty ||
  //       _composition1Controller.text.trim().isEmpty) {
  //     return;
  //   }

  //   setState(() {
  //     _isAnalyzing = true;
  //     _result = null;
  //   });

  //   // Simulate API call
  //   await Future.delayed(const Duration(seconds: 3));

  //   setState(() {
  //     _result = {
  //       'medicineClass': 'Beta-lactam Antibiotics',
  //       'uses': [
  //         'Treatment of bacterial infections',
  //         'Respiratory tract infections',
  //         'Urinary tract infections',
  //         'Skin and soft tissue infections'
  //       ],
  //       'accuracy': '93.23%',
  //       'confidence': 'High'
  //     };
  //     _isAnalyzing = false;
  //   });

  //   _resultController.forward();
  // }

  // void _resetForm() {
  //   _medicineNameController.clear();
  //   _composition1Controller.clear();
  //   _composition2Controller.clear();
  //   setState(() {
  //     _result = null;
  //   });
  //   _resultController.reset();
  // }

  @override
  Widget build(BuildContext context) {
    final medicineClassifierState =
        ref.watch(medicineClassifierViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFF3F6FA),
              const Color(0xFFDEDFF8).withValues(alpha: .3),
              const Color(0xFF1B82E9).withValues(alpha: .1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header Section
                HeaderWidget(pulseController: _pulseController),
                const SizedBox(height: 32),

                // Main Card
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: .1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Warning Banner
                      WarningBanner(),

                      // Input Form
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            _buildInputForm(),
                            const SizedBox(height: 24),

                            // Analyze Button
                            LoadingButton(
                              title: "Analyze",
                              isLoading: _isAnalyzing,
                              onTap: () {
                                if (!(_formKey.currentState?.validate() ??
                                    false)) {
                                  return;
                                }

                                ref
                                    .read(medicineClassifierViewModelProvider
                                        .notifier)
                                    .getMedicineClass(
                                        medicineName:
                                            _medicineNameController.text,
                                        composition1:
                                            _composition1Controller.text,
                                        composition2:
                                            _composition2Controller.text);
                              },
                            ),
                            const SizedBox(height: 24),
                            medicineClassifierState.resultClassResponse?.when(
                                  data: (data) {
                                    debugPrint("its data");
                                    return ResultSelection(
                                        resultController: _resultController,
                                        result: data.result ?? "");
                                  },
                                  error: (error, stackTrace) =>
                                      CustomErrorWidget(
                                    message: error.toString(),
                                    onTryAgainTap: () {
                                      ref
                                          .read(
                                              medicineClassifierViewModelProvider
                                                  .notifier)
                                          .getMedicineClass(
                                              medicineName:
                                                  _medicineNameController.text,
                                              composition1:
                                                  _composition1Controller.text,
                                              composition2:
                                                  _composition2Controller.text);
                                    },
                                  ),
                                  loading: () => _buildLoadingAnimation(),
                                ) ??
                                SizedBox.shrink(),
                            //   // Loading Animation
                            //   if (_isAnalyzing) _buildLoadingAnimation(),

                            //   // Results Section
                            //   if (_result != null)
                            //     ResultSelection(
                            //       result: {},
                            //       resultController: _resultController,
                            //     ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
            controller: _medicineNameController,
            label: 'Medicine Name *',
            icon: Icons.medication,
            hint: 'Enter medicine name',
          ),
          const SizedBox(height: 20),
          _buildTextField(
            controller: _composition1Controller,
            label: 'Primary Composition *',
            icon: Icons.science,
            hint: 'Enter primary active ingredient',
          ),
          const SizedBox(height: 20),
          _buildTextField(
              controller: _composition2Controller,
              label: 'Secondary Composition (Optional)',
              icon: Icons.biotech,
              hint: 'Enter secondary active ingredient',
              needValidator: false),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String hint,
    bool needValidator = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.onPrimaryContainer,
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium,
          validator: needValidator
              ? (value) => FieldsValidator.validateEmpty(value: value ?? "")
              : null,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: IconContainer(iconData: icon),
            prefixIconConstraints: BoxConstraints(maxWidth: 50),
            fillColor: AppColors.backgroundColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingAnimation() {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryText.withValues(alpha: .2),
              ),
              child: Transform.scale(
                scale: 0.8 + (_pulseController.value * 0.4),
                child: const Icon(
                  Icons.analytics,
                  color: Color(0xFF1B82E9),
                  size: 40,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Mining data patterns...',
          style: TextStyle(
            color: Color(0xFF8188F0),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
