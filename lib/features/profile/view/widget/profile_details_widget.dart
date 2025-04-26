part of '../profile_screen.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget(
      {super.key,
      required this.name,
      required this.gender,
      required this.imagePath,
      required this.address,
      required this.lastAppointment,
      required this.nextAppointment});

  final String name;
  final String gender;
  final String imagePath;
  final String address;
  final String lastAppointment;
  final String nextAppointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(children: [
        // IconKeyValueWidget(
        //     iconPath: Res.fatherIcon,
        //     keyTitle: "Father name",
        //     value: fatherName),

        Row(
          children: [
            ClipOval(
                child: GeneralImageAssets(
              path: imagePath,
              width: 70.w,
              height: 70.w,
            )),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        IconKeyValueWidget(
            iconPath: Res.fatherIcon,
            keyTitle: "Residential address",
            value: address),
        const SizedBox(
          height: 20,
        ),
        IconKeyValueWidget(
            iconPath: Res.genderIcon, keyTitle: "Gender", value: gender),
      ]),
    );
  }
}
