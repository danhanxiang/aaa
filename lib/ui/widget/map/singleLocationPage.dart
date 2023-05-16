import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';

import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

import '../map/loc_appbar.dart';
import 'LocationModel.dart';

class SingleLocationPage extends StatefulWidget {
  const SingleLocationPage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SingleLocationPage> {
  // 地图
  MapManager _map = MapManager();
  // 定位
  LocationManager _locationManager = LocationManager();

  @override
  void initState() {
    super.initState();

    _locationManager.setupLocation((BaiduLocation result){
        if (Platform.isIOS) {
      ///接受定位回调
        setState(() {
          _map.loationResult = result;
          _map.locationFinish();
        });
    } else if (Platform.isAndroid) {
      ///接受定位回调
        setState(() {
          _map.loationResult = result;
          _map.locationFinish();
          _locationManager.myLocPlugin.stopLocation();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> resultWidgets = [];

    if (_map.loationResult.locTime != null) {
      _map.loationResult.getMap().forEach((key, value) {
        resultWidgets.add(_resultWidget(key, value));
      });
    }

    return MaterialApp(
        home: Scaffold(
      appBar: BMFAppBar(
        title: '单次定位',
        isBack: true,
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: Column(children: [
        _createMapContainer(),
        Container(height: 20),
        SizedBox(
          height: MediaQuery.of(context).size.height - 500,
          child: ListView(
            children: resultWidgets,
          ),
        ),
        _createButtonContainer()
      ]),
    ));
  }

  Widget _createMapContainer() {
    return SizedBox(
        height: 300,
        child: BMFMapWidget(
          onBMFMapCreated: (controller) {
            _map.onBMFMapCreated(controller);
          },
          mapOptions: _map.initMapOptions(),
        ));
  }

  Widget _createButtonContainer() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
          onPressed: () {
            ///设置定位参数
            _locationManager.locationAction();
            _locationManager.startLocation();
          },
          child: const Text('开始定位'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent, //change background color of button
            onPrimary: Colors.yellow, //change text color of button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          )),
    );
  }

  Widget _resultWidget(key, value) {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$key:' ' $value'),
          ]);
  }
}