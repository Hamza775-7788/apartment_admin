import 'package:apartment_admin/core/constant/images.dart';
import 'package:apartment_admin/core/functions/get_text_size_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyEmptyWidget extends StatelessWidget {
  const MyEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppIcons.noDataIcon,
              width: getTextSize(fontSize: 150),
            ),
            const SizedBox(height: 20),
            Text(
              Get.locale!.languageCode == "ar"
                  ? "لا يوجد بيانات للعرض!"
                  : "No Data to Show",
              style: TextStyle(
                fontSize: getTextSize(fontSize: 27),
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
