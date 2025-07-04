part of '../vaccine_details_screen.dart';
class VaccineDetailsPage extends StatelessWidget {
  const VaccineDetailsPage({
    super.key,
    required this.fromAge,
    required this.toAge,
    required this.availability,
    required this.description,
    required this.interactions,
  });

  final String fromAge;
  final String toAge;
  final String availability;
  final String description;
  final List<String> interactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconKeyValueWidget(
            keyTitle: "From Age",
            value: fromAge,
            iconPath: Res.lineStartCircle,
          ),
          const SizedBox(
            height: 15,
          ),
          IconKeyValueWidget(
            keyTitle: "To Age",
            value: toAge,
            iconPath: Res.lineEndCircle,
          ),
          const SizedBox(
            height: 15,
          ),
          IconKeyValueWidget(
            keyTitle: "Availability",
            value: availability,
            iconData: Icons.vaccines_outlined,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Description",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Interactions",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.separated(
            itemCount: interactions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${index + 1}. ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Flexible(
                    child: Text(interactions.elementAt(index),
                        style: Theme.of(context).textTheme.bodyMedium),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
