import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/historcalOrderModel.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/historcalOrderService.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import '../../../../core/extension/int_extension.dart';

class HistoricalOrders extends StatefulWidget {
  HistoricalOrders({Key? key, this.title = ''}) : super(key: key);
  final String title;

  // 命名路由
  static const String routeName = '/historicalOrders';
  
  @override
  State<HistoricalOrders> createState() => _HistoricalOrdersState();
}

class _HistoricalOrdersState extends State<HistoricalOrders> {
  late EasyRefreshController _controller;

  List<HistorcalOrderModel> list = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    // 获取订单接口
    _controller = EasyRefreshController();
    getHistoryList();
  }

  Widget build(BuildContext context) {
    /// 这个只有在routes里有才能执行
    // final args = ModalRoute.of(context)!.settings.arguments as String;
    // print("-111--:$args");
    print(widget.title);
    return Scaffold(
      appBar: m_AppBar(context, "历史订单"),
      // 修改主题颜色
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            secondary: Colors.blue[300]
          )
        ),
        child: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              list.removeAt(0);
            });
          },
        )
      ),
      body: refreshWidget(context)
      // body: Center(
      //   child: Text('11: ${widget.title}'),
      // ),
    );
  }

  Widget refreshWidget(BuildContext context) {
    return EasyRefresh(
        enableControlFinishLoad: false,
        enableControlFinishRefresh: false,
        controller: _controller,
        // onLoad: () async{
        //   print('加载更多');
        //   getHistoryList();
        // },
        onRefresh: () async{
          await Future.delayed(Duration(seconds: 0), () {
            // 结束加载
            getHistoryList();
          });
        },
        child: content(context)
      );
  }

  Widget content(BuildContext context) {
      if (list.isEmpty) {
        return PlaceholderWidget();
      }else {
        return listCell(context);
      }
  }

  Widget listCell(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return OrderItemWidget(list[index], key: ObjectKey(index),);
              // return orderItemWidget(list[index]);
            },
      );
    // return ListView(
    //       children: list.map((item) => OrderItemWidget(item, key: ValueKey(item.companyName),)).toList()
    // );
  }

  void getHistoryList({bool isMore = false}) {
    EasyLoading.show(status: "请求中...");
    HistorcalOrderService.requestHistoryList().then((value){
      EasyLoading.dismiss();
      setState(() {
          if (!isMore) {
            list.clear();
          }
            list.addAll(value);
        });
        _controller.finishRefresh();
    });
    
    // HistorcalOrderService.GetHistoryList((object) {
    //   EasyLoading.dismiss();
    //   if (object.isSuccess) {
    //     setState(() {
    //       HistorcalOrder_model_list historcalOrderModel = object.data;
    //       if (!isMore) {
    //         list.clear();
    //       }
    //         list.addAll(historcalOrderModel.data!);
    //     });
    //   } else {
    //     EasyLoading.showToast(object.message ?? '请求错误！');
    //   }
    //   _controller.finishRefresh();
    // });
  }
}

Widget orderItemWidget(HistorcalOrderModel item) {
  return Container(
    color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
    // decoration: BoxDecoration(
    //   // color: Colors.red,
    //   borderRadius: BorderRadius.circular(10),
    //   border: Border.all(
    //     color: m_colors.divider_02_color,
    //     width: 1.0,
    //       style: BorderStyle.solid
    //   ),
    // ),
    padding: EdgeInsets.only(top: 10.px,left: 15.px, right: 15.px, bottom: 10.px),
    margin: EdgeInsets.all(10.px),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${item.positionName}', style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600
        )),
        SizedBox(height: BKSizeFit.setRpx(20)),
        Text('${item.companyName} ', style: TextStyle(color: m_colors.content_02_color, fontSize: 13),),
        Text('${item.dateLine}', style: TextStyle(color: m_colors.content_02_color, fontSize: 13),),
        SizedBox(height: 10),
        Divider(height: 1, color: m_colors.divider_02_color),
        SizedBox(height: 10),
        Text("订单号: ${item.orderNo}",style: TextStyle(color: m_colors.content_02_color, fontSize: 13),),
  ],
    ),
  );
}



class OrderItemListView extends StatelessWidget {
    static const String routeName = '/historicalOrders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "历史订单"),
      body: FutureBuilder<List<HistorcalOrderModel>>(
        future: HistorcalOrderService.requestHistoryList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: PlaceholderWidget());
          if (snapshot.error != null) return Center(child: Text('请求失败'));
          final List<HistorcalOrderModel> itemList = snapshot.data as List<HistorcalOrderModel>;
          return ListView.builder(
            itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderItemWidget(itemList[index], key: ObjectKey(index),);
                // return orderItemWidget(list[index]);
              },
        );
        }),
    );
  }
}

class OrderItemWidget extends StatefulWidget {
  final HistorcalOrderModel item;
  OrderItemWidget(this.item ,{Key? key}) : super(key: key);
  
  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
    // color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
    decoration: BoxDecoration(
      // color: Colors.red,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: m_colors.divider_02_color,
        width: 1.0,
          style: BorderStyle.solid
      ),
    ),
    padding: EdgeInsets.only(top: 10,left: 15,right: 15, bottom: 10),
    margin: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${widget.item.positionName}', style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600
        )),
        SizedBox(height: 10),
        Text('${widget.item.companyName} ', style: TextStyle(color: m_colors.content_02_color, fontSize: 13),),
        Text('${widget.item.dateLine}', style: TextStyle(color: m_colors.content_02_color, fontSize: 13),),
        SizedBox(height: 10),
        Divider(height: 1, color: m_colors.divider_02_color),
        SizedBox(height: 10),
        Text("订单号: ${widget.item.orderNo}",style: TextStyle(color: m_colors.content_02_color, fontSize: 13),),
  ],
    ),
  );
  }
}