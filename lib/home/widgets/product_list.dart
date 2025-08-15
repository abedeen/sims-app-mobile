import 'package:admin/home/models/product.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Products", style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: [
                DataColumn(label: Text("Produt Name")),
                DataColumn(label: Text("Date")),
                DataColumn(label: Text("Price")),
              ],
              rows: List.generate(
                productListData.length,
                (index) => productDataRow(productListData[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow productDataRow(Product product) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(product.icon!, height: 30, width: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(product.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(product.date!)),
      DataCell(Text(product.size!)),
    ],
  );
}
