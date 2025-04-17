
import 'package:flutter/material.dart';


import 'package:get/get.dart';

import 'package:apartment_admin/core/constant/images.dart';
import 'package:apartment_admin/core/functions/get_text_size_functions.dart';
import 'package:apartment_admin/core/shared/buttons.dart';

class ErorrDilaog extends StatelessWidget {
  final String message;
  const ErorrDilaog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 21),
            Image.asset(
              AppIcons.errorIcon,
              height: 55,
            ),
            const SizedBox(height: 21),
            Text(
              message,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 24),
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            MyGenralButton(
              name: Get.locale!.languageCode == "ar" ? "اغلاق" : "Close",
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ServerErorr extends StatelessWidget {
  final String message;
  const ServerErorr({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 21),
            Image.asset(
              AppIcons.serverErorr,
              height: 80,
            ),
            const SizedBox(height: 21),
            Text(
              message,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 24),
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            MyGenralButton(
              name: Get.locale!.languageCode == "ar" ? "اغلاق" : "Close",
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WoringDilaog extends StatelessWidget {
  final String message;
  final String title;
  final Function() onSkip;
  const WoringDilaog(
      {required this.onSkip,
      required this.title,
      super.key,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: getTextSize(fontSize: 24),
                  fontWeight: FontWeight.bold,
                  color: Get.theme.colorScheme.primary),
            ),
            const SizedBox(height: 21),
            Image.asset(
              AppIcons.worinngIcon,
              height: 55,
            ),
            const SizedBox(height: 21),
            Text(
              message,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 24),
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const SizedBox(width: 10),
            MyGenralButton(
              color: Get.theme.colorScheme.primary,
              name: "موافق",
              onPressed: () {
                Get.back();
                onSkip();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OfflineDilaog extends StatelessWidget {
  const OfflineDilaog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 21),
            Image.asset(
              AppIcons.offline,
              height: 80,
            ),
            const SizedBox(height: 21),
            Text(
              Get.locale!.languageCode == "ar"
                  ? "لا يوجد اتصال بالإنترنت"
                  : "Check your network connection",
              style: TextStyle(
                fontSize: getTextSize(fontSize: 24),
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const SizedBox(width: 10),
            MyGenralButton(
              name: Get.locale!.languageCode == "ar" ? "اغلاق" : "Close",
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionDilaog extends StatelessWidget {
  final String message;
  final String title;
  final Widget? bt1Name;
  final Widget? bt2Name;
  final String? bt1Text;
  final String? bt2Text;
  final Function() onBt1;
  final Function() onBt2;

  const QuestionDilaog({
    required this.onBt2,
    required this.onBt1,
    this.bt1Text,
    this.bt2Text,
    this.bt1Name,
    this.bt2Name,
    required this.title,
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppIcons.worinngIcon,
              height: 55,
            ),
            const SizedBox(height: 21),
            Text(
              message,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 24),
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const SizedBox(width: 10),
            Row(
              children: [
                Expanded(
                  child: MyGenralButton(
                    color: Get.theme.colorScheme.primary,
                    name: bt1Text,
                    child: bt1Name,
                    onPressed: () {
                      Get.back();
                      onBt1();
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MyGenralButton(
                    color: Get.theme.colorScheme.primary,
                    name: bt2Text,
                    child: bt2Name,
                    onPressed: () {
                      Get.back();
                      onBt2();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
