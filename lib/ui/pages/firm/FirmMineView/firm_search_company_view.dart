import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/firm_mine_api/firm_mine_api.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/firm_certification_view.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';
import '../../../../core/models/FirmHomeModel/dev_info_item_entity.dart';
import '../../../../core/models/FirmMineModel/company_info_entity.dart';
import '../../../../core/models/FirmMineModel/search_company_info_entity.dart';
import '../../../../core/models/HomeModel/home_positionListModel.dart';
import '../../../../core/service/firm_home_api/firm_home_api.dart';
import '../../../../utils/utils.dart';
import '../../HomeView/home_positionDetailView.dart';
import '../../HomeView/home_positionRecommendCell.dart';

class firm_search_company_view extends StatefulWidget {
  @override
  static const String routeName = '/firmhome/search';

  State<firm_search_company_view> createState() => _firm_search_company_viewState();
}

class _firm_search_company_viewState extends State<firm_search_company_view>
    with TickerProviderStateMixin {
  late EasyRefreshController _controller;
  late TextEditingController _searchController;
  List<SearchCompanyInfoData> searchList = [];
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
        appBar:m_AppBar(context, '选择公司'),
        // body: listRow()
        body: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 10),
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
                      hintText: "搜索公司全称",
                      hintStyle: TextStyle(color: Colors.black.withOpacity(.2)),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                    onSubmitted: (value) {
                      searchCompany(value.toString());
                      User.saveDevSearch(value.toString());
                    },
                  )),
              SizedBox(height: 10,),
              Expanded(
                  child: searchList.isNotEmpty
                      ? EasyRefresh(
                          enableControlFinishLoad: false,
                          enableControlFinishRefresh: false,
                          controller: _controller,
                          onRefresh: () async {
                            await Future.delayed(Duration(seconds: 0), () {
                              // 结束加载
                              searchCompany(
                                  _searchController.text.toString());
                              // _controller.finishRefresh();
                            });
                          },
                          // 上拉加载事件回调
                          onLoad: () async {
                            await Future.delayed(Duration(seconds: 2), () {

                              searchCompany(
                                  _searchController.text.toString());
                            });
                          },
                          header: BKRefresh.addRefreshHeader(),
                          // 自定义顶部上啦加载
                          footer: BKRefresh.addLoadFooter(),
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
                                '当前暂无数据',
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

  void searchCompany(String search) {
    FirmMineService.searchCompanyApi(search, (object) {
      if (object.isSuccess) {
        setState(() {
          searchList.addAll(object.data);
        });
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
}


Widget devItemView(BuildContext context, SearchCompanyInfoData data) {
  return
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: m_colors.divider_01_color, width: 1))),
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          padding: EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                data.companyName??'',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).pushNamed(firm_certification_view.routeName,
              arguments: {"type": "2",'searchBean':data});
        },
      )

    ;
}

