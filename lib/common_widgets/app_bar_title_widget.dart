import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
    required this.title, required this.imagePath,
  });


  final String imagePath;
    final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            imagePath,
            width: 35,
            height: 35,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
