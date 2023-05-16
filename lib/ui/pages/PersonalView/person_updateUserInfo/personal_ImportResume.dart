import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:file_picker/file_picker.dart';

class importResume extends StatelessWidget {
  static const String routeName = '/ImportResume';
  const importResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "上传简历"),
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
      padding: EdgeInsets.all(16),
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
              "手机上传", "打开手机文件管理中上传"),
          _createcellBtn("images/person/icon_person_updateResume_other.png",
              "从其他应用分享上传", "例如：wps，QQ，微信等")
        ],
      ),
    );
  }
}

Widget _createcellBtn(String imgURL, String title, String subTitle) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.fromLTRB(12, 14, 12, 14), //内边距
      margin: EdgeInsets.fromLTRB(0, 24, 0, 0), //外边距
      decoration: BoxDecoration(
          color: Colors.white,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //设置四周边框
          border: Border.all(width: 1, color: Color.fromRGBO(237, 239, 241, 1)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 3.0), //阴影xy轴偏移量
                blurRadius: 10.0, //阴影模糊程度
                spreadRadius: 0.0 //阴影扩散程度
                )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imgURL,
                width: 34,
                height: 34,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: m_colors.title_01_color)),
                  SizedBox(
                    height: 4,
                  ),
                  Text(subTitle,
                      style: TextStyle(
                          fontSize: 12, color: m_colors.content_02_color)),
                ],
              )
            ],
          ),
          Image.asset(
            "images/person/icon_person_meau_arrow.png",
            width: 24,
            height: 24,
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
          updatePhoneFile();
          break;
        default:
      }
    },
  );
}

updateWX() {
  // WeChatLaunchMiniProgramResponse.fromMap();
  //WeChatLaunchMiniProgramResponse response =

  // WeChatOpenBusinessViewResponse.fromMap({
  //   "openid": "gh_33ffbefbd529",
  //   "businessType": "1",
  // });

  // WXLaunchMiniProgramReq
}
updatePhoneFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "pdf",
        "doc",
        "docx",
        "txt",
        "odt",
        "RTF",
        "HTML",
        "JPG"
      ]);

  if (result != null) {
    PlatformFile file = result.files.first;
    print(file.name);
    print(file.bytes);
    print(file.size);
    print(file.extension);
    print(file.path);
    //print(result.files.single.path);
    //File file = File(result.files.single.path);
  } else {
    // User canceled the picker
  }
}
