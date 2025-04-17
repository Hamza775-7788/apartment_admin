import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBodyPages extends StatelessWidget {
  final Widget child;
  const MyBodyPages({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}
