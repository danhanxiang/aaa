/*
components	放置全局共用组件
router	全局路由管理
service	管理接口请求并对返回数据进行处理，复杂功能逻辑处理
utile	工具类，例如：接口请求工具类，数据持久化工具类，加密解密工具类……
pages	界面管理，实现界面UI绘制的代码逻辑
jsons  json->model 自动化管理工具  创建json源文件
models  json->model 自动化管理工具  生成文件为models  生成命令 flutter packages pub run json_model
json_model 使用方法  https://github.com/flutterchina/json_model
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:people_living_flutterdemo/core/router/router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import 'package:people_living_flutterdemo/ui/shared/app_theme.dart';

import '../ProjectConfig/Navigate/NavigateService.dart';
import '../ProjectConfig/Navigate/service_locator.dart';
import 'ui/shared/app_size_fit.dart';

void main() {
  setupLocator(); //注册NavigatorState 实例
  User.init().then((value) {
    // runApp(BKMyApp());
    runApp(MyApp());
  });
}

/** 页面跳转有2种方式
 * 1: Navigator.push  
 * Navigator.push(
          context!,
          MaterialPageRoute(builder: (_) => MapLocation())
        );
 
 * 2: routes 路由形式 参考 NavMyApp
 *   添加routes跳转页面的路由
 * 
*/

class MyApp extends StatelessWidget {
  final ThemeData theme = ThemeData();
  
  @override
  Widget build(BuildContext context) {
    // 初始化手机大小
    BKSizeFit.initialize();
    
    return MaterialApp(
      title: '天天数链',
      debugShowCheckedModeBanner: false, //隐藏右上角debug 标签
      initialRoute: MyRouter.initialRoute, //初始化加载路由
      // 主题设置
      theme: BKAppThteme.norTheme,
      // 暗黑主题设置
      // darkTheme: BKAppThteme.darkTheme,
      
      // routes: MyRouter.routes, 
      onGenerateRoute: MyRouter.onGenerateRoute, // 如果没有routes就会执行
      navigatorKey: getIt<NavigateService>().key,
      builder: (BuildContext context, Widget? child) {
        print('手机宽:${BKSizeFit.screenWidth}');
        return Material(
          //全局加载弹窗初始化，其他地方就直接显示和消失就可以了 
          child: FlutterEasyLoading(child: child),
        );
      },
    );
  }
}

class MineImagesPage extends StatefulWidget {
  const MineImagesPage({Key? key}) : super(key: key);
 
  @override
  State<MineImagesPage> createState() => _MineImagesPageState();
}
 
class _MineImagesPageState extends State<MineImagesPage> {
  final picker = ImagePicker();
  XFile? _imageFile;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImagePicker"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: showPicker, child: const Text("底部弹出选择")),
            ElevatedButton(onPressed: _takePhoto, child: const Text("拍照")),
            ElevatedButton(onPressed: selectImag, child: const Text("打开相册")),
            this._imageFile == null
                ? Text("请选择图片")
                : Image.file(File(_imageFile!.path))
          ],
        ),
      ),
    );
  }
 
  //弹出选择相册/拍照对话框
  showPicker() {
    //底部弹出
    showModalBottomSheet(
        context: context,
        builder: (BuildContext con) => Container(
          height: 160,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: ((){
                    _takePhoto();
                  }),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text('拍照'),
                  ),
                ),
                GestureDetector(
                  onTap: ((){
                    _openGallery();
                  }),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text('相册'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
 
  //拍照
  _takePhoto() async {
    XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
 
    if (pickedFile != null) {
      print(pickedFile.path);
      print(File(pickedFile.path));
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }
  //打开文件夹
  _openGallery() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 600,
      maxWidth: 600);
 
    if (pickedFile != null) {
      print(pickedFile.path);
      print(File(pickedFile.path));
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future selectImag() async {
    // picker.pickImage(source: ImageSource.gallery);
    //     if (await Permission.camera.request().isGranted) {
    //   ///如果相机权限申请成功，下面写接下来要做的处理
    //   //do some thing...
    // } else {
    //  ///如果相机权限申请失败，下面给出提示
    //  //OwonToast.show(S.of(context).permission_no_camera);
    // }

    print("000000");
    
    // final onceimages = await picker.getImage(source: ImageSource.gallery);
    final onceimages = await picker.pickImage(source: ImageSource.gallery);
    print("222$onceimages");
    if (onceimages != null) {
      // _userImage = File(onceimages.path);
      print(File(onceimages.path));
    }
  }
}