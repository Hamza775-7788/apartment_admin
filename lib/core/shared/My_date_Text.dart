// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class DateToTaimAgo extends StatefulWidget {
  final String date;
  final TextStyle? style;
  const DateToTaimAgo({this.style, required this.date, super.key});

  @override
  State<DateToTaimAgo> createState() => _DateToTaimAgoState();
}

class _DateToTaimAgoState extends State<DateToTaimAgo> {
  late DateTime time;
  late String local;

  @override
  void initState() {
    if (Get.locale!.languageCode == "ar") {
      Jiffy.setLocale("ar");
    } else {}

    time = DateTime.parse(widget.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      key: widget.key,
      Jiffy.parse(time.toString()).fromNow(),
      style: widget.style,
    );
  }
}
