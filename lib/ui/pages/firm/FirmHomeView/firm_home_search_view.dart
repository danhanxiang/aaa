import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import '../../../../core/models/FirmHomeModel/dev_info_item_entity.dart';
import '../../../../core/models/HomeModel/home_positionListModel.dart';
import '../../../../core/service/firm_home_api/firm_home_api.dart';
import '../../../../utils/utils.dart';
import '../../HomeView/home_positionDetailView.dart';
import '../../HomeView/home_positionRecommendCell.dart';

class firm_home_search_View extends StatefulWidget {
  @override
  static const String routeName = '/firmhome/search';

  State<firm_home_search_View> createState() => _firm_home_search_ViewState();
}

class _firm_home_search_ViewState extends State<firm_home_search_View>
    with TickerProviderStateMixin {
  late EasyRefreshController _controller;
  late TextEditingController _searchController;
  List<DevInfoItemDataList> searchList = [];
  var pageNum = 1;
  var search = '';
  List<String> historyList = ['dfdsf', 'ddd', 'fff', 'gggg', 'fdsfdf'];

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _searchController = TextEditingController(); //创建TextEditingController类型的值
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('搜索',
              style: TextStyle(
                  color: m_colors.title_01_color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          elevation: 0, //去除阴影
        ),
        // body: listRow()
        body: Container(
          color: Colors.white,
          child: Column(
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
                      searchDeveloper(value.toString(), 1);
                      User.saveDevSearch(value.toString());
                    },
                  )),
              SizedBox(height: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('历史记录',style: TextStyle(color: Colors.black,fontSize: 14),),
                  SizedBox(height: 10,),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10.0,
                    children: historyView(historyList),
                  ),
                ],
              ),
              Expanded(
                  child: searchList.isNotEmpty
                      ? EasyRefresh(
                          // 是否开启控制结束加载
                          enableControlFinishLoad: false,
                          enableControlFinishRefresh: false,
                          // 控制器
                          controller: _controller,
                          onRefresh: () async {
                            await Future.delayed(Duration(seconds: 0), () {
                              // 结束加载
                              pageNum = 1;
                              searchDeveloper(
                                  _searchController.text.toString(), pageNum);
                              // _controller.finishRefresh();
                            });
                          },
                          // 上拉加载事件回调
                          onLoad: () async {
                            await Future.delayed(Duration(seconds: 2), () {
                              // 结束加载
                              // _controller.finishLoad();
                              pageNum++;
                              searchDeveloper(
                                  _searchController.text.toString(), pageNum);
                            });
                          },
                          header: BKRefresh.addRefreshHeader(),
                          // 自定义顶部上啦加载
                          footer: BKRefresh.addLoadFooter(),
                          // child: listRow(),
                          child: ListView(
                            children: searchList
                                .map((item) => devItemView(context, item))
                                .toList(),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 150),
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
          ),
        ));
  }

  void searchDeveloper(String search, int pageNum) {
    FirmHomeService.searchDeveloperApi(search, pageNum, (object) {
      if (object.isSuccess) {
        setState(() {
          DevInfoItemData newdata = object.data;
          if (newdata.list!.isNotEmpty) {
            if (pageNum == 1) {
              searchList.clear();
              searchList.addAll(newdata.list!);
              _controller.finishRefresh();
            } else {
              if (newdata.list!.isNotEmpty) {
                searchList.addAll(newdata.list!);
              }
              _controller.finishLoad();
            }
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

Widget devItemView(BuildContext context, DevInfoItemDataList data) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(color: m_colors.divider_01_color, width: 1))),
    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
    padding: EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
              child: Image.network(
                data.avatarUrl!,
                height: 56,
                width: 56,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            )),
        SizedBox(width: 16),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data.realName!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.blue,
                      child: Text(data.workDayModeName!),
                    ),
                    Text(
                      '${data.expectSalary! / 1000}k/月',
                      style: TextStyle(
                          color: m_colors.backColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 6),
            Text(
                '${data.careerDirectionName}-工作经验${data.workDayModeName}-${data.educationName}'),
            SizedBox(height: 6),
            Wrap(
              spacing: 10,
              runSpacing: 10.0,
              children: tagView(data.skillName!),
            ),
          ],
        ))
      ],
    ),
  );
}

List<Widget> tagView(String skill) {
  List<Widget> childArray = [];
  if (skill.isNotEmpty) {
    List titles = skill.split(',');
    for (var title in titles) {
      childArray.add(Container(
        //margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
        width: 80,
        height: 30,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10, right: 10),
        // padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
        decoration: BoxDecoration(
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            //设置四周边框
            //border: Border.all(width: 1, color: m_colors.backColor),
            color: m_colors.back_01_color),
        child: Text(
          title,
          style: TextStyle(fontSize: 14, color: m_colors.content_01_color),
        ),
      ));
    }
    if (childArray.length > 4) {
      return childArray.sublist(0, 4);
    } else {
      return childArray;
    }
  } else {
    return childArray;
  }
}

List<Widget> historyView(List<String> titles) {
  List<Widget> childArray = [];
  if (titles.isNotEmpty) {
    for (var title in titles) {
      childArray.add(
          GestureDetector(
            child: Container(
              //margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
              width: 80,
              height: 30,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              // padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
              decoration: const BoxDecoration(
                //设置四周圆角 角度
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  //设置四周边框
                  //border: Border.all(width: 1, color: m_colors.backColor),
                  color: m_colors.back_01_color),
              child: Text(
                title,
                style: TextStyle(fontSize: 14, color: m_colors.content_01_color),
              ),
            ) ,
            onTap: (){

              LogUtils.d(title);
            },
          )
         );
    }
    return childArray;
  } else {
    return [];
  }
}
