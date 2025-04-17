import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../functions/get_text_size_functions.dart';

class MyCustomRequiredTextFiled extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Widget? icon;
  final bool isPassword;
  final bool? isEnebal;
  final bool isNumber;
  final int maxLins;
  final Function(String)? onChanged;

  const MyCustomRequiredTextFiled({
    super.key,
    this.maxLins = 1,
    this.onChanged,
    required this.hint,
    required this.controller,
    this.icon,
    this.isPassword = false,
    this.isEnebal,
    this.isNumber = false,
  });

  @override
  State<MyCustomRequiredTextFiled> createState() =>
      _MyCustomRequiredTextFiledState();
}

bool show = true;

class _MyCustomRequiredTextFiledState extends State<MyCustomRequiredTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      enabled: widget.isEnebal,
      inputFormatters:
          widget.isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
      keyboardType: widget.isNumber ? TextInputType.number : null,
      obscureText: widget.isPassword ? show : false,
      style: TextStyle(fontSize: getTextSize(fontSize: 20)),

      maxLines: widget.maxLins,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    show = !show;
                    setState(() {});
                  },
                  icon: Icon(
                    show
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Get.theme.colorScheme.primary,
                  ),
                )
                : null,
        hintText: widget.hint,
        prefixIcon: widget.icon,
        constraints:
            widget.maxLins > 1
                ? null
                : BoxConstraints(maxHeight: getTextSize(fontSize: 46)),
        filled: true,
        fillColor: Get.theme.colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Get.theme.colorScheme.primary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

class MyPinTextFiled extends StatelessWidget {
  final TextEditingController controller;
  const MyPinTextFiled({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      defaultPinTheme: PinTheme(
        textStyle: TextStyle(
          fontSize: getTextSize(fontSize: 23),
          fontWeight: FontWeight.bold,
        ),
        height: getTextSize(fontSize: 60),
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      length: 6,
      controller: controller,
    );
  }
}

class MyTextFiledWithLabel extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget? icon;
  final bool isPassword;
  final bool? isEnebal;
  final bool isNumber;
  final String label;
  final int maxLins;
  final Function(String)? onChanged;
  const MyTextFiledWithLabel({
    super.key,
    this.maxLins = 1,
    this.onChanged,
    required this.hint,
    required this.controller,
    this.icon,
    this.isPassword = false,
    this.isEnebal,
    this.isNumber = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: getTextSize(fontSize: 20))),
        const SizedBox(height: 5),
        MyCustomRequiredTextFiled(
          onChanged: onChanged,
          maxLins: maxLins,
          isNumber: isNumber,
          icon: icon,
          isPassword: isPassword,
          isEnebal: isEnebal,
          hint: hint,
          controller: controller,
        ),
      ],
    );
  }
}
