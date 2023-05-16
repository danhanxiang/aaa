import 'package:flutter/material.dart';

class CommonFormItem extends StatelessWidget {
  // 标题文字
  final String label;
  // 传递widge
  final Widget Function(BuildContext context)? contentBuilder;

  final Widget? suffix;
  final String? subffText;
  final String? hintText;
  final ValueChanged? onChange;
  final TextEditingController? controller;

  const CommonFormItem(
      {Key? key,
      required this.label,
      this.contentBuilder,
      this.suffix,
      this.subffText,
      this.hintText,
      this.onChange,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Theme.of(context).disabledColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          SizedBox(width: 8),
          Expanded(
              child: contentBuilder != null
                  ? contentBuilder!(context)
                  : TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: hintText, border: InputBorder.none),
                    )),
          SizedBox(width: 8),
          if (suffix != null) suffix!,
          if (suffix == null && subffText != null) Text(subffText ?? ""),
        ],
      ),
    );
  }
}
