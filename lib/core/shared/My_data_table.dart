import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  const MyDataTable({
    required this.columns,
    required this.rows,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.primaryContainer,
      child: DataTable(
        dataRowColor:
            MaterialStatePropertyAll(Get.theme.colorScheme.background),
        showBottomBorder: true,
        border: TableBorder(
            horizontalInside: BorderSide(
              color: Get.theme.colorScheme.inversePrimary,
            ),
            bottom: BorderSide(color: Get.theme.colorScheme.inversePrimary)),
        columnSpacing: 10,
        columns: columns,
        rows: rows,
      ),
    );
  }
}
