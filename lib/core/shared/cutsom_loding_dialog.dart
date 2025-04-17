import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoding() {
  Get.dialog(
      Center(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.9),
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
      transitionCurve: Curves.easeIn,
      barrierDismissible: false);
}
