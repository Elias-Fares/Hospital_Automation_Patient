part of '../edit_profile_screen.dart';

class EditProfileAddNoteButton extends StatelessWidget {
  const EditProfileAddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: const Radius.circular(8),
      borderType: BorderType.RRect,
      color: AppColors.onSurfaceContainer,
      strokeWidth: .7,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add Note",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            ClipOval(
              child: Container(
                color: AppColors.backgroundColor,
                padding: const EdgeInsets.all(3),
                child: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
