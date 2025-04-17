import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class MyTextToAmount extends StatefulWidget {
  final double price;
  final TextStyle? textStyle;
  const MyTextToAmount({super.key, required this.price, this.textStyle});

  @override
  State<MyTextToAmount> createState() => _MyTextToAmountState();
}

class _MyTextToAmountState extends State<MyTextToAmount> {
  late NumberFormat formatt;
  @override
  void initState() {
    formatt = NumberFormat("#,##0", 'en_US');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatt.format(widget.price),
      style: widget.textStyle ?? const TextStyle(),
      overflow: TextOverflow.ellipsis,
    );
  }
}

String amountFromate(double amount) {
  NumberFormat formatt = NumberFormat("#,##0", 'en_US');
  return formatt.format(amount);
}

