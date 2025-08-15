import 'package:admin/common/responsive.dart';
import 'package:admin/home/widgets/kpis_widget.dart';
import 'package:flutter/material.dart';

import '../common/constants.dart';
import 'header.dart';

import 'widgets/product_list.dart';
import 'widgets/resource_usage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      KpisWidget(),
                      SizedBox(height: defaultPadding),
                      ProductList(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) ResourceUsageDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),

                if (!Responsive.isMobile(context))
                  Expanded(flex: 2, child: ResourceUsageDetails()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
