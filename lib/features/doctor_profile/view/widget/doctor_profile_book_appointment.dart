part of '../doctor_profile_screen.dart';

class DoctorProfileBookAppointmentButton extends StatelessWidget {
  const DoctorProfileBookAppointmentButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: LoadingButton(
        title: "Book appointment",
        isLoading: false,
        onTap: onTap,
      ),
    );
  }
}
