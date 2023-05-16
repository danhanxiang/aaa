import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/model/InterViewManger.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/model/OneDayModel.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/viewModel/viewModel.dart';
import '../../../../../core/components/m_AppBar.dart';
import '../../../../../core/components/placeholderWidget.dart';
import '../../personal_historicalOrders/personal_historicalOrders.dart';
import 'InterviewDetail.dart';

class InterViewSetting extends StatefulWidget {
  // 命名路由
  static const String routeName = '/InterViewSetting';

  @override
  State<InterViewSetting> createState() => _interViewSettingState();
}

class _interViewSettingState extends State<InterViewSetting> {
  late EasyRefreshController _controller;

  final InterViewSettingViewModel vm = InterViewSettingViewModel();
  List<InterModel> interviewList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EasyRefreshController();
    getTwoWeekList();
    requestSelectDayList(vm.sltDateString);
  }

  void getTwoWeekList(){
    EasyLoading.show(status: "请求中...");
    InterViewSettingService.requestMonthDayList().then((value) {
      EasyLoading.dismiss();
      setState(() {
        vm.dateStatusList.addAll(value);
      }); 
    });
  }

  void requestSelectDayList(String dateString) {
    EasyLoading.show(status: "请求中...");
    InterViewSettingService.getInterviewList(dateString).then((value) {
      EasyLoading.dismiss();
      vm.interviewList.clear();
      setState(() {
        vm.interviewList.addAll(value);
      }); 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, '面试管理', color: Colors.white),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(vm.today, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: m_colors.title_01_color)),
                  ],
                ),
                // currentMonth(context),
                SizedBox(height: 18,),
                 dayGridView(context, vm.weekList.length + vm.dateStatusList.length, vm.dateStatusList),
                 SizedBox(height: 24),
                 refreshWidget(context)
              ],
            ),
        ),
    );
  }


  /// 当日下的当月
  Widget currentMonth(BuildContext context) {
     return FutureBuilder<List<DayModel>>(
        future: InterViewSettingService.requestMonthDayList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: PlaceholderWidget());
          if (snapshot.error != null) return Center(child: Text('请求失败'));
          final List<DayModel> itemList = snapshot.data as List<DayModel>;
          vm.dateStatusList = itemList;
          // 获取今天在数组里的索引
          return dayGridView(context, vm.weekList.length + itemList.length, itemList);
        });
  }

  Widget dayGridView(BuildContext context, int count, List<DayModel> itemList) {
    return GridView.builder(
          // 禁止滚动
          physics: NeverScrollableScrollPhysics(),
          // 若外部没有设置高度，则会产生此报 使用Expanded 
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: vm.weekList.length,
            crossAxisSpacing: vm.crossAxisSpacing,
            mainAxisSpacing: vm.mainAxisSpacing
          ),
          itemCount: count,
          itemBuilder: ((context, index) {
                  // 日 一 二··· 六
                  if (index < vm.weekList.length) {
                    return itemWithCell(context, vm.weekList[index], index, false);
                  }

                  String day = vm.futterString(itemList, index);
                  return GestureDetector(
                    onTap: (){
                      if (vm.selectIndex == index) { return;}
                      String date = vm.selectDateString(itemList,index);
                      setState(() {
                        vm.selectIndex = index;
                      });
                      requestSelectDayList(date);
                    },
                    child: itemWithCell(context, day, index, true)
                  );
                }
            ));
  }
  
  Widget itemWithCell(BuildContext context, String day, int index, bool isday) {
    return Container(
        alignment: Alignment.center,
        height: 26,
        decoration: isday ?  vm.isCurrentDay(day, index) ? BoxDecoration(
           borderRadius: BorderRadius.circular(4),
           color: Color.fromRGBO(244, 244, 255, 1)) : null : null,
           child: Text(isday ? '${day.toDay}' : '$day', 
           style: TextStyle(
            color: isday ? vm.isCurrentDay(day, index) ? m_colors.title_01_color : m_colors.content_02_color : m_colors.content_02_color, 
            fontWeight: FontWeight.w600, 
            fontSize: 13))
    );
  }


  Widget refreshWidget(BuildContext context) {
    return Expanded(
      child: EasyRefresh(
        enableControlFinishLoad: false,
        enableControlFinishRefresh: false,
        controller: _controller,
            // onLoad: () async{
            //   print('加载更多');
            //   getHistoryList();
            // },
            // onRefresh: () async{
            //   await Future.delayed(Duration(seconds: 0), () {
            //     // 结束加载
            //     vm.getHistoryList();
            //   });
            // },
         child: content(context)
        ),
    );
  }

  Widget content(BuildContext context) {
      if (vm.interviewList.isEmpty) {
        return PlaceholderWidget();
      }else {
        return listCell(context);
      }
  }

  Widget listCell(BuildContext context) {
    return ListView.builder(
      itemCount: vm.interviewList.length,
      itemBuilder: (BuildContext context, int index) {
                  // return OrderItemWidget(vm.list[index], key: ObjectKey(index));
                  // return orderItemWidget(list[index]);
            return cell(context, vm.interviewList[index]);
      },
    );
  }


  Widget cell(BuildContext context, InterModel item) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 14, 16, 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(120, 148, 248, 0.08),
              offset: Offset(0, 3), // 阴影位置 从什么位置开始
              blurRadius: 10, // 阴影模糊层度
              spreadRadius: 0,//阴影模糊大小
            )
          ],
          borderRadius: BorderRadius.circular(8),
          color: Colors.white
          ),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child:
                    Text('${item.positionName}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ),
                SizedBox(width: 8),

                Text(item.payToMonth(), style: TextStyle(fontWeight: FontWeight.w600, fontSize:15, color: m_colors.backColor)),
              ]),
              SizedBox(height: 8),
              Text('${item.companyName}',style: TextStyle(fontWeight: FontWeight.w400, fontSize:13, color: m_colors.content_02_color)),
              SizedBox(height: 6),
              
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.getinterviewdateline(), style: TextStyle(fontWeight: FontWeight.w400, fontSize:13, color: m_colors.content_02_color)),

                  FloatingActionButton.extended(
                    onPressed: (){
                      Navigator.of(context).pushNamed(InterviewDetail.routeName, arguments: item.id);
                    }, 
                    label: Text('面试详情', style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),))
              ])
            ],
           )
    );
  }
}