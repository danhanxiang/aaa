import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillDetailWidget.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillList.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/BillList/BillListService.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/TextSpaceBetween.dart';
import 'package:people_living_flutterdemo/core/extension/double_extension.dart';

class BillListWidget extends StatefulWidget {
  BillListWidget({Key? key}) : super(key: key);

  static const String routeName = '/billList';

  @override
  State<BillListWidget> createState() => _BillListWidgetState();
}

class _BillListWidgetState extends State<BillListWidget> {
  late List<Bill> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getBillList();
  }

  void getBillList() {
    EasyLoading.show(status: "请求中...");
    BillListService.requestBillList().then((value) {
      setState(() {
        list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '收益账单'),
        body: contentList(context),
    );
  }

  Widget contentList(BuildContext context) {
    return FutureBuilder(
      future: BillListService.requestBillList(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) return const Center(child: PlaceholderWidget());
          if (snapshot.error != null) return const Center(child: Text('请求失败'));
          final List<Bill> itemList = snapshot.data as List<Bill>;
          return ListView.builder(
            itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    child: Column(
                      children: [
                        Visibility(
                          visible: index != 0,
                          child: Container(
                            color: m_colors.back_01_color,height: 8
                          )
                        ),
                        cell(context, itemList[index])
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(BillDetailWidget.routeName, arguments: itemList[index]);
                  },
                );
              },
        );
      })
    );
  }

  Widget cell(BuildContext context, Bill item) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          topView(context, '${item.createDate?.yearMonthDay}'),
          Divider(height: 1),

          content(context,item)
        ],
      ),
    );
  }

  Widget topView(BuildContext context, String title) {
    return Container(
      width: BKSizeFit.screenWidth,
      height: 56,
      child: Row(
        children: [
          Image.asset('assets/images/clock.png', width: 20, height: 20),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: m_colors.title_01_color),)
        ],
      ),
    );
  }

  Widget content(BuildContext context, Bill item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          TextSpaceBetween(title: '服务费', detail: '¥${item.serviceMoney.moneyFormat}'),
          SizedBox(height: 24),
          TextSpaceBetween(title: '调整费用', detail: '¥${item.deductMoney.moneyFormat}'),
          SizedBox(height: 24),
          TextSpaceBetween(title: '个税', detail:  '¥${item.personalTax.moneyFormat}'),
          SizedBox(height: 24),
          TextSpaceBetween(title: '实际发放', detail:  '¥${item.actualMoney.moneyFormat}'),
          SizedBox(height: 24),
          TextSpaceBetween(title: '发放日期', detail: '${item.grantDate}'),
        ],
      ),
    );
  }
}