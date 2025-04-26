part of '../child_profile_screen.dart';

class ChildProfileTitle extends StatelessWidget {
  const ChildProfileTitle({
    super.key,
    required this.childName,
  });

  final String childName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Res.childCardIcon,
          width: 30,
          height: 30,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          childName,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
