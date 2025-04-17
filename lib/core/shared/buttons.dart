import 'package:apartment_admin/core/model/category_or_unit_entiry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:apartment_tow/featuers/shared/domain/entity/category_or_unit_entiry.dart';

import '../functions/get_text_size_functions.dart';

class MyGenralButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final String? name;
  final Color? color;
  final Color? textColor;
  final double? height;
  const MyGenralButton({
    super.key,
    this.child,
    this.onPressed,
    this.name,
    this.color,
    this.textColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        height: getTextSize(fontSize: height ?? 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color ?? Get.theme.colorScheme.primary,
        ),
        child:
            child ??
            Text(
              name!,
              style: TextStyle(
                fontSize: getTextSize(fontSize: 20),
                color: textColor ?? Get.theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}

class MyFilterButton extends StatelessWidget {
  final Function() onTap;
  final EilmentModel category;
  final int selectID;
  const MyFilterButton({
    required this.onTap,
    required this.selectID,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:
              selectID == category.id
                  ? Get.theme.colorScheme.primary
                  : Get.theme.colorScheme.secondary,
        ),
        child: Text(
          category.nameAr,
          style: TextStyle(
            fontSize: getTextSize(fontSize: 20),
            fontWeight: FontWeight.bold,
            color:
                selectID == category.id
                    ? Get.theme.colorScheme.secondary
                    : Get.theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class MyIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;
  const MyIconButtonWidget({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon,
      ),
    );
  }
}
