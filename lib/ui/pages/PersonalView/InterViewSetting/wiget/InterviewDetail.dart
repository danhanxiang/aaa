import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/ui/widget/TextSpaceBetween.dart';

import '../../../../shared/app_size_fit.dart';
import '../../../../widget/DashLine.dart';
import '../http/InterviewDetailService.dart';
import '../model/InterViewDetail.dart';

class InterviewDetail extends StatefulWidget {
  int interId;
  InterviewDetail({Key? key, this.interId = 0}) : super(key: key);

  static const String routeName = '/interviewDetail';

  @override
  State<InterviewDetail> createState() => _InterviewDetailState();
}

class _InterviewDetailState extends State<InterviewDetail> {
  late InterViewDetail model = InterViewDetail();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 请求接口
    getInterDetail();
  }

  void getInterDetail() {
    EasyLoading.show(status: "请求中...");
    InterviewDetailService.getInterDetail(widget.interId, (object) {
      EasyLoading.dismiss();
      setState(() {
        model = object.data;
      });
    });
  }

  bool isUrlEmpty() {
    String url = model.meetingUrl ?? '';
    return url.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: m_AppBar(context, '查看面试'),
        body: EasyRefresh
        (
          enableControlFinishRefresh: true,
          enableControlFinishLoad: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: m_colors.back_01_color,
              borderRadius: BorderRadiusDirectional.circular(18)
            ),
              child: Column(
                children: [
                  topWidget(context),
                  _detailWidget(context),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget topWidget(BuildContext context) { 
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          width: BKSizeFit.screenWidth! - 16 * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(18),
            gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromRGBO(117, 131, 255, 1),
              Color.fromRGBO(20, 43, 254, 1)
            ], 
            tileMode: TileMode.mirror,
          ),
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.companyName ?? '', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white)),
              SizedBox(height: 4),
              Text(model.positionName ?? '', style: TextStyle(fontSize: 12, color: Colors.white)),
              SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal:12),
                decoration: BoxDecoration(
                  color: m_colors.backColor,
                  borderRadius: BorderRadiusDirectional.circular(18),
                ),
                child: Text(model.workDaysModeName ?? '', style: TextStyle(fontSize: 12, color: Colors.white)))
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 13,
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              "assets/images/building.png",
              width: 100,height: 100,
        ),))
      ],
    );
  }

  Widget _detailWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextSpaceBetween(title: '面试方式', detail: model.interviewWayName ?? ''),
          const SizedBox(height: 16),
          TextSpaceBetween(title: '面试时间', detail: model.interviewStartDate ?? ''),
          const SizedBox(height: 16),
          TextSpaceBetween(title: '会议ID', detail: model.meetingCode ?? ''),

          Visibility(
            visible: isUrlEmpty(),
            child: _bottomWidget(context))
        ],
      ),
    );
  }
  
  Widget _bottomWidget(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _dashLine(),
        const SizedBox(height: 16),
        const Text('会议链接入会', style: TextStyle(fontSize: 12, color: m_colors.content_02_color)),
        const SizedBox(height: 8),
        
        GestureDetector(
          child: Text(model.meetingUrl ?? '', style: const TextStyle(fontSize: 12, color: m_colors.backColor)),
          onTap: () {
            print(model.meetingUrl);
          },
        ),
      ],
    );
  }

   // 分割虚线
  Widget _dashLine() {
    return Container(
      height: 1,
      child: DashLine(
        color: Colors.white,
        height: 2,
        dashWidth: 4,
      ),
      
    );
  }
}