part of '../medicine_classifier_screen.dart';
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
   
    required AnimationController pulseController,
  }) : _pulseController = pulseController;

 
  final AnimationController _pulseController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1B82E9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1B82E9).withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.psychology,
                color: Color(0xFFF3F6FA),
                size: 23,
              ),
            ),
            const SizedBox(width: 14),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF1B82E9), Color(0xFF8188F0)],
              ).createShader(bounds),
              child: Text('Medicine Classifier',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(width: 12),
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + (_pulseController.value * 0.2),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: AppColors.primaryText,
                    size: 24,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'AI-powered medicine classification and usage analysis\nthrough advanced data mining',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.onPrimaryContainer,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
