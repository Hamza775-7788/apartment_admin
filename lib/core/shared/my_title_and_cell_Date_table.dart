import 'package:apartment_admin/core/functions/get_text_size_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTitleDataTable extends StatelessWidget {
  final String name;
  final TextStyle? style;
  const MyTitleDataTable({super.key, required this.name, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          // maxWidth: 100,
          minWidth: 50,
        ),
        child: Text(
          name,
          maxLines: 2,
          style: style ??
              TextStyle(
                  fontSize: getTextSize(fontSize: 20),
                  color: Get.theme.colorScheme.primary,
                  fontWeight: FontWeight.bold),
        ));
  }
}

class MyCellTextDataTable extends StatelessWidget {
  final String name;
  final TextStyle? style;
  const MyCellTextDataTable({super.key, required this.name, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxWidth: 100,
          minWidth: 50,
        ),
        child: Text(
          name,
          maxLines: 2,
          style: style ??
              TextStyle(
                  fontSize: getTextSize(fontSize: 20),
                  color: Get.theme.colorScheme.primary),
        ));
  }
}
