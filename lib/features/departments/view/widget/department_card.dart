part of '../departments_screen.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({
    super.key,
    this.onTap,
    required this.departmentName,
    required this.status,
  });

  final String departmentName;
  final String status;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomInkwell(
        onTap: onTap,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: containerCardDecoration(color: AppColors.transparent),
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: const EdgeInsets.all(6),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: AppColors.primaryContainer,
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.medical_information_outlined,
                      size: 18,
                      color: AppColors.primary,
                    )),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(departmentName,
                        style: Theme.of(context).textTheme.bodyMedium),
                    // Text(
                    //   status,
                    //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    //       color: status.toLowerCase() == "open"
                    //           ? AppColors.greenText
                    //           : AppColors.error),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
