import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/position_api/position_api.dart';
import 'package:people_living_flutterdemo/ui/widget/common_tag.dart';


class positionDetail extends StatefulWidget {
  static const String routeName = '/position_detail';
  positionDetail({Key? key, required this.developerId}) : super(key: key);
  String developerId;
  @override
  State<positionDetail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<positionDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPositionDeatil(widget.developerId);
  }



  @override
  Widget build(BuildContext context) {
    List list = [
      'java',
      'koltin',
      'flutter',
      '中级',
      'react',
      'android studio',
      'rxjava'
    ];
    return Scaffold(
      appBar: m_AppBar(context, "职位详情"),
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              positionItemListWidget(),
              Wrap(
                children: list
                    .map((item) =>
                    Container(
                      child: PositionTag(item),
                    ))
                    .toList(),
              ),
              SizedBox(
                height: 10,
                child: Container(
                  color: Colors.green,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '教育经历',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                height: 40,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return educationWidget();
                },
              ),
              Divider(),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '工作经历',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                height: 40,
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return careerWidget();
                },
              ),
              Divider(),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '项目经历',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                height: 40,
              ),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return workWidget();
                },
              ),
            ],
          )),
    );
  }

  void getPositionDeatil(String developerId) {
    PositionService.getPositionDetails(developerId, (object) {
      if (object.isSuccess) {
        setState(() {
          print(object.data);
        });
      }
    });
  }


  Widget positionItemListWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ClipRRect(
                  child: Image.network(''),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                            "dad",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(width: 16),
                      Text(
                        "100/k",
                        style: const TextStyle(
                            color: m_colors.backColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '工作经验',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),

                  // ProjectItemsView(titleList: getTag(data.skillName)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//教育经历列表
  Widget educationWidget() {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'xxx学院',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '2020-10-9',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            '本科-选日志-计算机专业',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

//工作经历列表
  Widget careerWidget() {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'xxx公司',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '2020-10-9',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            '软件开发-java',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

//项目经理列表
  Widget workWidget() {
    List list = [
      'java',
      'koltin',
      'flutter',
      '中级',
      'react',
      'android studio',
      'rxjava'
    ];
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'xxxx 项目开发',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '2020-10-9',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            'Java开发',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            '开发介绍开发介绍开发介绍开发介绍开发介绍开发介绍开发介绍开发介绍开发介绍开发介绍',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Wrap(
            children: list
                .map((item) =>
                Container(
                  child: PositionTag(item),
                ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

