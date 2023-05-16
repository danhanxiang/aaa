import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import '../../../../core/components/m_mainButton.dart';
import '../../../../core/models/FirmHomeModel/dev_info_item_entity.dart';
import '../../../../core/models/FirmMineModel/treaty_order_list_entity.dart';
import '../../../../core/models/HomeModel/home_positionListModel.dart';
import '../../../../core/service/firm_home_api/firm_home_api.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../utils/utils.dart';
import '../../HomeView/home_positionDetailView.dart';
import '../../HomeView/home_positionRecommendCell.dart';

class TreatyOrderSearchView extends StatefulWidget {
  @override
  static const String routeName = '/firmmine/treaty_search';

  const TreatyOrderSearchView({Key? key}) : super(key: key);

  State<TreatyOrderSearchView> createState() => _TreatyOrderSearchViewState();
}

class _TreatyOrderSearchViewState extends State<TreatyOrderSearchView>
    with TickerProviderStateMixin {
  late EasyRefreshController _controller;
  late TextEditingController _searchController;
  List<TreatyOrderListDataList> searchList = [];
  var pageNum = 1;
  var search = '';

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
                      hintText: "搜索开发者/订单号",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.2)),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                    onSubmitted: (value) {
                      searchFirmOrderList(value.toString(), 1);
                      User.saveDevSearch(value.toString());
                    },
                  )),
              SizedBox(height: 16,),
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
                              searchFirmOrderList(  _searchController.text.toString(), pageNum);
                              // _controller.finishRefresh();
                            });
                          },
                          // 上拉加载事件回调
                          onLoad: () async {
                            await Future.delayed(Duration(seconds: 2), () {
                              // 结束加载
                              // _controller.finishLoad();
                              pageNum++;
                              searchFirmOrderList( _searchController.text.toString(), pageNum);
                            });
                          },
                          header: BKRefresh.addRefreshHeader(),
                          // 自定义顶部上啦加载
                          footer: BKRefresh.addLoadFooter(),
                          // child: listRow(),
                          child: ListView(
                            children: searchList
                                .map((item) => ItemView(item,context))
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
                                '当前暂数据',
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

  void searchFirmOrderList(String search, int pageNum) {
    FirmMineService.searchFirmOrderListApi(search, pageNum, (object) {
      if (object.isSuccess) {
        setState(() {
          TreatyOrderListData newdata = object.data;
          if (newdata.list!=null&&newdata.list!.length>=0) {
            if (pageNum == 1) {
              searchList.clear();
              searchList.addAll(newdata.list!);
              _controller.finishRefresh();
            } else {
              if (newdata.list != null) {
                searchList.addAll(newdata.list!);
              }
              _controller.finishLoad();
            }
          }else {
            EasyLoading.showToast('暂无搜索结果');
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

/// 列表item widget
Widget ItemView(TreatyOrderListDataList data, BuildContext context) {
  return GestureDetector(
    child: data.orderNo!.isNotEmpty
        ? Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    color: m_colors.divider_01_color, width: 10))),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '订单号:${data.orderNo}',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '${data.orderStatusName}',
                  style: TextStyle(
                      color: data.orderStatus == 3
                          ? m_colors.color_F5313D
                          : data.orderStatus == 4
                          ? m_colors.color_5CE28A
                          : data.orderStatus == 5
                          ? m_colors.color_FB8B39
                          : m_colors.color_B5BED3,
                      fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '开始时间',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '${data.workStartDate}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '开发者',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '${data.realName}(${data.workDaysModeName})',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '职业',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  '${data.careerDirectionName}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            data.orderStatus == 1
                ? Container(
              alignment: Alignment.centerRight,
              child: m_Button(
                text: '立即支付',
              ),
            )
                : Container()
          ],
        ))
        : Container(),
    onTap: () {},
  );
}
