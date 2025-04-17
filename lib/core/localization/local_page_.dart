import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_admin/core/shared/buttons.dart';
import 'package:apartment_admin/core/theme/text_styles.dart';


class LocalPageView extends StatefulWidget {
  final Function() onNavigator;
  const LocalPageView({super.key, required this.onNavigator});

  @override
  State<LocalPageView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LocalPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "اختر لغة التطبيق".tr,
                style: AppTextStyles.normalTitle2(),
              ),
              const SizedBox(height: 16),
              MyGenralButton(
                name: "الانجليزية".tr,
                onPressed: () {
                  // controllerImpl!.setLocal("en");
                  Get.updateLocale(Locale("en"));
                  widget.onNavigator();
                },
              ),
              const SizedBox(height: 16),
              MyGenralButton(
                name: "العربية",
                onPressed: () {
                  // controllerImpl!.setLocal("ar");
                  Get.updateLocale(Locale("ar"));
                  // controllerImpl!.setLocal("ar");
                  widget.onNavigator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
