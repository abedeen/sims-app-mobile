import 'package:admin/constants.dart';
import 'package:admin/home/models/kpi_card_info.dart';
import 'package:admin/home/widgets/kpi_info_card.dart';
import 'package:flutter/material.dart';

class KpiCardGridView extends StatelessWidget {
  const KpiCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: fakeKpiInfo.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => KpiInfoCard(info: fakeKpiInfo[index]),
    );
  }
}
