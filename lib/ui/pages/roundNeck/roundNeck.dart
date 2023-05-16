import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/ui/pages/roundNeck/roundNeckSubView.dart';
import 'package:people_living_flutterdemo/ui/widget/button_widget/TextIconButton.dart';

import '../../shared/app_size_fit.dart';
import '../HomeView/home_view.dart';

class roundNeck extends StatelessWidget {
  const roundNeck();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Material App Bar'),
        // ),
        // body: IndexPage(),
        body: MyStatefulWidget(),
      ),
    );
  }

  Widget contentScrollview() {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return CustomScrollView(
      center: centerKey,
      slivers: [
        SliverAppBar(
          pinned: false,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("demo"),
          ),
        ),
      ],
    );
  }
}

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget _headGroup = Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 44),
          Text("用圆领 更自由",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 32,
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black45,
                      ),
                      Expanded(
                          child: Text("请输入需要购买的服务",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black38))),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 11),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 11, right: 11),
            // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(2))),
            child: Row(
              children: [
                Icon(Icons.add, size: 30),
                SizedBox(width: 8),
                Text("添加爱车",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                // SizedBox(width: 8),
                // Expanded(child: Text("享受更优质服务", style: TextStyle(fontSize: 14))),
                // Image.asset("img/car_who_vin.png", height: 28),
              ],
            ),
          )
        ],
      ),
    );

    //功能栏目
    Widget _bigFunctionalGridView = Padding(
      padding: EdgeInsets.only(left: 25, right: 30),
      child: GridView.count(
        padding: const EdgeInsets.symmetric(vertical: 20),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 18,
        crossAxisCount: 4,
        children: [
          Image.asset('images/person/icon_person_updateResume_wx.png'),
          Image.asset('images/person/icon_person_updateResume_wx.png'),
          Image.asset('images/person/icon_person_updateResume_wx.png'),
          Image.asset('images/person/icon_person_updateResume_wx.png',
              fit: BoxFit.cover, width: 78, height: 52),
        ],
      ),
    );

    //百变酷炫栏目组
    Widget _recommendRowScrollView = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildNavigationBarView("百变炫酷"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildRowScrollItemView(),
                _buildRowScrollItemView(),
                _buildRowScrollItemView(),
                _buildRowScrollItemView(),
              ],
            ),
          )
        ],
      ),
    );

    //小的功能栏目
    Widget _minFunctionalGridView = Padding(
      padding: EdgeInsets.only(left: 25, right: 30),
      child: GridView.count(
        padding: const EdgeInsets.symmetric(vertical: 20),
        shrinkWrap: true,
        childAspectRatio: 1 / 1,
        mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 18,
        crossAxisCount: 4,
        children: [
          Icon(Icons.abc),
          Icon(Icons.abc),
          Icon(Icons.abc),
          // _buildGridIconTextItemView("img/car_who_vin.png", "放心修"),
          // _buildGridIconTextItemView("img/car_who_vin.png", "新车"),
          // _buildGridIconTextItemView("img/car_who_vin.png", "二手车"),
          // _buildGridIconTextItemView("img/car_who_vin.png", "更多"),
        ],
      ),
    );

    //视频列表
    // Widget _gridInfoList = GridView.custom(
    //   gridDelegate: SliverWovenGridDelegate.count(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 8,
    //     crossAxisSpacing: 8,
    //     pattern: [
    //       const WovenGridTile(1),
    //       const WovenGridTile(
    //         5 / 7,
    //         crossAxisRatio: 0.9,
    //         alignment: AlignmentDirectional.centerEnd,
    //       ),
    //     ],
    //   ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) => Text("位置 $index", style: TextStyle(fontSize: 12)),
    //   ),
    // );

    Widget _gridInfoList = GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      children: [
        Text("我是文本1"),
        Text("我是文本2"),
        Text("我是文本3"),
        Text("我是文本4"),
        Text("我是文本5"),
        Text("我是文本6"),
        Text("我是文本7"),
        Text("我是文本8"),
        Text("我是文本9"),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.black12,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 280,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Column(
                  children: [
                    _headGroup,
                    _bigFunctionalGridView,
                    // _recommendRowScrollView,
                    // _minFunctionalGridView,
                    // _buildNavigationBarView("热门推荐"),
                  ],
                ),
              ),
            )
          ];
        },
        body: _gridInfoList,
      ),
    );
  }

  //构建一个上下类型的视图
  // Widget _buildGridIconTextItemView(String iconAsset, String title) {
  //   // return IconTextButton(
  //   //   icon: Image.asset(iconAsset, height: 45),
  //   //   // itDirection: IT_Direction.TOP_BOTTOM,
  //   //   text: Text(title, style: TextStyle(fontSize: 12, color: Colors.black)),
  //   // );
  //   return TextButton.icon(onPressed: (() {

  //   }, icon: icon, label: label)
  // }

  //构建一个导航Bar
  Widget _buildNavigationBarView(String title) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          Icon(
            Icons.chevron_right,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildRowScrollItemView() {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: SizedBox(
          height: 90,
          width: 142,
          child: Stack(
            children: [
              SizedBox.expand(
                child: Container(
                  color: Colors.black,
                  child: Image.asset("img/car_who_vin.png"),
                ),
              ),
              Positioned(
                left: 5,
                top: 5,
                child: Text("炫彩改装设计图鉴",
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget();

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  List _spList = ['推荐', '设计', '音视频', '运营'];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    // const Key centerKey = ValueKey<String>('bottom-sliver-list');
    // final double top = getPhoneSafeArea() + 210;
    return Scaffold(
        body: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, isScroller) {
            return [
              const SliverAppBar(
                flexibleSpace: roundNeckHeader(),
                collapsedHeight: 260,
                backgroundColor: Color.fromRGBO(249, 249, 249, 1),
            //   expandedHeight: 550,
              ),

              SliverPersistentHeader(
                delegate: MyDelegate(
                  TabBar(
                    controller: _tabController,
                    tabs: _spList.map((e) {
                      return Tab(
                        child: Container(
                          child: Text(e, style: TextStyle(color: Colors.grey[800], fontSize: 15)),
                        ),
                      );
                    }).toList(),
                    isScrollable: true, //设置可以滑动
                    indicatorColor: Colors.black, //指示器颜色设置透明
                    //indicatorSize: TabBarIndicatorSize.label, //指示器长度
                    // labelColor: m_colors.title_01_color, //选中颜色
                    labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    // unselectedLabelColor: m_colors.content_02_color, //未选中颜色
                    unselectedLabelStyle: TextStyle(fontSize: 15),
                    labelPadding: EdgeInsets.only(left: 16), //文字间距
                    indicatorPadding: EdgeInsets.only(left: 20),
                    onTap: (index) {
                      print(index);
                      print(context.size!.height);
                    },
                ),
                color: Color.fromRGBO(249, 249, 249, 1)
              ),
                floating: true,
                pinned: true,
              ),
        ];
      },
      body: buildTabBar(),
    ));
  }

  Widget buildTabBar() {
    return TabBarView(
      controller: _tabController,
      children: _spList.map((e) {
        if (e == '推荐') {
          return OrderPage();
        } else {
          return Container(
            color: Colors.white,
            child: Center(
              child: Text("当前页面是: $e"),
            ),
          );
        }
      }).toList(),
    );
  }

  Widget headerView() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("用圆领 更自由",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          SizedBox(height: 20),
          Stack(alignment: AlignmentDirectional.centerEnd, children: [
            Container(
              padding: EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 0),
              height: 44,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(22)),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black45),
                  Expanded(child: Text("请输入需要购买的服务"))
                ],
              ),
            ),
            Align(
              alignment: Alignment(1.02, 0),
              child: TextButton(
                  onPressed: (() {}),
                  child: Container(
                    alignment: Alignment.center,
                    height: 36,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(36 / 2)),
                    child: Text(
                      "搜索",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            )
          ]),
        ],
      ),
    );
  }

  Widget itemsView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("专职")),
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("任务")),
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("零工")),
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("我是卖家")),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageSubView() {
    return Padding(padding: EdgeInsets.all(8), child: PageListView());
  }
}

class roundNeckHeader extends StatelessWidget {
  const roundNeckHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: BKSizeFit.statusHeight),
          headerView(),
          itemsView()
        ],
      ),
    );
  }

  Widget headerView() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("用圆领 更自由",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          SizedBox(height: 20),
          Stack(alignment: AlignmentDirectional.centerEnd, children: [
            Container(
              padding: EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 0),
              height: 44,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 238, 240, 1),
                  borderRadius: BorderRadius.circular(22)),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black45),
                  Expanded(child: Text("请输入需要购买的服务"))
                ],
              ),
            ),
            Align(
              alignment: Alignment(1.02, 0),
              child: TextButton(
                  onPressed: (() {}),
                  child: Container(
                    alignment: Alignment.center,
                    height: 36,
                    width: 60,
                    decoration: BoxDecoration(
                        color: m_colors.backColor,
                        borderRadius: BorderRadius.circular(36 / 2)),
                    child: Text(
                      "搜索",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            )
          ]),
        ],
      ),
    );
  }

  Widget itemsView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("专职")),
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("任务")),
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("零工")),
              TextIconButton(
                  type: TextIconButtonType.imageTop,
                  icon: Image.asset('images/home/icon_home_manual.png',
                      fit: BoxFit.cover, width: 50, height: 50),
                  text: Text("我是卖家")),
            ],
          ),
        ),
      ),
    );
  }
}

class PageListView extends StatefulWidget {
  const PageListView();

  @override
  State<PageListView> createState() => _PageListViewState();
}

class _PageListViewState extends State<PageListView> {
  int currentSelectIndex = 0;
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      double offset = pageController.offset;
      print("page 滑动的距离 $offset");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 100,
            color: Colors.pink,
            child: const Center(
              child: Text("This is a page1"),
            ),
          ),
          Container(
            color: Colors.teal,
            child: const Center(
              child: Text("This is a page2"),
            ),
          ),
          Container(
            color: Colors.amber,
            child: const Center(
              child: Text("This is a page3"),
            ),
          ),
        ],
      ),
    );
  }
}
