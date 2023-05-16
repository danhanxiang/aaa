import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/signContract/SigningWarning_info.dart';
import 'package:people_living_flutterdemo/ui/widget/sheet.dart';

class SigningWarning extends StatelessWidget {
  static const String routeName = '/signingWarning';
  final List<String> list = ['strtr'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: m_AppBar(context, '签约须知'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(child: content(context)),
          SizedBox(height: 8),
          
          MainButton(text:'去签约', OnPressed: (){
            showSigningAlertDialog(context, (){
              Navigator.of(context).pushNamed(SigningWarning_info.routeName);
            });
          })
        ],
        )
    );
  }
// TextButton(onPressed: (){}, child: Text('去签约'))
  Widget content(BuildContext context) {
    return EasyRefresh(
          enableControlFinishRefresh: true,
          enableControlFinishLoad: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  topView(context),
                  SizedBox(height: 24),
                  sectionView(context)
                ],
              ),
            ),
          ),
      );
  }

  Widget topView(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 249, 241, 1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Icon(Icons.ac_unit),
          Image.asset('assets/images/signing_icon.png', width: 20, height: 20,),
          SizedBox(width: 8),
          Expanded(child: 
            Text('恭喜您已经通过入驻审核，现在需要您签署一份灵活用工协议，用于结算服务费，完成签署后即可开启接单。', 
              style: TextStyle(color: Color.fromRGBO(251, 139, 57, 1), fontSize: 12))
          )
        ],
      ),
    );
  }

  Widget sectionView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('如何签约?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topDownWidget('my_signing_tianxie.png', '填写签约信息', context),
            topDownWidget('my_signing_hezuo.png', '填写签约信息', context),
            topDownWidget('my_signing_renzheng.png', '填写签约信息', context)
          ],
        ),
        SizedBox(height: 32),
        cell('Step1 填写签约信息', '本平台会收集您的真实身份信息（真实姓名、手机号、身份证号码）以完成验证，为了发放服务费，还需额外收集您的银行卡信息。', context),
        cell('Step2 签署合作协议', '合作协议是由湖南迅基与您签订，湖南迅基是一家人力资源公司，平台委托该公司办理灵活用工协议并统一结算服务费，请您仔细确认协议条款，并完成手写签署。', context),
        cell('Step3 完成实名认证', '通过法大大进行实名认证，需额外提供身份证照片，在完成实名认证后，可获得由国家授权机构颁发的、可验证身份的数字证书（CA），完成电子合同签署。', context),
      ],
    );
  }

  Widget cell(String title, String detail,BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          SizedBox(height: 32,),
          Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: m_colors.title_01_color)),
          SizedBox(height: 8),
          Text(detail, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: m_colors.content_02_color)),
          SizedBox(height: 24),
        ],
    );
  }

  Widget topDownWidget(String iconName, String title, BuildContext context) {
    return Column(children: [
      Image.asset('assets/images/$iconName', width: 48, height: 48,),
      SizedBox(height: 8),
      Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))
    ],);
  }
}