part of '../doctor_profile_screen.dart';

class DoctorProfileDetailsWidget extends StatelessWidget {
  const DoctorProfileDetailsWidget({
    super.key,
    required this.name,
    required this.gender,
    required this.imagePath,
    required this.address,
    required this.doctorSpeciality,
    required this.doctorDepartment,
    required this.availabilitySchedule,
    required this.appointmentTypes,
    required this.phoneNumber,
    required this.emailAddress,
    this.onPhoneNumberTap,
    this.onEmailTap,
  });

  final String name;
  final String doctorSpeciality;
  final String doctorDepartment;
  final String gender;
  final String imagePath;
  final String address;
  final List<AvailabilitySchedule> availabilitySchedule;
  final List<String> appointmentTypes;
  final String phoneNumber;
  final String emailAddress;

  final void Function()? onPhoneNumberTap;
  final void Function()? onEmailTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Column(
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  doctorSpeciality,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.hintTextColor),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        IconKeyValueWidget(
          iconPath: Res.departmentIcon,
          keyTitle: "Department",
          value: doctorDepartment,
          needOnTap: true,
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
        const SizedBox(
          height: 20,
        ),
        Text(
          "Availability Schedule",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            availabilitySchedule.length,
            (index) => KeyValueCard(
                keyTitle: availabilitySchedule.elementAt(index).day,
                value: availabilitySchedule.elementAt(index).schedule),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Appointments Types",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            appointmentTypes.length,
            (index) => OutlinedCard(
              text: appointmentTypes.elementAt(index),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            ProfilePhoneWidget(
              phoneNumber: phoneNumber,
              onTap: onPhoneNumberTap,
            ),
            const SizedBox(
              width: 8,
            ),
            ProfileEmailWidget(
              onTap: onEmailTap,
            )
          ],
        )
      ]),
    );
  }
}
