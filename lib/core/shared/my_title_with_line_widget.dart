import 'package:apartment_admin/core/functions/get_text_size_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTitleWithLineWidget extends StatelessWidget {
  final String title;
  const MyTitleWithLineWidget({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: 16,
            width: 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffD95049),
                      Color(0xffE7B5B3),
                    ])),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
                fontSize: getTextSize(fontSize: 23),
                fontWeight: FontWeight.bold,
                color: Get.theme.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
