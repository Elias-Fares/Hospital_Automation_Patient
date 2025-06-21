part of '../appointments.dart';

class AppointmentsTabBar extends StatelessWidget {
  const AppointmentsTabBar(
      {super.key, this.upcomingCount, this.passedCount, this.missedCount});
  final int? upcomingCount;
  final int? passedCount;
  final int? missedCount;

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
        tabs: [
          Tab(
            text: "Upcoming",
            icon: upcomingCount != null
                ? TabBarBadge(count: upcomingCount!)
                : null,
          ),
          Tab(
            text: "Passed",
            icon: passedCount != null ? TabBarBadge(count: passedCount!) : null,
          ),
          Tab(
            text: "Missed",
            icon: missedCount != null ? TabBarBadge(count: missedCount!) : null,
          ),
        ],
      ),
    );
  }
}
