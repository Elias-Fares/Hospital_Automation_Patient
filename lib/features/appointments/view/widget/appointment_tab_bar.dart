
part of '../appointments.dart';


class AppointmentsTabBar extends StatelessWidget {
  const AppointmentsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(6)),
      child: ButtonsTabBar(
        backgroundColor: AppColors.primaryContainer,
        unselectedBackgroundColor: AppColors.transparent,
        labelStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppColors.onPrimaryContainerBlue, inherit: true),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: AppColors.hintTextColor, inherit: true),
        contentCenter: true,
        width: MediaQuery.of(context).size.width / 3.2,
        physics: const NeverScrollableScrollPhysics(),
        splashColor: AppColors.primaryContainer,
        elevation: 0,
        tabs: const [
          Tab(
            text: "Upcoming",
            icon: TabBarBadge(count: 10),
          ),
          Tab(
            text: "Passed",
            icon: TabBarBadge(count: 50),
          ),
          Tab(
            text: "Missed",
            icon: TabBarBadge(count: 110),
          ),
        ],
      ),
    );
  }
}
