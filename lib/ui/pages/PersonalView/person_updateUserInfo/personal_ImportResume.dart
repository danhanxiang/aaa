import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/WchatManager.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/model/UploadFilesManager.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/person_updateUserInfo/personal_Guide.dart';

class importResume extends StatelessWidget {
  static const String routeName = '/ImportResume';
  const importResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "上传简历", color: Colors.white),
      backgroundColor: Colors.white,
      body: _cellview(),
    );
  }
}

class _cellview extends StatelessWidget {
  const _cellview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "任选一种方式上传简历",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: m_colors.title_01_color),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "支持pdf,doc,docx,txt,odt,RTF,HTML,JPG格式文件文件需要小7M",
            style: TextStyle(fontSize: 13, color: m_colors.content_02_color),
          ),
          _createcellBtn("images/person/icon_person_updateResume_wx.png",
              "微信上传", "微信上传，选择附件上传简历"),
          _createcellBtn("images/person/icon_person_updateResume_phone.png",
              "手机上传", "打开手机文件管理中上传", context: context),
          _createcellBtn("images/person/icon_person_updateResume_other.png",
              "从其他应用分享上传", "例如：wps，QQ，微信等", context: context)
        ],
      ),
    );
  }

  Widget _createcellBtn(String imgURL, String title, String subTitle, {BuildContext? context}) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(12.px, 14.px, 12.px, 14.px), //内边距
        margin: EdgeInsets.fromLTRB(0, 24.px, 0, 0), //外边距
        decoration: BoxDecoration(
            color: Colors.white,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            //设置四周边框
            border: Border.all(width: 1, color: Color.fromRGBO(237, 239, 241, 1)),
            boxShadow: [
              BoxShadow(
                color: m_colors.shadowsColor,
                offset: Offset(0, 3), // 阴影位置 从什么位置开始
                blurRadius: 10, // 阴影模糊层度
                spreadRadius: 0,//阴影模糊大小
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imgURL,
                  width: 34.px,
                  height: 34.px,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10.px),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 15.px,
                            fontWeight: FontWeight.w600,
                            color: m_colors.title_01_color)),
                    SizedBox(
                      height: 4.px,
                    ),
                    Text(subTitle,
                        style: TextStyle(
                            fontSize: 12.px, color: m_colors.content_02_color)),
                  ],
                )
              ],
            ),
            Image.asset(
              "images/person/icon_person_meau_arrow.png",
              width: 24.px,
              height: 24.px,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      onTap: () {
        switch (title) {
          case "微信上传":
            updateWX();
            break;
          case "手机上传":
            updatePhoneFile(context!);
            break;
          case "从其他应用分享上传":
            Navigator.of(context!).pushNamed(personal_Guide.routeName);
            break;
          default:
        }
      },
    );
  }


  updateWX() {
    WchatManager.initFluWeChatMiniProgram();
  }

  updatePhoneFile(BuildContext context)  {
    UploadFilesManager.selectFile((file) {
      if (file != null) {
        showWriteDaily(context, file);
      }
    });
  }

    ///  弹框写日报
  showWriteDaily(BuildContext context, PlatformFile file){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('简历上传'),
            content: Text('是否将简历上传到天天数链开发者'),
            backgroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            actions: <Widget>[
              ElevatedButton(
                child: Text('取消'),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Text('确认'),
                onPressed: () {
                  UploadFilesManager.uploadFile(file, (object) {

                  });
                },
              ),
            ],
          );
        }
      );
  }
}