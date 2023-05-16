import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/extension/double_extension.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import '../../model/DealModel.dart';


class DealList extends StatefulWidget {
  List<DealModel> list;

  DealList({required this.list} );

  @override
  State<DealList> createState() => _DealListState();
}

class _DealListState extends State<DealList> {
  final GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_getWidgetSize);
  }

  void _getWidgetSize(Duration timeStamp) {
    final RenderBox? renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
    final boxHeight = renderBox?.size.height ?? 0;
    final boxWidth = renderBox?.size.width ?? 0.0;
    print('boxWidth: $boxWidth, max:${MediaQuery.of(context).size.width}');
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap:true,//范围内进行包裹（内容多高ListView就多高）
      physics: const NeverScrollableScrollPhysics(),//禁止滚动
      itemCount: widget.list.length,
      itemBuilder: ((context, index) {
        return Container(
          padding: EdgeInsets.all(16.px),
          margin: EdgeInsets.only(bottom: 16.px),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.px),
            border: Border.all(
              width: 1,
              color: m_colors.bordersColor
            ),
            boxShadow: [
              BoxShadow(
                color: m_colors.shadowsColor,
                offset: Offset(0, 3), // 阴影位置 从什么位置开始
                blurRadius: 10, // 阴影模糊层度
                spreadRadius: 0,//阴影模糊大小
              )
            ],
          ),
          child: content(context, widget.list[index]),
        );
      }),
    );
  }

  Widget content(BuildContext context, DealModel item){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget(context,item),
        SizedBox(height: 8.px),
        Text(
          item.companyName ?? '', 
          style: TextStyle(
            fontSize: 13.px, 
            fontWeight: FontWeight.w400, 
            color: m_colors.content_02_color
          )
        ),
        SizedBox(height: 8.px),
        Text('${item.getInfo()}', style: TextStyle(fontSize: 13.px, fontWeight: FontWeight.w400, color: m_colors.content_02_color)),
        SizedBox(height: 8.px),
        Divider(),
        SizedBox(height: 8.px),
        Text(bottomTitle(item), style: TextStyle(fontSize: 13.px, fontWeight: FontWeight.w400, color: m_colors.content_02_color)),
    ]);
  }

  bottomTitle(DealModel item){
    return item.orderStatus == 4 ? '注：服务费由次月10日统一发放.' : '订单号: ${item.orderNo}';
  }

  Widget titleWidget(BuildContext context, DealModel item) {
    return Row(
      key: globalKey,
      children: [
        LimitedBox(
          maxWidth: getMaxWidth(context),
          child: Text(item.companyName ?? '',  
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.w600, 
            color: m_colors.title_01_color
          )
        ),
      ),
      SizedBox(width: 4.px),
      tagWidget(item.orderStatus ?? 0)
      ]
    );
  }

  Widget tagWidget(int orderStatus) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.px, horizontal: 4.px),
      decoration: BoxDecoration(
        color: orderStatusColor(orderStatus).bgColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 4.px,
            height: 4.px,
            decoration: BoxDecoration(
              color: orderStatusColor(orderStatus).titleColor,
              borderRadius: BorderRadius.circular(2)
            ),
          ),
          SizedBox(width: 4.px),
          Text(orderStatusColor(orderStatus).title, 
            style: TextStyle(
              fontSize: 10.px, 
              fontWeight: FontWeight.w400, 
              color: orderStatusColor(orderStatus).titleColor
            )
          ),
        ]
      )
    );
  }

  ColorStyleModel orderStatusColor(int orderStatus){
    ColorStyleModel model = ColorStyleModel();
    switch (orderStatus) {
      case 3:
        model.title = '服务中';
        model.titleColor = Color.fromRGBO(251, 139, 57, 1);
        model.bgColor = Color.fromRGBO(255, 245, 239, 1);
        break;
      case 2: 
        model.title = '待服务';
        model.titleColor = m_colors.content_02_color;
        model.bgColor = Color.fromRGBO(245, 245, 245, 1);
        break;
      case 4:
        model.title = '待结算';
        model.titleColor = m_colors.content_02_color;
        model.bgColor = Color.fromRGBO(245, 245, 245, 1);
        break;
    }
    return model;
  }

  double getMaxWidth(BuildContext context){
    double width = (16 * 2) + (16 * 2) + 50 + 4;
    double maxWidth = BKSizeFit.screenWidth - width.px;

    // final width1 = globalKey.currentContext!.size?.width;
    // final height1 = globalKey.currentContext!.size?.height;

    print('bkWidth: ${BKSizeFit.screenWidth} ---- $width');
    print('maxWidth: $maxWidth, width:$width, px:${width.px}, rpx${width.rpx}');
    return maxWidth;
  }
}


class ColorStyleModel {
  String title = '';
  Color titleColor = Colors.white;
  Color bgColor = Colors.white;
}