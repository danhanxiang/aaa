import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/model/DealListModel.dart';
import 'package:people_living_flutterdemo/core/extension/double_extension.dart';
import 'package:people_living_flutterdemo/ui/widget/LeftSlideActions.dart';


class WriteDailyReport extends StatelessWidget {
  /** 
   * style: 0.创建日报 1.修改日报 2.删除日报
   * styleId 日报类型:  1 已完成日报 2 进行中 3 明日计划 4 需要的帮助
   * text: 日报内容
   * dealId: 日报id 删除修改需要
  */
  Function(int style ,int? styleId, String? text, int dealId)? onTap;
  // 日报数据模型
  final DealListModel? model;

  WriteDailyReport({Key? key, this.model, this.onTap,}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        writeCell(0),
        writeCell(1),
        writeCell(2),
        writeCell(3)
    ]);
  }

  Widget writeCell(int styleId){
    String title = '';
    String iconName = '';
    
    List<Deal> dealList = [];

    switch(styleId) {
      case 0: 
      title = '已完成';
      iconName = 'daily_fish';
      if (model != null) {
        dealList = model!.done ?? [];
      }
      break;

      case 1: 
      title = '进行中';
      iconName = 'daily_doing';
      if (model != null) {
        dealList = model!.running ?? [];
      }
      break;

      case 2: 
      title = '明日计划';
      iconName = 'daily_tormorrow';
      if (model != null) {
        dealList = model!.future ?? [];
      }
      break;

      case 3: 
      title = '需要的帮助';
      iconName = 'daily_help';
      if (model != null) {
        dealList = model!.help ?? [];
      }
      break;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.px),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            section(iconName, title, styleId),
            dailyList(dealList, styleId)
          ],
        ),
    );
  }

  Widget section(String iconName, String title, int styleId){
    return GestureDetector(
      child: Row(
        children: [
          Image.asset(iconName.png, width: 24.px, height: 24.px,),
          SizedBox(width: 8.px),
          Expanded(child: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.px, color: m_colors.content_01_color))),
          Visibility(
            visible: onTap != null,
            child: Image.asset('daily_add'.png, width: 24.px, height: 24.px)
          )
        ],
      ),
      onTap: () {
        // 点击写日报
        if (onTap != null){
          onTap!(0,styleId, '', 0);
        }
      },
    );
  }

  Widget dailyList(List<Deal> dealList, int styleId){
    return Container(
      margin: EdgeInsets.only(top: dealList.length > 0 ? 16: 0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dealList.length,
        itemBuilder: ((context, index) {
          return onTap != null ?
          animationCell(index, dealList[index], dealList.length, styleId) :
          dealCell(index, dealList[index], dealList.length, styleId);
        }),
      ),
    );
  }

  /// 可以左滑动
  Widget animationCell(int index, Deal model, int length, int styleId) {
    return LeftSlideActions(
      key: Key('$index'),
      actionsWidth: 60,
      actions: [
        _buildDeleteBtn(index, model.id ?? 0),
      ],
      child: dealCell(index, model, length, styleId),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ); 
  }

  /// cell
  Widget dealCell(int index, Deal model, int length, int styleId){
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: isLastNum(index, length)),
        decoration: BoxDecoration(
          color: m_colors.listColor,
          borderRadius: BorderRadius.circular(4)
        ),
        padding: EdgeInsets.all(16.px),
        child: Text(model.item ?? '', style: TextStyle(fontSize: 13.px, fontWeight: FontWeight.bold),)
      ),
      onTap: () {
        if (onTap != null) {
          onTap!(1, styleId, model.item ?? '', model.id ?? 0);
        }
      },
    );
  }

  double isLastNum(int index,  int length){
    return index + 1 == length ? 0 : 10.px;
  }

  Widget _buildDeleteBtn(final int index, int orderSchedule) {
    return GestureDetector(
      onTap: () {
        print('删除');
        // 省略: 弹出是否删除的确认对话框。
        if (onTap != null){
          onTap!(2, 0 ,'', orderSchedule);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.red,
        ),
        alignment: Alignment.center,
        child: Icon(Icons.delete, color: Colors.white,),
      ),
    );
  }
}