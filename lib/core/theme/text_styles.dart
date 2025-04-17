import 'package:apartment_admin/core/functions/get_text_size_functions.dart';
import 'package:apartment_admin/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextStyles {
  static TextStyle description = TextStyle(
    fontSize: getTextSize(fontSize: 20),
    color: Color(0xff6E6E6E),
  );
  static TextStyle dataTableTitle = TextStyle(
    fontSize: getTextSize(fontSize: 24),
    fontWeight: FontWeight.w500,
    color: Colors.grey.shade600,
  );
  static TextStyle price = TextStyle(
    fontSize: getTextSize(fontSize: 20),
    fontWeight: FontWeight.w500,
    color: redColor,
  );
  static TextStyle normalTitle({Color? color}) {
    return TextStyle(
      fontSize: getTextSize(fontSize: 20),
      fontWeight: FontWeight.w500,
      color: color ?? Get.theme.colorScheme.primary,
    );
  }

  static TextStyle normaBoldlTitle({Color? color, double? size}) {
    return TextStyle(
      fontSize: getTextSize(fontSize: size ?? 25),
      fontWeight: FontWeight.w700,
      color: color ?? Get.theme.colorScheme.primary,
    );
  }

  static TextStyle normalTitle2({Color? color}) {
    return TextStyle(
      fontSize: getTextSize(fontSize: 30),
      fontWeight: FontWeight.w500,
      color: color ?? Get.theme.colorScheme.primary,
    );
  }
}
