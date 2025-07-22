part of 'children_s.dart';

class ChildrenScreen extends ConsumerStatefulWidget {
  static const routeName = "/children_screen";
  const ChildrenScreen({super.key});

  @override
  ConsumerState<ChildrenScreen> createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends ConsumerState<ChildrenScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        ref.read(childrenViewModelProvider.notifier).getChildren();
      },
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final childrenState = ref.watch(childrenViewModelProvider);
    return Scaffold(
      appBar: const MainAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(childrenViewModelProvider.notifier)
              .getChildren(withRefresh: true);
        },
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: childrenState.childrenResponse?.when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final element = data.elementAtOrNull(index);
                      return ChildCard(
                        childName:
                            "${(element?.child?.firstName ?? "")} ${(element?.child?.lastName ?? "")}",
                        fatherName:
                            "${(element?.child?.fatherFirstName ?? "")} ${(element?.child?.fatherLastName ?? "")}",
                        motherName:
                            "${(element?.child?.motherFirstName ?? "")} ${(element?.child?.motherLastName ?? "")}",
                        onTap: () {
                          context.push(
                              "${ChildrenScreen.routeName}${ChildProfileScreen.routeName}",
                              extra: element?.childId?.toString());
                        },
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return CustomErrorWidget(
                    message: error.toString(),
                    onTryAgainTap: () {
                      ref
                          .read(childrenViewModelProvider.notifier)
                          .getChildren();
                    },
                  );
                },
                loading: () {
                  return const CustomLoadingWidget();
                },
              ) ??
              const SizedBox.shrink(),
        ),
      ),
    );
  }
}
