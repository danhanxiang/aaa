import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillDetailManager.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillList.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillListService.dart';
import 'package:people_living_flutterdemo/ui/widget/TextSpaceBetween.dart';
import 'package:people_living_flutterdemo/core/extension/double_extension.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class BillDetailWidget extends StatefulWidget {
  final Bill item;
  const BillDetailWidget({ required this.item });

  static const String routeName = '/billDetail';

  @override
  State<BillDetailWidget> createState() => _BillDetailWidgetState();
}

class _BillDetailWidgetState extends State<BillDetailWidget> {
  // late BillDetailModel model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDetail();
  }

  getDetail() {
    EasyLoading.show(status: "请求中...");
    BillListService.requestBillDetail(widget.item.id ?? 0).then((value) {
      EasyLoading.dismiss();
      setState(() {
        // model = value!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '账单明细'),
        body:contentList(context)
    );
  }

  Widget placeholder(BuildContext context) {
    return Center(child: PlaceholderWidget());
  }

  /// 基本信息
  Widget infoWidget(BuildContext context, BillDetailModel model) {
    return Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
            child: Column(
              children: [
                TextSpaceBetween(title: '结算周期', detail: '${model.getTimeStartAndEnd}'),
                SizedBox(height: 24),
                TextSpaceBetween(title: '发放日期', detail: '${model.timeStart}'),
                SizedBox(height: 24),
                TextSpaceBetween(title: '发放金额', detail: '¥${model.actualMoney.moneyFormat}'),
                SizedBox(height: 24),
                TextSpaceBetween(title: '代缴个税', detail: '¥${model.personalTax.moneyFormat}'),
                SizedBox(height: 24),
                TextSpaceBetween(title: '服务订单', detail: '${model.orderCounts}'),
              ],
          )
      );
  }

  /// orders 订单cell
  Widget orderCellWidget(BuildContext context, BillOrders model) {
    return Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
            child: Column(
              children: [
                TextSpaceBetween(title: '订单号', detail: '${model.orderNo}'),
                SizedBox(height: 20),
                TextSpaceBetween(title: '实际服务期', detail: '${model.serviceDays}'),
                SizedBox(height: 20),
                TextSpaceBetween(title: '结算天数', detail: '${model.days}个工作日'),
                SizedBox(height: 20),
                TextSpaceBetween(title: '预算结算', detail: '¥${model.totalAmount.moneyFormat}'),
                SizedBox(height: 20),
                TextSpaceBetween(title: '调整金额', detail: '+¥${model.refundMoney.moneyFormat}'),
                SizedBox(height: 20),
                TextSpaceBetween(title: '调整原因', detail: '${model.refundReason}'),
                SizedBox(height: 20),
                TextSpaceBetween(title: '实际结算', detail: '¥${model.actualMoney.moneyFormat}'),
              ],
          )
      );
  }

  Widget lineWidget(BuildContext context) {
    return Column(
      children: [
        Visibility(
                  visible: true,
                  child: Container(
                    color: m_colors.back_01_color, height: 8
                    )
                ),
      ],
    );
  }


  Widget contentList(BuildContext context) {
    return FutureBuilder(
      future: BillListService.requestBillDetail(widget.item.id ?? 0),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) return const Center(child: PlaceholderWidget());
          if (snapshot.error != null) return const Center(child: Text('请求失败'));
          final BillDetailModel model = snapshot.data as BillDetailModel;
          final List<BillOrders> orders = model.orders; 
          return  ListView.builder(
            itemCount: model.orders.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ? 
                infoWidget(context, model)
                :
                Column(
                  children: [
                    Visibility(
                      visible: true,
                      child: Container(
                        color: m_colors.back_01_color, height: 8
                    )
                ),
                orderCellWidget(context, orders[index - 1])
                  ],
                );
          });
      }));
  }
}