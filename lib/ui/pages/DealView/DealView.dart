import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/placeholderWidget.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/vm/DealViewModel.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/DealUnsettled/DealUnsettled.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/Dealed/Dealed.dart';
import 'package:people_living_flutterdemo/ui/pages/DealView/widget/Dealing/DealIng.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_updateUserinfo.dart';
import 'package:people_living_flutterdemo/ui/widget/EasyRefreshHeader.dart';

class DealView extends StatefulWidget {
  static const String routeName = '/homeview';

  @override
  State<DealView> createState() => _DealViewState();
}

class _DealViewState extends State<DealView> with AutomaticKeepAliveClientMixin {
  /// 避免重复刷新 从缓存中获取
  @override
  bool get wantKeepAlive => true;

  final DealViewModel vm = DealViewModel();

  /// 当前pageview
  int currentIndex = 0;
  final PageController _pageController = PageController();

  EasyRefreshController _controller = EasyRefreshController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllList();
  }

  /// 获取服务中 3个接口
  getAllList(){
    vm.httpGetData((value){
      _controller.finishRefresh();
      setState(() {
        vm.isHasData = value;
      });
    }, (error) {
        EasyLoading.showError(error);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: m_AppBar(context, '服务项目', isHiddenLeading: true),
      body: vm.isHasData ? 
      content() : 
      placeHolder()
    );
  }

  Widget placeHolder() {
    return EasyRefresh(
      controller: _controller,
      header: BKRefresh.addRefreshHeader(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 0), () {
          // 结束加载
          getAllList();
        });
      },
      child: Column(children: [
        PlaceholderWidget(
          iconName: 'daily_placeHold',
          imgWidth: 128.px,
          imgHeight: 99.px,
          btnTitle: '去优化',
          content: '暂无公司',
          title: '优化简历获取更多职位推荐',
          onPressed: () {
            Navigator.of(context).pushNamed(CretaeUserInfoView.routeName);
          },
          )
      ],));
  }

  Widget content(){
    return Column(children: [
        header(context),
        pageWidget(context),
      ]);
  }

  /// 顶部tab item
  Widget header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tabItem(vm.homeOrder, 0),
          const SizedBox(width: 18),

          tabItem(vm.waitingOrder, 1),
          const SizedBox(width: 18),

          tabItem(vm.unsettledOrder, 2),
        ],
      ),
    );
  }

  /// page 分页标题
  Widget tabItem(String title, int index){
    return GestureDetector(
      child: Column(children: [
        Text(title, style: currentStyle(currentIndex == index)),
        const SizedBox(height: 6),
        Visibility(
          visible: index == currentIndex,
          child: Container(
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            color: m_colors.backColor,
            borderRadius: BorderRadius.circular(2)
          ),
        ))
      ]),
      onTap: () {
        if (_pageController.hasClients) {
          _pageController.animateToPage(index, 
          duration: Duration(milliseconds: 200), 
          curve: Curves.ease);
        }
      },
    );
  }

  /// 分页
  Widget pageWidget(BuildContext context){
    return Expanded(
      child: 
      PageView.builder(
        itemCount: 3,
        controller: _pageController,
        itemBuilder: ((context, index) {
          switch (index) {
            case 0:
              return DealIng(
                orderList: vm.homeOrderlist, 
                listBlock: (list) {
                  vm.homeOrderlist = list;
                  vm.addStyleList((isShow) {
                    setState(() {
                      vm.isHasData = isShow;
                    });
                  });
                },
              );
            case 1:
              return Dealed(
                orderList: vm.waitingOrderList, 
                listBlock: (list) {
                  vm.waitingOrderList = list;
                  vm.addStyleList((isShow) {
                    setState(() {
                      vm.isHasData = isShow;
                    });
                  });
                }
              );
            case 2: 
              return DealUnsettled(vm.unsettledOrderlist, 4, (list){
                vm.unsettledOrderlist = list;
                  vm.addStyleList((isShow) {
                    setState(() {
                      vm.isHasData = isShow;
                    });
                  });
              });
            default: return Text('ssssssssssssssssssssssssssss');
          }
        }),
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      )
    );
  }

  TextStyle currentStyle(bool isPage){
    return isPage ? TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: m_colors.title_01_color) 
    : TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: m_colors.content_02_color);
  }
}