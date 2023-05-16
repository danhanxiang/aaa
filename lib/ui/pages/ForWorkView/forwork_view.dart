import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/models/index.dart';
import 'package:people_living_flutterdemo/core/service/position_api/position_api.dart';
import 'package:people_living_flutterdemo/ui/widget/ItemWidget.dart';

import '../../../core/service/home_api/home_api.dart';
import '../../widget/common_tag.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../HomeView/home_positionDetailView.dart';
import '../HomeView/home_positionRecommendCell.dart';

class ForWorkView extends StatefulWidget {
  const ForWorkView({Key? key}) : super(key: key);
  static const String routeName = '/forwork';

  @override
  State<ForWorkView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ForWorkView> {
  late EasyRefreshController _controller;
  late TextEditingController _searchController;

  List list = [];
  var pageNum = 1;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _searchController = TextEditingController(); //创建TextEditingController类型的值
    getForWorkList("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('找工作', style: TextStyle(color: m_colors.title_01_color,fontSize: 16,fontWeight:FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0, //去除阴影
        ),
        // body: listRow()
        body: Column(
          children: [
            Container(
                height: 46,
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: _searchController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "搜索职位",
                    hintStyle: TextStyle(color: Colors.black.withOpacity(.2)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),
                  onSubmitted: (value) {
                    getForWorkList(value);
                  },
                )),
            Expanded(
                child: list.isNotEmpty
                    ? EasyRefresh(
                        // 是否开启控制结束加载
                        enableControlFinishLoad: false,
                        enableControlFinishRefresh: false,
                        // 控制器
                        controller: _controller,
                        onRefresh: () async {
                          await Future.delayed(Duration(seconds: 0), () {
                            // 结束加载
                            getForWorkList(_searchController.text.toString());
                            // _controller.finishRefresh();
                          });
                        },
                        // 上拉加载事件回调
                        onLoad: () async {
                          await Future.delayed(Duration(seconds: 2), () {
                            // 结束加载
                            // _controller.finishLoad();
                            pageNum++;
                            getForWorkList(_searchController.text.toString(),
                                isMore: true);
                          });
                        },
                  header:
                  ClassicalHeader(textColor: Colors.black,
                      showInfo: false,
                      refreshText: '正在加载中...',
                      refreshReadyText:'正在加载中...',
                      refreshingText: "正在加载中...",
                      refreshedText: '加载完成'),
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
                    loadingText: "正在加载中...",
                    // 加载完成显示的文字
                    loadedText: "加载完成",
                  ),
                        // child: listRow(),
                        child: ListView(
                          children: list
                              .map((item) => PositionViewList(context, item))
                              .toList(),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(top: 150),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Image.asset('images/home/icon_home_noPosition.png',
                                fit: BoxFit.cover, width: 78, height: 52),
                            const SizedBox(height: 16),
                            const Text(
                              '当前暂无职位!',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: m_colors.content_02_color),
                            ),
                          ],
                        ),
                      )),
          ],
        ));
  }

  void getForWorkList(String search, {bool isMore = false}) {

    HomeService.getForWorkList(pageNum, search, (object) {
      if (object.isSuccess) {
        setState(() {
          if (!isMore) {
            if (object.data.isNotEmpty) {
              list.clear();
              list.addAll(object.data);
              pageNum = 1;
              // if(search.isEmpty){
              //   EasyLoading.showToast('暂无搜索职位');
              // }
            }
            _controller.finishRefresh();
          }else{
            _controller.finishLoad();
            list.addAll(object.data);
          }
        });

      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
}

Widget PositionViewList(BuildContext context, Home_positionListModel data) {
  return GestureDetector(
    child: PositionRecommentCellView(data),
    onTap: () {
      Home_positionListModel model = data;

      Navigator.of(context).pushNamed(PositionDetailView.routeName,
          arguments: model.positionId.toString());
    },
  );
}

