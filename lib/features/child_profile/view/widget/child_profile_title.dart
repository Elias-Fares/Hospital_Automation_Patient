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
        const SvgContainer(
          imgPath: Res.childCardIcon,
          imageWidth: 30,
          imageHieght: 30,
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
