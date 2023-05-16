import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/components/m_AppBar.dart';
import '../../../core/components/m_mainButton.dart';
import '../../../core/service/userLogin_api/user_Login.dart';
import '../../../../ProjectConfig/m_colors.dart';
import '../main/main.dart';

class CodePhoneView extends StatefulWidget {
  CodePhoneView({Key? key}) : super(key: key);
  static const String routeName = '/codePhone';
  @override
  State<CodePhoneView> createState() => _CodePhoneViewState();
}

class _CodePhoneViewState extends State<CodePhoneView> {
  //FocusNode _focusNode = FocusNode(); //创建FocusNode对象实例
  TextEditingController _codePhoneController = TextEditingController();
  TextEditingController _CodeStringController = TextEditingController();

  bool isDisablebtn = false;

  /// 是否能输入文字 默认可以输入
  bool isEnabled = true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    // if (_timer != null) {
    //   _timer.cancel();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "验证码登录", color: Colors.white),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "手机验证码登录/注册",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: m_colors.title_01_color),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldPage("电话号码", isEnabled, _codePhoneController, (value) {
                  setState(() {
                    isDisablebtn = value.length == 11;
                  });
                }),
                SizedBox(
                  height: 22,
                ),
                TextFieldCodePage("验证码", isDisablebtn, _CodeStringController,
                    (value) {
                  setState(() {
                    isEnabled = value;
                    isDisablebtn = value;
                  });
                  if (value == false) {
                    sendCode();
                  }
                }),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.check_circle,
                        size: 18,
                        color: m_colors.backColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("我已阅读并同意",
                        style: TextStyle(
                            fontSize: 14, color: m_colors.title_01_color)),
                    GestureDetector(
                      child: Text(
                        "《隐私权限》",
                        style:
                            TextStyle(fontSize: 14, color: m_colors.backColor),
                      ),
                      onTap: () {},
                    ),
                    Text("和",
                        style: TextStyle(
                            fontSize: 14, color: m_colors.title_01_color)),
                    GestureDetector(
                      child: Text("《用户协议》",
                          style: TextStyle(
                              fontSize: 14, color: m_colors.backColor)),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 17, 16, 17),
              child: m_Button(
                text: "登录",
                OnPressed: () {
                  login();
                },
              ),
            ),
            bottom: iskeyBoard(),
            left: 0,
            right: 0,
            height: 88,
          )
        ],
      ),
    );
  }

  /// 发送验证码
  sendCode() {
    print('发送');
    EasyLoading.show(status: "发送中...");
    LoginService.GetSendCode(_codePhoneController.text, (object) {
      if (object.isSuccess) {
        if (object.code == 99995) {
          EasyLoading.showToast("同一手机同一客户端60s内不能重复获取验证码");
        } else {
          EasyLoading.showToast("验证码已发送，请注意查收");
        }
      } else {
        EasyLoading.showToast(object.message!);
      }
    });
  }

  // 验证码登录
  login() {
    print("-------验证码登录-----");
    FocusScope.of(context).requestFocus(FocusNode());
    if (_codePhoneController.text.length > 0 && _CodeStringController.text.length > 0) {
      EasyLoading.show(status: "登录中...");
      LoginService.PostCodeLogin(
          _codePhoneController.text, _CodeStringController.text, (object) {
        if (object.isSuccess) {
          if (object.code == 200 && object.data['access_token'].toString().isNotEmpty) {
            print("-------获取用户数据-----");
            LoginService.GetDevUserInfo((object) {
              if (object.isSuccess) {
                EasyLoading.showToast('登录成功');
                // print("登录");
                // Navigator.of(context).pushNamed(BKMainScreen.routeName);
                Navigator.of(context).pushReplacementNamed(BKMainScreen.routeName);
              } else {
                EasyLoading.showToast(object.message!);
              }
            });
          }
        } else {
          EasyLoading.showToast(object.message!);
        }
      });
    } else {
      EasyLoading.showToast("请输入验证码");
    }
  }

  double iskeyBoard() {
    if (MediaQuery.of(context).viewInsets.bottom > 30) {
      return MediaQuery.of(context).viewInsets.bottom;
    } else {
      return 30;
    }
  }
}

class TextFieldPage extends StatefulWidget {
  TextFieldPage(@required this.hintText, this.isEnabled, this.controller,
      @required this.onChanged);
  String? hintText;
  bool isEnabled = true;
  TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        //focusNode: _focusNode,
        enabled: widget.isEnabled,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(11)],
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: m_colors.content_02_color),
          border: InputBorder.none,
        ),
        style: TextStyle(fontSize: 16, color: m_colors.title_01_color),
        onChanged: widget.onChanged,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: m_colors.divider_02_color))),
    );
  }
}

class TextFieldCodePage extends StatefulWidget {
  TextFieldCodePage(this.hintText, this.isDisablebtn, @required this.controller,
      @required this.onChanged);
  String hintText = "验证码";
  bool isDisablebtn = false;
  TextEditingController controller;

  Function(bool) onChanged;

  @override
  State<TextFieldCodePage> createState() => _TextFieldCodePageState();
}

class _TextFieldCodePageState extends State<TextFieldCodePage> {
  bool istimer = false;
  int timerSec = 5;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            child: TextField(
              //focusNode: _focusNode,
              controller: widget.controller,
              keyboardType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(6)],
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(color: m_colors.content_02_color),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 16, color: m_colors.title_01_color),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: widget.isDisablebtn
                  ? MaterialStateProperty.all(m_colors.backColor)
                  : MaterialStateProperty.all(m_colors.disableColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: widget.isDisablebtn
                ? () {
                    sendCode();
                  }
                : null,
            child: Text(istimer ? "${timerSec}秒" : "获取验证码"),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: m_colors.divider_02_color))),
    );
  }

  sendCode() {
    istimer = true;
    widget.isDisablebtn = false;
    widget.onChanged(false);

    _timer = Timer.periodic(const Duration(seconds: 1), ((timer) {
      setState(() {
        timerSec--;
      });

      if (timerSec <= 0) {
        _timer.cancel();
        istimer = false;
        timerSec = 5;
        widget.onChanged(true);
      }
    }));
  }
}
