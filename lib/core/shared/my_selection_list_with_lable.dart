import 'package:apartment_admin/core/model/category_or_unit_entiry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apartment_admin/core/functions/get_text_size_functions.dart';

class MyDropDwounListWithLabl extends StatefulWidget {
  final TextStyle? itemTextStyle;
  final String lable;
  final bool withValue;
  final int? value;
  final List<EilmentModel> selectionList;
  final TextStyle? textStyle;
  final void Function(dynamic)? onChanged;
  final double? height;
  const MyDropDwounListWithLabl({
    this.itemTextStyle,
    this.withValue = false,
    this.height,
    this.value,
    this.onChanged,
    super.key,
    required this.lable,
    this.textStyle,
    required this.selectionList,
  });

  @override
  State<MyDropDwounListWithLabl> createState() =>
      _MyDropDwounListWithLablState();
}

class _MyDropDwounListWithLablState extends State<MyDropDwounListWithLabl> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style:
              widget.textStyle ??
              TextStyle(fontSize: getTextSize(fontSize: 20)),
        ),
        const SizedBox(height: 5),
        widget.withValue
            ? MyDropDownListWithValue(
              value: widget.value!,
              onChanged: widget.onChanged,
              selectionList:
                  widget.selectionList
                      .map<DropdownMenuItem>(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Row(
                            children: [
                              FittedBox(
                                child: Text(
                                  e.nameAr,
                                  style:
                                      widget.itemTextStyle ??
                                      TextStyle(
                                        fontSize: getTextSize(fontSize: 18),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
              key: widget.key,
            )
            : DropdownButtonFormField(
              padding: EdgeInsets.zero,
              decoration: inputDecoration,
              items:
                  widget.selectionList
                      .map<DropdownMenuItem>(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            e.nameAr,
                            style:
                                widget.itemTextStyle ??
                                TextStyle(fontSize: getTextSize(fontSize: 18)),
                          ),
                        ),
                      )
                      .toList(),
              onChanged: widget.onChanged,
            ),
      ],
    );
  }
}

class MyDropDownList extends StatefulWidget {
  final List<DropdownMenuItem> selectionList;
  final void Function(dynamic)? onChanged;
  const MyDropDownList({
    this.onChanged,
    super.key,
    required this.selectionList,
  });

  @override
  State<MyDropDownList> createState() => _MyDropDownListState();
}

class _MyDropDownListState extends State<MyDropDownList> {
  List<DropdownMenuItem> entries = [];

  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  int value = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: inputDecoration,
      onChanged: (val) {
        value = val;
        widget.onChanged!(val);
        setState(() {});
      },
      items: widget.selectionList,
    );
  }
}

class MyDropDownListWithValue extends StatefulWidget {
  final int value;
  final List<DropdownMenuItem> selectionList;
  final void Function(dynamic)? onChanged;
  const MyDropDownListWithValue({
    required this.value,
    this.onChanged,
    super.key,
    required this.selectionList,
  });

  @override
  State<MyDropDownListWithValue> createState() =>
      _MyDropDownListWithValueState();
}

class _MyDropDownListWithValueState extends State<MyDropDownListWithValue> {
  @override
  void initState() {
    setState(() {});

    super.initState();
  }

  int value = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      padding: EdgeInsets.zero,
      iconSize: getTextSize(fontSize: 18),
      value: widget.value,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: getTextSize(fontSize: 40)),
        filled: true,
        fillColor: Get.theme.colorScheme.secondary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
          borderSide: BorderSide(color: Get.theme.colorScheme.primary),
        ),
      ),
      onChanged: (val) {
        value = val;
        widget.onChanged!(val);
        setState(() {});
      },
      items: widget.selectionList,
    );
  }
}

InputDecoration inputDecoration = InputDecoration(
  constraints: BoxConstraints(maxHeight: getTextSize(fontSize: 46)),
  filled: true,
  fillColor: Get.theme.colorScheme.secondary,
  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
);
