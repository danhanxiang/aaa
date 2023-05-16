import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/OtherManager.dart';
import 'package:people_living_flutterdemo/core/service/personal_api/personal_api.dart';

class personal_careerDirection extends StatefulWidget {
  static const String routeName = '/personal_careerDirection';

  @override
  State<personal_careerDirection> createState() => _personal_careerDirectionState();
}

class _personal_careerDirectionState extends State<personal_careerDirection> {
  
  late List<OtherModel> allList = [];
  /// 总数据源
  List<OtherModel> tabs = [OtherModel(name: '请选择一级分类'),OtherModel()];
  /// 显示list 数据
  late List<OtherModel> listData = [];

  // 选中tab 一级 二级 
  int sltIndex = 0;

  int firstIndex = -1;
  int secondIndex = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  /// 调用接口
  getList(){
    PersonalService.getCareerDiection().then((value) {
      allList = value;
      setState(() {
        listData = allList;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '职业方向', action: navigationBar(context)),
        body: Padding(
          padding: EdgeInsets.all(16.px),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tabsView(context),
                SizedBox(height: 8.px),
                content(context)
              ],
            ),
          ),
    );
  }

  List<Widget>navigationBar(BuildContext context) {
    return [
      TextButton(
        onPressed: (showSaveBtn() ?() {
          Navigator.pop(context,tabs[1]);
        }: null),
        child: Container(
          alignment: Alignment.center,
          height: 30.px,
          width: 60.px,
          decoration: BoxDecoration(
            color: showSaveBtn() ? m_colors.backColor : m_colors.disableColor,
            borderRadius: BorderRadius.circular(15.px)),
            child: Text(
              "保存",
              style: TextStyle(color: Colors.white, fontSize: 13.px),
            ),
          )),
        ];
  }

  Widget tabsView(BuildContext context) {
    return Container(
      height: 40.px,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: tabCell(context, index),
            onTap: () {
              selectTab(index);
            },
          );
        }
      ),
    );
  }
    
  /// Tab title
  Widget tabCell(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.only(right: 10.px),
      child: Row(
        children: [
          Text(
            tabItem(index), 
            style: TextStyle(
              fontWeight: index == sltIndex ? FontWeight.bold : FontWeight.w400, 
              fontSize: index == sltIndex ? 18.px : 14.px, 
              color: index == sltIndex ? m_colors.backColor : m_colors.content_01_color
            )
          ),
        ],
      ),
    );
  }

  Widget content(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return contentCell(context, index);
        }
      ),
    );
  }

  /// 标签
  Widget contentCell(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        height: 50,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('${listData[index].name}', 
            style: TextStyle(
              fontSize: isSelect(listData[index].id!) ? 15 : 14, 
              fontWeight: isSelect(listData[index].id!) ? FontWeight.bold : FontWeight.w400,
              color: isSelect(listData[index].id!) ? m_colors.title_01_color : m_colors.content_01_color
              )
            ),
          ),
      onTap: () {
        selectCell(index);
      },
    );
  }

  /// 点击标签
  selectCell(int index){
    if (sltIndex == 0){
      // 记录当前选中索引
      if (firstIndex != index) {
        tabs[1] = OtherModel(name: '请选择二级分类');
        firstIndex = index;
      }

      sltIndex = sltIndex + 1;
      tabs[0] = listData[index];

      //显示二级
      setState(() {
        listData = allList[index].children as List<OtherModel>;
      });
    }else {
      // 选中
      secondIndex = index;
      setState(() {
        tabs[1] = listData[index];
      });
    }
  }

  /// 点击tab
  selectTab(int index){
    sltIndex = index;
    switch (index) {
      case 0:
        setState(() {
          listData = allList;
        });
        break;
      case 1:
      setState(() {
          listData = allList[firstIndex].children ?? [];
        });
        break;
      default:
    }
  }

  String tabItem(int index){
    return tabs[index].name ?? ''; 
  }

  bool isSelect(int id){
    int? currentId = 0;
    switch (sltIndex) {
      case 0:
        currentId = tabs[0].id;
        break;

      case 1:
        currentId = tabs[1].id;
        break;
      default:
    }
    return id == currentId;
  }

  bool showSaveBtn(){
    int sltId = tabs[1].id ?? 0;
    return sltId > 0;
  }
}


