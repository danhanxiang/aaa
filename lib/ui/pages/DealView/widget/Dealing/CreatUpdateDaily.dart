import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/widget/TextView.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class CreatUpdateDaily extends StatefulWidget {

  CreatUpdateDaily(this.onTap,{this.dealText = '', this.style = 0, this.maxLength});
  // 回掉传出输入内容
  Function(String) onTap;
  // 输入框
  String dealText;
  // 0 创建 1 更新
  int style;
  final int? maxLength;

  @override
  State<CreatUpdateDaily> createState() => _CreatUpdateDailyState();
}

class _CreatUpdateDailyState extends State<CreatUpdateDaily> {
  TextEditingController textEditingController = TextEditingController();

  void initState() {
    super.initState();
    textEditingController.text = widget.dealText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18)
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('取消', style: TextStyle(fontSize: 14, color: m_colors.content_02_color))),
            Text(getStyleTitle(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: m_colors.title_01_color)),
            TextButton(onPressed: (){
              if (widget.dealText.isNotEmpty) {
                widget.onTap(widget.dealText);
              }
            }, child: Text(getSureTitle(), style: TextStyle(fontSize: 14, color: widget.dealText.length > 0 ? m_colors.backColor : m_colors.content_02_color))),
          ]),
          
          TextView(
            controller: textEditingController,
            maxHeight: 230.px, 
            maxLines: 20,
            maxLength: 256, 
            onChanged: (value) {
            setState(() {
              widget.dealText = value;
            });
          }),
          // Container(
          //   margin: EdgeInsets.all(16.px),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //     Text('${widget.dealText.length}/256')
          //   ]),
          // ),
          SizedBox(height: 20.px,)
        ],
    ));
  }

  String getSureTitle(){
    return widget.style == 1 ? '提交修改': '确认提交';
  }

  String getStyleTitle() {
    return widget.style == 0 ? '输入内容': '修改日报';
  }
}