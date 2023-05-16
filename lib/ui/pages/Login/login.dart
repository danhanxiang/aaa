import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/ProjectConfig/ProjectConfig.dart';
import 'package:people_living_flutterdemo/utils/log.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';

import 'package:umeng_common_sdk/umeng_common_sdk.dart';
import 'package:umeng_verify_sdk/umeng_verify_sdk.dart';
import 'dart:io' show Platform;
import 'package:people_living_flutterdemo/core/service/userLogin_api/user_Login.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/service_locator.dart';
import 'package:people_living_flutterdemo/ProjectConfig/Navigate/NavigateService.dart';

import '../main/Tabs.dart';
import 'login_codePhone.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
  static const String routeName = '/login';
}

class _LoginViewState extends State<LoginView> {
  //背景视频
  late VideoPlayerController _controller;

  //final screenSize = MediaQuery.of(context).size;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //登录背景视频
    _controller = VideoPlayerController.asset('images/Launch.mp4')
      ..initialize().then((value) {
        setState(() {});
        _controller.play(); //开始播放
        _controller.setLooping(true); //循环播放
      });
    initPlatformState();
  }

  // final TextEditingController _controller = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.pause();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Transform.scale(
            scale: _controller.value.aspectRatio /
                MediaQuery.of(context).size.aspectRatio,
            child: Center(
              child: Container(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const Text('正在初始化'),
              ),
            ),
          ),
          Positioned(
              child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                left: 30,
                right: 30,
                bottom: 160,
                child: Text(
                  "远程办公时代，从这里接入未来。",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                  maxLines: 2,
                ),
              ),
              LoginBtnView(),
            ],
          )),
        ],
      ),
    );
  }

  Future<void> initPlatformState() async {
    UmengCommonSdk.setPageCollectionModeManual();

    UmengCommonSdk.initCommon(
        ProjectConfig.AndroidKey, ProjectConfig.iOSKey, 'Umeng');
    UmengVerifySdk.setVerifySDKInfo(
            ProjectConfig.AndroidUMKey, ProjectConfig.iOSUMKey)
        .then((map) {
      if (map["resultCode"] == '600000') {
      } else {

      }
      print("sdkInfo:${map}");
    });

    ///设置getLoginToken回调
    UmengVerifySdk.getLoginTokenCallback((result) {
      // print("resultDic:${result}");
      // print("token:${result["token"]}");
      if (result['resultCode'] == '600000') {
        if (result['token'] != null) {
          initGetLogin(result['token']);

          UmengVerifySdk.cancelLoginVCAnimated(true);
        }
      } else if (result['resultCode'] == '700001') {
        Navigator.of(context).pushNamed(CodePhoneView.routeName);
        UmengVerifySdk.cancelLoginVCAnimated(true);
      }
    });

    UmengVerifySdk.getWidgetEventCallback((result) {
      print("resultDic:${result}");
    });

    UmengVerifySdk.setTokenResultCallback_android((result) {
      print("setTokenResultCallback_android: $result");
      if (result["code"] == "600000") {
        UmengVerifySdk.quitLoginPage_android();
      }
    });

    UmengVerifySdk.setUIClickCallback_android((result) {
      print("setUIClickCallback_android: $result");
    });

    //TODO: ios only
    /**
   *  ios only
   *  检查当前环境是否支持一键登录或号码认证，resultDic 返回 PNSCodeSuccess 说明当前环境支持
   *  @param  authType 服务类型 UMPNSAuthTypeVerifyToken 本机号码校验流程，UMPNSAuthTypeLoginToken 一键登录流程,默认UMPNSAuthTypeLoginToken
   *  @param  complete 结果异步回调到主线程，成功时resultDic=@{resultCode:600000, msg:...}，其他情况时"resultCode"值请参考PNSReturnCode，只有成功回调才能保障后续接口调用
   */
    if (Platform.isIOS) {
      UmengVerifySdk.checkEnvAvailableWithAuthType_ios(
              'UMPNSAuthTypeLoginToken')
          .then((map) {
        if (map["resultCode"] == "600000") {
          print("检查当前环境是否支持一键登录:${map}");
        } else {
          Navigator.of(context).pushNamed(CodePhoneView.routeName);
          EasyLoading.showToast("当前环境不支持一键登录,请使用验证码登录");
        }
      });
    }

    //TODO: android only
    // UmengVerifySdk.checkEnvAvailable_android(UMEnvCheckType.type_login);
    // UmengVerifySdk.register_android();

    //String? VerifyId = await UmengVerifySdk.getVerifyId();
    //print('VerifyId：' + VerifyId!);
    //String? carrierName = await UmengVerifySdk.getCurrentCarrierName();
    //print('carrierName：' + carrierName!);

    String platformVersion;
    String VerifyVersion;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = (await UmengCommonSdk.platformVersion)!;
    } catch (e) {
      platformVersion = 'Failed to get platform version.';
    }

    VerifyVersion = (await UmengVerifySdk.VerifyVersion)!;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }
}

class LoginBtnView extends StatelessWidget {
  const LoginBtnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainButton(
        text: '开始',
        OnPressed: () {
          bkLog('message', StackTrace.current);
          UMCustomModel uiConfig = UMCustomModel();
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;

          if (Platform.isIOS) {
            uiConfig.backgroundColor_ios = Colors.white.value;
            uiConfig.alertTitleBarColor_ios = Colors.white.value;
            uiConfig.alertTitle_ios = [
              '',
              Colors.white.value,
              12.0
            ]; //标题栏title设置nil
            uiConfig.alertCloseImage_ios = 'icon_login_off'; //关闭按钮图片设置
            uiConfig.alertCloseItemFrame_ios = [
              screenWidth - 55,
              20,
              30,
              30,
            ]; //关闭按钮frame

            //电话号码显示frame
            double width = 194.0;
            uiConfig.numberFrame = [(screenWidth - width) / 2, 80, width, 60];
            uiConfig.numberFont = 36; //号码字体大小

            uiConfig.sloganFrame = [(screenWidth - width) / 2, 118, width, 60];
            uiConfig.loginBtnFrame = [20, 230, -1, screenWidth - 40, 54];
            uiConfig.loginBtnText = [
              '',
              Colors.white.value,
              16
            ]; //登录按钮  这里设置成一张图片了 所以文字为nil

            uiConfig.loginBtnBgImgs_ios = [
              'LargeButton',
              'LargeButton',
              'LargeButton'
            ];
            double changeBtnWidth = 140.0;
            uiConfig.changeBtnFrame = [
              (screenWidth - changeBtnWidth) / 2,
              310,
              changeBtnWidth,
              40.0,
            ];

            uiConfig.changeBtnTitle = ['其他手机号码登录', Colors.black.value, 16];
            uiConfig.checkBoxIsChecked = true; //协议默认勾选
            uiConfig.checkBoxIsHidden = true;
            uiConfig.privacyOne = ['《天天数链开发者用户协议》', ProjectConfig.YHXY];
            //'点击一键登录并登录或更换手机号，表示您已阅读',
            uiConfig.privacyConectTexts = ['》和'];
            uiConfig.privacyPreText = '点击一键登录并登录或更换手机号，表示您已阅读《';
            uiConfig.privacySufText = '并同意其中全部内容';
            uiConfig.privacyColors = [Colors.grey.value, Colors.black.value];
            uiConfig.hideNavBackItem = true; //隐藏导航栏
            uiConfig.alertBlurViewAlpha_ios = 0.3;
            uiConfig.contentViewFrame = [
              1,
              340,
              screenWidth - 2,
              screenHeight - 340.0
            ]; //弹窗大小

          } else {
            Navigator.of(context).pushNamed(CodePhoneView.routeName);
            /*
            uiConfig.contentViewFrame = [-1, -1, 320, 640];
            uiConfig.alertTitleBarFrame_ios = [80, 100, 260, 500];
//uiConfig.animationDuration_ios=0;
            uiConfig.alertBlurViewColor_ios = Colors.red.value;
            uiConfig.alertBlurViewAlpha_ios = 0.8;
            uiConfig.alertTitle_ios = ["aaaabbb", Colors.red.value, 20];
            uiConfig.navColor = Colors.orange.value;
            uiConfig.loginBtnText = ["一键登录1", Colors.orange.value, 20];
            uiConfig.privacyOne = ["协议1", "https://www.umeng.com"];
            UMCustomWidget customButton =
                UMCustomWidget("button1", UMCustomWidgetType.button);
            //  customButton.widgetId="button1";
            // customButton.type=UMCustomWidgetType.button;
            customButton.title = "Btn";
            customButton.titleFont = 20;
            customButton.textAlignment = UMCustomWidgetTextAlignmentType.right;
            customButton.left = 20;
            customButton.top = 20;
            customButton.width = 200;
            customButton.height = 50;
            customButton.backgroundColor = Colors.red.value;
            customButton.titleColor = Colors.black.value;
            customButton.isClickEnable = false;
            customButton.btnBackgroundResource_android = "btn_selector";
            customButton.rootViewId = UMRootViewId.body;
            UMCustomWidget customButton1 =
                UMCustomWidget("button2", UMCustomWidgetType.button);
            //   customButton1.widgetId="button2";
            //  customButton1.type=UMCustomWidgetType.button;
            customButton1.left = 100;
            customButton1.top = 530;
            customButton1.width = 200;
            customButton1.height = 50;
            customButton1.titleColor = Colors.red.value;
            customButton1.title = "自定义控件2";
            customButton1.backgroundColor = Colors.blue.value;
            customButton1.rootViewId = UMRootViewId.title_bar;

            UMCustomWidget customTextView =
                UMCustomWidget("textView", UMCustomWidgetType.textView);
            //  customButton2.widgetId="textView";
            //  customButton2.type=UMCustomWidgetType.textView;
            customTextView.left = 20;
            customTextView.top = 20;
            customTextView.width = 200;
            customTextView.height = 200;
            customTextView.title = "自\n定\n义\n控\n件\nTV";
            customTextView.titleFont = 50;
            customTextView.textAlignment =
                UMCustomWidgetTextAlignmentType.center;
            customTextView.titleColor = Colors.black.value;
            customTextView.backgroundColor = Colors.red.value;
            customTextView.isClickEnable = false;
            customTextView.isShowUnderline = true;
            customTextView.isSingleLine = false;
            customTextView.lines = 3;
            customTextView.rootViewId = UMRootViewId.number;

            uiConfig.customWidget = [
              customButton.toJsonMap(),
              customButton1.toJsonMap(),
              customTextView.toJsonMap()
            ];
            */
          }

          UmengVerifySdk.accelerateLoginPageWithTimeout(3).then((result) {
            print("登录加速结果 $result");
            if (result['resultCode'] == '600000') {
              UmengVerifySdk.getLoginTokenWithTimeout(3, uiConfig);
            }else {
               Navigator.of(context).pushNamed(CodePhoneView.routeName);
            }
          });
        });
  }
}

//获取用户电话号码
void initGetLogin(String token) {
  EasyLoading.show(status: '登录中...');
  LoginService.GetUserLoginPhone('Developer_APP', token, (object) {
    if (object.isSuccess) {
      if (object.code == 200 &&
          object.data['access_token'].toString().isNotEmpty) {
        LoginService.GetUserInfo((object) {
          if (object.isSuccess) {
            getIt<NavigateService>().pushNamed(Tabs.routeName);
            EasyLoading.showToast('登录成功');

          } else {
            EasyLoading.showToast(object.message!);
          }
        });
      }
    } else {
      EasyLoading.showToast(object.message!);
    }
  });
}
