import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/pages/HomeView/home_positionDetailView.dart';
import 'package:people_living_flutterdemo/core/service/home_api/home_api.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/core/service/userLogin_api/user_Login.dart';
import '../../../core/models/index.dart';
import 'home_headerView.dart';
import 'home_positionRecommendCell.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class homeView extends StatefulWidget {
  @override
  static const String routeName = '/homeview';
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> with TickerProviderStateMixin {
  List _dataPositionListArray = [];
  bool isOrder = true;

  List _spList = ['职位推荐', '活动任务'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    getPositionList();

    isOrder = User.userInfo.serviceStatus == 1 ? true : false;
    _spList = isOrder ? ['职位推荐', '活动任务'] : ['活动任务'];
    _tabController =
        TabController(initialIndex: 0, length: _spList.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_tabController != null) {
      _tabController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                _showDialog(context);
              },
              child: createRightBtn()),
        ],
        elevation: 0, //去除阴影
        leadingWidth: 400,
        leading: CreateLeftBtn(),
      ),
      body: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, isScroller) {
          return [
            const SliverAppBar(
              flexibleSpace: homeScrollView(),
              collapsedHeight: 470,
              backgroundColor: Colors.white,
              //   expandedHeight: 550,
            ),
            SliverPersistentHeader(
              delegate: MyDelegate(TabBar(
                controller: _tabController,
                tabs: _spList.map((e) {
                  return Tab(
                    child: Container(
                      child: new Text(e),
                    ),
                  );
                }).toList(),

                isScrollable: true, //设置可以滑动
                indicatorColor: Colors.transparent, //指示器颜色设置透明
                //indicatorSize: TabBarIndicatorSize.label, //指示器长度
                labelColor: m_colors.title_01_color, //选中颜色
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                unselectedLabelColor: m_colors.content_02_color, //未选中颜色
                unselectedLabelStyle: TextStyle(fontSize: 15),
                labelPadding: EdgeInsets.only(left: 16), //文字间距

                onTap: (index) {
                  print(index);
                  print(context.size!.height);
                },
              )),
              floating: true,
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _spList.map((e) {
            if (e == '职位推荐') {
              return PositionViewList();
            } else if (e == '活动任务') {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text("我是活动任务界面"),
                ),
              );
            }
            return Text('');
          }).toList(),
        ),
      ),
    );
  }

  Widget PositionViewList() {
    if (User.userInfo.status == 3) {
      if (_dataPositionListArray.length > 0) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: _dataPositionListArray.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  child:
                      PositionRecommentCellView(_dataPositionListArray[index]),
                  onTap: () {
                    Home_positionListModel model =
                        _dataPositionListArray[index];

                    Navigator.of(context).pushNamed(PositionDetailView.routeName,
                        arguments: model.positionId.toString());
                  },
                );
                //return PositionRecommentCellView(_dataPositionListArray[index]);
              })),
        );
      } else {
        //没有数据
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 36),
          child: Column(
            children: [
              Image.asset('images/home/icon_home_noPosition.png',
                  fit: BoxFit.cover, width: 78, height: 52),
              SizedBox(height: 16),
              Text(
                '当前暂无职位!',
                style:
                    TextStyle(fontSize: 13, color: m_colors.content_02_color),
              ),
            ],
          ),
        );
      }
    } else if (User.userInfo.status == 2) {
      //入驻信息待审核,审核成功后再来查看吧!
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 36),
        child: Column(
          children: [
            Image.asset('images/home/icon_home_noPosition.png',
                fit: BoxFit.cover, width: 78, height: 52),
            SizedBox(height: 16),
            Text(
              '入驻信息待审核,审核成功后再来查看吧!',
              style: TextStyle(fontSize: 13, color: m_colors.content_02_color),
            ),
          ],
        ),
      );
    } else {
      //完善入驻资料后,再来查看吧!
      return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 36),
        child: Column(
          children: [
            Image.asset('images/home/icon_home_noPosition.png',
                fit: BoxFit.cover, width: 78, height: 52),
            SizedBox(height: 16),
            Text(
              '完善入驻资料后,再来查看吧!',
              style: TextStyle(fontSize: 13, color: m_colors.content_02_color),
            ),
          ],
        ),
      );
    }
  }

  Widget CreateLeftBtn() {
    return Container(
      // color: Colors.yellow,
      padding: EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
            ),
            child: Text(
              CreateName(User.userInfo.realName),
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 5),
          Text(
            User.userInfo.realName ?? '新朋友',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget createRightBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
      child: Row(children: [
        Container(
            decoration: BoxDecoration(
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //设置四周边框
              border: Border.all(
                  width: 1,
                  color:
                      isOrder ? m_colors.backColor : m_colors.content_01_color),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                  child: Text(
                    isOrder ? '可接单' : '不接单',
                    style: TextStyle(
                        color: isOrder
                            ? m_colors.backColor
                            : m_colors.content_01_color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 6, 0),
                  child: Image.asset(
                    isOrder
                        ? 'images/home/icon_home_noorderstart.png'
                        : 'images/home/icon_home_orderstart.png',
                    width: 14,
                    height: 10,
                  ),
                )
              ],
            ))
      ]),
    );
  }

  void _showDialog(BuildContext Wcontect) {
    showCupertinoDialog(
        context: Wcontect,
        builder: (content) {
          return CupertinoAlertDialog(
            title: Text(isOrder ? '确定切换不接单？' : '确定切换可接单?'),
            content:
                Text(isOrder ? '切换为不接单状态后，将不再展示职位推荐' : '切换为可接单状态后,将展示职位推荐'),
            actions: [
              CupertinoDialogAction(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.of(content).pop();
                  }),
              CupertinoDialogAction(
                  child: Text('确认'),
                  onPressed: () {
                    UpdateServiceStatus(isOrder ? "2" : "1", () {
                      //更新本地用户信息
                      LoginService.GetUserInfo((object) => null);
                      setState(() {
                        if (isOrder) {
                          _spList = ['活动任务'];
                        } else {
                          _spList = ['职位推荐', '活动任务'];
                        }

                        _tabController = TabController(
                            initialIndex: 0,
                            length: _spList.length,
                            vsync: this);

                        isOrder = !isOrder;
                      });
                    });

                    Navigator.of(content).pop();
                  }),
            ],
          );
        });
  }

  //获取首页职位推荐列表
  void getPositionList() {
    HomeService.getPositionList((object) {
      if (object.isSuccess) {
        setState(() {
          _dataPositionListArray = object.data;
        });
      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
}

class homeScrollView extends StatelessWidget {
  const homeScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderView();
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar, {this.color = Colors.white});
  TabBar tabBar;
  Color color;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

String CreateName(String? name) {
  String newName = name ?? '你好,新朋友';
  if (newName.length <= 2) {
    return newName;
  }
  return newName.substring(newName.length - 2);
}

void UpdateServiceStatus(String type, Function() onCompletion) {
  EasyLoading.show(status: '切换中...');
  HomeService.getIsserviceStatus(type, (object) {
    if (object.isSuccess) {
      EasyLoading.showToast('切换成功');
      onCompletion();
    } else {
      EasyLoading.showToast(object.message!);
    }
  });
}
