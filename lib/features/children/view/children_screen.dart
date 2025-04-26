part of 'children_s.dart';

class ChildrenScreen extends StatelessWidget {
  static const routeName = "/children_screen";
  const ChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ChildCard(
              childName: "Child name",
              fatherName: "father name",
              motherName: "mother name",
              onTap: () {
                context.push("$routeName/${ChildProfileScreen.routeName}");
              },
            );
          },
        ),
      ),
    );
  }
}
