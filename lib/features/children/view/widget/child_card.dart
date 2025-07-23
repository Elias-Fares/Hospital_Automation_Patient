part of '../children_s.dart';

class ChildCard extends StatelessWidget {
  const ChildCard({
    super.key,
    required this.childName,
    required this.motherName,
    required this.fatherName,
    this.onTap,
  });

  final String childName;
  final String motherName;
  final String fatherName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: CustomInkwell(
        onTap: onTap,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    childName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "11 weeks",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.hintTextColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SvgContainer(imgPath: Res.fatherIcon),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Father",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.hintTextColor),
                      ),
                      Text(fatherName),
                    ],
                  ),
                  const Spacer(),
                  const SvgContainer(imgPath: Res.motherIcon),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mother",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.hintTextColor),
                      ),
                      Text(motherName),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
