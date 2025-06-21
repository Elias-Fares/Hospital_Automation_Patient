part of 'appointments.dart';

class AppointmentsScreen extends ConsumerStatefulWidget {
  static const routeName = "/appointments";

  const AppointmentsScreen({super.key});

  @override
  ConsumerState<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends ConsumerState<AppointmentsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        final appointmentsViewModel =
            ref.read(appointmentsViewModelProvider.notifier);
        appointmentsViewModel.getBothUpcomingAppointments();
        appointmentsViewModel.getBothPassedAppointments();
        appointmentsViewModel.getBothMissedAppointments();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appointmentsState = ref.watch(appointmentsViewModelProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const MainAppBar(),
        body: Column(
          children: [
            AppointmentsTabBar(
              upcomingCount:
                  appointmentsState.upcomingAppointments?.asData?.value.length,
              passedCount:
                  appointmentsState.passedAppointments?.asData?.value.length,
              missedCount:
                  appointmentsState.missedAppointments?.asData?.value.length,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  appointmentsState.upcomingAppointments?.when(
                        data: (data) => AppointmentTabView(
                          appointments: data,
                          onRefresh: () async {
                            ref
                                .read(appointmentsViewModelProvider.notifier)
                                .getBothUpcomingAppointments();
                          },
                        ),
                        error: (error, stackTrace) => CustomErrorWidget(
                          message: error.toString(),
                          onTryAgainTap: () {
                            ref
                                .read(appointmentsViewModelProvider.notifier)
                                .getBothUpcomingAppointments();
                          },
                        ),
                        loading: () => const CustomLoadingWidget(),
                      ) ??
                      const SizedBox.shrink(),
                  appointmentsState.passedAppointments?.when(
                        data: (data) => AppointmentTabView(
                          appointments: data,
                          onRefresh: () async {
                            ref
                                .read(appointmentsViewModelProvider.notifier)
                                .getBothPassedAppointments();
                          },
                        ),
                        error: (error, stackTrace) => CustomErrorWidget(
                          message: error.toString(),
                          onTryAgainTap: () {
                            ref
                                .read(appointmentsViewModelProvider.notifier)
                                .getBothPassedAppointments();
                          },
                        ),
                        loading: () => const CustomLoadingWidget(),
                      ) ??
                      const SizedBox.shrink(),
                  appointmentsState.missedAppointments?.when(
                        data: (data) => AppointmentTabView(
                          appointments: data,
                          onRefresh: () async {
                            ref
                                .read(appointmentsViewModelProvider.notifier)
                                .getBothMissedAppointments();
                          },
                        ),
                        error: (error, stackTrace) => CustomErrorWidget(
                          message: error.toString(),
                          onTryAgainTap: () {
                            ref
                                .read(appointmentsViewModelProvider.notifier)
                                .getBothMissedAppointments();
                          },
                        ),
                        loading: () => const CustomLoadingWidget(),
                      ) ??
                      const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
