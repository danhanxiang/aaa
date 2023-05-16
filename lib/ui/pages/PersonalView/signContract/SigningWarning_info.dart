import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/signContract/SigningWarningService.dart';


class SigningWarning_info extends StatefulWidget {
  static const String routeName = '/igningWarning_info';

  @override
  State<SigningWarning_info> createState() => _SigningWarning_infoState();
}

class _SigningWarning_infoState extends State<SigningWarning_info> {
  String realName = '';

  String phone = '';

  String cardId = '';

  String bankId = '';

  String bankName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '签约信息'),
        body: content(context),
    );
  }

  getNextAction() {
    if (realName.isEmpty) {
      EasyLoading.showError('请输入真实姓名');
    }else if (phone.isEmpty){
      EasyLoading.showError('请输入手机号码');
    }else if (cardId.isEmpty) {
      EasyLoading.showError('请输入身份证号');
    }else if (bankId.isEmpty) {
      EasyLoading.showError('请输入银行卡号');
    }else if (bankName.isEmpty) {
      EasyLoading.showError('请输入发卡行名称');
    }else {
      saveBasic();
    }
  }
  
  /// 提交签约信息
  saveBasic(){
    SigningWarningService.saveSigningInfo(realName
    , phone, bankId, cardId, bankName, (object) {
      print(object);
      if (object.code == 200) {
        
      }else {
        EasyLoading.showError(object.message ?? '');
      }
    });
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        Expanded(child: list(context)),
        MainButton(text: '下一步', OnPressed: getNextAction,)
      ],
    );
  }

  Widget list(BuildContext context) {
    return EasyRefresh(
          enableControlFinishRefresh: true,
          enableControlFinishLoad: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  realNameWidget(context),
                  SizedBox(height: 16,),
                  iphoneWidget(context),
                  SizedBox(height: 16,),
                  cardWidget(context),
                  SizedBox(height: 16,),
                  bankNumWidget(context),
                  SizedBox(height: 16,),
                  bankNameWidget(context),
                ],
              ),
            ),
          ),
      );
  }

  Widget realNameWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      TextField(
        maxLength: 15,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
          counterText: '',
          hintText: '真实姓名',
          hintStyle: TextStyle(color: m_colors.content_02_color, fontSize: 15, fontWeight: FontWeight.w400),
          border: InputBorder.none
        ),
        onChanged: (value) {
          print(value);
          realName = value;
        },
      ),
      Divider(),
      SizedBox(height: 8),
      Row(children: [
          Image.asset('assets/images/my_signing_info.png', width: 15, height: 15),
          SizedBox(width: 4),
          Expanded(child: Text('为保障您实名认证成功，请填写真实姓名！', style: TextStyle(fontSize: 13, color: Color.fromRGBO(2251, 139, 57, 1)),))
        ])
    ]);
  }

  Widget iphoneWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          maxLength: 11,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            counterText: '',
            hintText: '手机号码',
            hintStyle: TextStyle(color: m_colors.content_02_color, fontSize: 15, fontWeight: FontWeight.w400),
            border: InputBorder.none
          ),
          onChanged: (value) {
            print(value);
            phone = value;
          }
        ),
        Divider(),
      ],
    );
  }

  Widget cardWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          maxLength: 18,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            counterText: '',
            hintText: '身份证号',
            hintStyle: TextStyle(color: m_colors.content_02_color, fontSize: 15, fontWeight: FontWeight.w400),
            border: InputBorder.none
          ),
          onChanged: (value) {
            print(value);
            cardId = value;
          }
        ),
        Divider(),
      ],
    );
  }

  Widget bankNumWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          // maxLength: 11,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            counterText: '',
            hintText: '银行卡号',
            hintStyle: TextStyle(color: m_colors.content_02_color, fontSize: 15, fontWeight: FontWeight.w400),
            border: InputBorder.none
          ),
          onChanged: (value) {
            print(value);
            bankId = value;
          }
        ),
        Divider(),
      ],
    );
  }

  Widget bankNameWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          keyboardType: TextInputType.phone,
          maxLength: 11,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            counterText: '',
            hintText: '发卡行名称',
            hintStyle: TextStyle(color: m_colors.content_02_color, fontSize: 15, fontWeight: FontWeight.w400),
            border: InputBorder.none
          ),
          onChanged: (value) {
            print(value);
            bankName = value;
          }
        ),
        Divider(),
      ],
    );
  }
}