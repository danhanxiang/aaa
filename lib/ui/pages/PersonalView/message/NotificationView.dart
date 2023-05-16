import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/InterViewSetting/wiget/InterviewDetail.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/message/NotificationManager.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/message/NotificationService.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_updateUserinfo.dart';
import 'package:people_living_flutterdemo/ui/pages/main/Tabs.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';

class NotificationView extends StatefulWidget {
  static const String routeName = '/notificationView';
  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  int _page = 1;
  bool isMore = false;
  NotificationManager _model = NotificationManager();
  List<NotificationModel> dataList = [];
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
        return NotificationCell(_model.list![index]);
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
    NotificationService.getMessageList(_page, 20, (object) {
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
            List<NotificationModel> list = object.data.list;
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
class NotificationCell extends StatefulWidget {
  final NotificationModel model;

  const NotificationCell(this.model,{Key? key}) : super(key: key);

  @override
  State<NotificationCell> createState() => _NotificationCellState();
}

class _NotificationCellState extends State<NotificationCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.model.createTime ?? '', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: m_colors.content_02_color),),
            SizedBox(height: 16,),
            Text(widget.model.messageStr ?? '', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: m_colors.content_01_color)),
            
            Visibility(
              visible: widget.model.messageTypeTitle.isNotEmpty,
              child: bottom())
        ]),
      ),
      onTap: () {
        switch (widget.model.messageType) {
          case 2:
          if (widget.model.typeId != null) {
            pushInterDetail(widget.model.typeId!);
          }
            break;
          case 3:
          if (widget.model.typeId != null) {
            pushInterDetail(widget.model.typeId!);
          }
            break;
          case 5:
          Navigator.of(context).popAndPushNamed(Tabs.routeName);
            // Navigator.of(context).pushAndRemoveUntil(
            //   MaterialPageRoute(builder: (_) => B页面()),
            //   (Route<dynamic> route) {
            //   //返回的事false的都会被从路由队列里面清除掉
            //   return route.isFirst;
            // });
            // Navigator.popUntil(context, (route) => false);
            // Navigator.popUntil(context, ModalRoute.withName(Tabs.routeName));

            break;
          case 6:
            // 入驻资料
            Navigator.of(context).popAndPushNamed(CretaeUserInfoView.routeName);
            break;
          default:
        }
      },
    );
  }

  Widget bottom() {
    return Column(
      children: [
        SizedBox(height: 16,),
        Divider(height: 1,),
        SizedBox(height: 16,),
        Container(
          child: Row(children: [
            Text(widget.model.messageTypeTitle, style: TextStyle(color: m_colors.content_02_color, fontSize: 13, fontWeight: FontWeight.w400)),              SizedBox(width: 8),
            Image.asset('arrow_icon'.png, width: 14, height: 8,)
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