import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/https/DealService.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/model/DealListModel.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/Dealing/WriteDailyReport.dart';
import 'package:people_living_flutterdemo/ui/shared/app_size_fit.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';

class HistoryDailyView extends StatefulWidget {
  static const String routeName = '/historyDailyView';
  /// 订单id
  int orderId;

  HistoryDailyView({Key? key, required this.orderId}) : super(key: key);

  @override
  State<HistoryDailyView> createState() => _HistoryDailyViewState();
}

class _HistoryDailyViewState extends State<HistoryDailyView> {
  List<DealListModel> list = [];
  EasyRefreshController _controller = EasyRefreshController();
  bool _isMore = false;
  int _pageNum = 1;
  int _pageSize = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistoryDailyList();
  }

  /// 历史日报接口
  getHistoryDailyList({bool isMore = false}){
    EasyLoading();
    _pageNum = isMore ? _pageNum + 1 : 1;
    DealService.getHistoryDailyList(widget.orderId, _pageNum, _pageSize, (object) {
      EasyLoading.dismiss;
      if (!isMore){ 
        _controller.finishRefresh();
        list.clear();
      }else {
        _controller.finishLoad();
      }

      if (object.isSuccess) {
        if (object.data != null){
          _isMore = object.data.length >= _pageSize;
        }
        setState(() {
          list.addAll(object.data);
        });
      }else {
        EasyLoading.showError(object.message ?? '');
        int page = _pageNum - 1;
        _pageNum = page < 0 ? 0 : page;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,// m_colors.listColor,
      appBar: m_AppBar(context, '历史日报'),
      body: EasyRefresh(
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        header: BKRefresh.addRefreshHeader(),
        controller: _controller,
        child: content(),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 0), () {
            getHistoryDailyList();
          });
        },
        onLoad: _isMore ? () async {
          await Future.delayed(const Duration(seconds: 0), () {
            getHistoryDailyList(isMore: true);
          });
        } : null
      )
    );
  }

  Widget cell(DealListModel model){
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.fromLTRB(16.px, 18.px, 16.px, 16.px),
      child: Column(
        children: [
        Row(
          children: [
          Image.asset('clock'.png, width: 20.px, height: 20.px),
          SizedBox(width: 10.px),
          Text('${model.dateOf}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.px),)
        ]),
        SizedBox(height: 10.px),
        const Divider(),
        WriteDailyReport(model: model),
      ]),
    );
  }

  Widget _myCell(int index){
    return Column(
          children: [
            cell(list[index]),
            Visibility(
              visible: index != list.length - 1,
              child: Container(color: m_colors.listColor, height: 8.px)
            )
          ],
        );
  }

  Widget dailyListView(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            cell(list[index]),
            Visibility(
              visible: index != list.length - 1,
              child: Container(color: m_colors.listColor, height: 8.px)
            )
          ],
        );
      }
    ); 
  }

  Widget content(){
    return list.isEmpty ? 
    PlaceholderWidget(title: '暂无数据') :
    SingleChildScrollView(
      child: dailyListView(),
    );
  }
}