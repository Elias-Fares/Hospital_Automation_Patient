part of '../medicine_classifier_screen.dart';

// class ResultSelection extends StatelessWidget {
//   final AnimationController resultController;
//   // final Map<String, dynamic>? _result;
//   final String result;

//   const ResultSelection(
//       {super.key, required this.resultController, required this.result});

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: Tween<Offset>(
//         begin: const Offset(0, 0.5),
//         end: Offset.zero,
//       ).animate(CurvedAnimation(
//         parent: resultController,
//         curve: Curves.easeOutBack,
//       )),
//       child: FadeTransition(
//         opacity: resultController,
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 const Color(0xFFDEF8F0),
//                 const Color(0xFFDEF8F0).withOpacity(0.5),
//               ],
//             ),
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: AppColors.secondary.withOpacity(0.2),
//               width: 1,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: AppColors.secondary,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Icon(
//                       Icons.check_circle,
//                       color: Color(0xFFF6FCFB),
//                       size: 24,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Analysis Completed',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF1E1D20),
//                         ),
//                       ),
//                       // Text(
//                       //   'Confidence: ',
//                       //   style: TextStyle(
//                       //     fontSize: 12,
//                       //     color: const Color(0xFF1E1D20).withOpacity(0.7),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ResultCard(
//                 result: result,
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.refresh, size: 20),
//                       label: const Text('New Analysis'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF8188F0),
//                         foregroundColor: const Color(0xFFF3F6FA),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class ResultSelection extends StatelessWidget {
  final AnimationController resultController;
  // final Map<String, dynamic>? _result;
  final String result;

  const ResultSelection(
      {super.key, required this.resultController, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFDEF8F0),
            const Color(0xFFDEF8F0).withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.secondary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Color(0xFFF6FCFB),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Analysis Completed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1D20),
                    ),
                  ),
                  // Text(
                  //   'Confidence: ',
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //     color: const Color(0xFF1E1D20).withOpacity(0.7),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ResultCard(
            result: result,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh, size: 20),
                  label: const Text('New Analysis'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8188F0),
                    foregroundColor: const Color(0xFFF3F6FA),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
