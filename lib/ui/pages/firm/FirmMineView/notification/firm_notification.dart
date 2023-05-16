import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/wiget/InterviewDetail.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/message/NotificationManager.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/message/NotificationService.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/notification/widget/firm_InterDetailView.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';

class firm_notification extends StatefulWidget {
  static const String routeName = '/firm_notification';
  @override
  State<firm_notification> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<firm_notification> {
  int _page = 1;
  bool isMore = false;
  CompNotificationManager _model = CompNotificationManager();
  List<CompNotification> dataList = [];
  EasyRefreshController _controller = EasyRefreshController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '消息'),
        backgroundColor: m_colors.listColor,
        body: contentWidget(context)
    );
  }

  Widget content(BuildContext context) {
      if (_model.list?.isEmpty ?? true) {
        return const PlaceholderWidget();
      }else {
        return listCell(context);
      }
  }

  Widget listCell(BuildContext context) {
    return ListView.builder(
      itemCount: _model.list?.length,
      itemBuilder: (BuildContext context, int index) {
        return CompNotificationCell(_model.list![index]);
      },
    );
  }

  Widget contentWidget(BuildContext context) {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      header: BKRefresh.addRefreshHeader(),
      controller: _controller,
      child: content(context),
      onRefresh: () async{  
        await Future.delayed(const Duration(seconds: 1), () {
          // 结束加载
          _page = 1;
          getList();
        });
      },
      onLoad: isMore ? () async {
        print('加载更多');
        _page += 1;
        getList(isRefresh: false);
      } : null,
    );
  }

  /// 请求接口
  getList({isRefresh: true}){
    EasyLoading();
    NotificationService.getCompanyMessageList(_page, 20, (object) {
      EasyLoading.dismiss;
      if (isRefresh){ 
        _controller.finishRefresh();
      }else {
        _controller.finishLoad();
      }
      if(object.code == 200) {
        if (object.data.list != null){
          isMore = object.data.list.length >= 20;
        }
        
        setState(() {
          if (isRefresh) {
            _model = object.data;
          }else {
            List<CompNotification> list = object.data.list;
            if (_model.list != null && list.length > 0) {
              _model.list!.addAll(list);
            }
          }
        });
      }
    });
  }
}


/// 消息列表cell
class CompNotificationCell extends StatefulWidget {
  final CompNotification model;

  const CompNotificationCell(this.model,{Key? key}) : super(key: key);

  @override
  State<CompNotificationCell> createState() => _NotificationCellState();
}

class _NotificationCellState extends State<CompNotificationCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(16.px),
        padding: EdgeInsets.all(16.px),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.px),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.model.createTime ?? '', 
              style: TextStyle(
                fontSize: 13.px, 
                fontWeight: FontWeight.w400, 
                color: m_colors.content_02_color
              )
            ),
            SizedBox(height: 16.px),
            Text(
              widget.model.messageStr ?? '', 
              style: TextStyle(
                fontSize: 13.px, 
                fontWeight: FontWeight.w600, 
                color: m_colors.content_01_color
              )
            ),
            
            Visibility(
              visible: widget.model.messageTypeTitle.isNotEmpty,
              child: bottom()
            )
        ]),
      ),
      onTap: () {
        switch (widget.model.messageType) {
          case 7:
          /// 面试详情
          Navigator.of(context).pushNamed(firm_InterDetailView.routeName, arguments: widget.model.typeId);
          break;
          default:
        }
      },
    );
  }

  Widget bottom() {
    return Column(
      children: [
        SizedBox(height: 16.px),
        Divider(height: 1),
        SizedBox(height: 16.px),
        Container(
          child: Row(children: [
            Text(widget.model.messageTypeTitle, 
            style: TextStyle(
              color: m_colors.content_02_color, 
              fontSize: 13.px, 
              fontWeight: FontWeight.w400)
            ),              
            SizedBox(width: 8.px),
            Image.asset('arrow_icon'.png, width: 14.px, height: 8.px,)
            ],),
          )
      ],
    );
  }


  /// 进入面试详情
  pushInterDetail(int typeId){
    Navigator.of(context).pushNamed(InterviewDetail.routeName, arguments: typeId);
  }
}