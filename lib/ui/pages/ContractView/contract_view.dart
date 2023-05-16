import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/models/index.dart';
import 'package:people_living_flutterdemo/core/service/position_api/position_api.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';

import '../../widget/common_tag.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';


class positionView extends StatefulWidget {
  const positionView({Key? key}) : super(key: key);
  static const String routeName = '/contract';
  @override
  State<positionView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<positionView> {
  late EasyRefreshController _controller;

  List<Position_item> list = [];
  var pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    getPositionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('职位推荐', style: TextStyle(color: m_colors.title_01_color)),
          backgroundColor: Colors.white,
          elevation: 0, //去除阴影
        ),
        // body: listRow()
        body: EasyRefresh(
          // 是否开启控制结束加载
          enableControlFinishLoad: false,
          enableControlFinishRefresh: false,
          // 控制器
          controller: _controller,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 0), () {
              // 结束加载
              getPositionList();
              // _controller.finishRefresh();
            });
          },
          // 上拉加载事件回调
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              // 结束加载
              // _controller.finishLoad();
               pageNum++;
              getPositionList(isMore: true);

            });
          },
          header: ClassicalHeader(textColor: Colors.grey, refreshText: "加载"),
          // 自定义顶部上啦加载
          footer: ClassicalFooter(
            bgColor: Colors.white,
            //  更多信息文字颜色
            infoColor: Colors.grey,
            // 字体颜色
            textColor: Colors.black,
            // 加载失败时显示的文字
            loadText: "加载失败",
            // 没有更多时显示的文字
            noMoreText: 'moMore',
            // 是否显示提示信息
            showInfo: false,
            // 正在加载时的文字
            loadingText: "正在加载中",
            // 准备加载时显示的文字
            loadReadyText: "准备加载",
            // 加载完成显示的文字
            loadedText: "加载完成",
          ),
          // child: listRow(),
          child: ListView(
            children: list
                .map((item) => positionItemListWidget(context, item))
                .toList(),
          ),
        ));
  }

  //获取首页职位推荐列表
  void getPositionList({bool isMore = false}) {
    PositionService.getPositionList((object) {
      if (object.isSuccess) {
        setState(() {
          Position_item_list position_model = object.data;
          if (!isMore) {
            list.clear();
            list.addAll(position_model.list!);
            pageNum = 1;
          } else {
            list.addAll(position_model.list!);

          }
        });
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
      _controller.finishRefresh();
    }, pageNum);
  }

  Widget listRow() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              // return positionItemListWidget(list[index]);
              return Container();
            },
          ),

          // child: ListView(
          //   children: list.map((item) => positionItemListWidget(item)).toList(),
          // ),
        ),
      ],
    );
  }
}

Widget positionItemListWidget(BuildContext context, Position_item data) {
  return GestureDetector(
    onTap: () {
      // getIt<NavigateService>().pushNamed('/home_positionDetail',arguments: data.id.toString());
        Navigator.of(context!).pushNamed('/position_detail',arguments: data.id.toString());
      // print('==============');
    },
    child: Container(
      decoration:
          const BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.blueGrey,
        )
      ]),
      margin: EdgeInsets.only(top: 10, left: 16, right: 16),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ClipRRect(
                child: Image.network(data.avatarUrl ?? ''),
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
                      data.realName ?? "",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
                    SizedBox(width: 16),
                    Text(
                      "${data.expectSalary / 1000}/k",
                      style: const TextStyle(
                          color: m_colors.backColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '${data.educationName}-工作经验${data.workYearsName}-${data.educationName}',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),

                ProjectItemsView(titleList: getTag(data.skillName)),
                // Wrap(
                //   children: getTag(data.skillName)
                //       .map((item) => PositionTag(item))
                //       .toList(),
                // ),

                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

List<String> getTag(String skillName) {
  List<String> lists = skillName.split(',');
  return lists;
}
