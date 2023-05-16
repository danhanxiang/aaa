import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:people_living_flutterdemo/ui/widget/map/seriesLocationPage.dart';
import 'package:people_living_flutterdemo/ui/widget/map/singleLocationPage.dart';

import 'LocationModel.dart';
import 'function_item.widget.dart';
import 'loc_appbar.dart';
// import 'package:baidulocation_flutter_demo/widgets/loc_appbar.dart';


class MapLocation extends StatefulWidget {
  // const MapLocation({super.key});
  const MapLocation();

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 设置百度定位
    LocationManager().setLocation();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('定位'),
      ),
      body: ListView(children: const <Widget>[
      FunctionItem(
        label: '单次定位',
        sublabel: 'singleLocationPage',
        target: SingleLocationPage(),
      ),

      ///需要停止定位
      FunctionItem(
        label: '连续定位',
        sublabel: 'seriesLocationPage',
        target: SeriesLocationPage(),
      ),
      
    ]),
    );
  } 
}