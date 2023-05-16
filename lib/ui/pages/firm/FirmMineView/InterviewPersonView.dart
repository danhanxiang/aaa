import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../core/components/m_mainButton.dart';
import '../../../../core/components/m_textFiled.dart';
import '../../../../core/models/FirmMineModel/company_info_entity.dart';

class InterviewPersonView extends StatefulWidget {
  static const String routeName = 'firmmine/interview_person';

  const InterviewPersonView({Key? key}) : super(key: key);

  @override
  State<InterviewPersonView> createState() => _InterviewPersonViewState();
}

class _InterviewPersonViewState extends State<InterviewPersonView> {
  String mName = ''; //名字
  String mEmail = ''; //邮箱
  String mPhone = ''; //手机号
  String mPosition = ''; //职位
  String mAddress = '';//地址

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCompanyInfoApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "邀请成员"),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: const Text(
                      '邀请公司成员',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      mName = value;
                    });
                  },
                  hintText: "请输入姓名",
                  TextEditingtext: mName,
                ),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      mPhone = value;
                    });
                  },
                  hintText: "请输入手机号",
                  TextEditingtext: mPhone,
                ),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      mPosition = value;
                    });
                  },
                  hintText: "请输入职位",
                  TextEditingtext: mPosition,
                ),
                m_textFiled(
                  onChanged: (value) {
                    setState(() {
                      mEmail = value;
                    });
                  },
                  hintText: "请输入邮箱",
                  TextEditingtext: mEmail,
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Text(
                      mAddress,
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ))
              ],
            ),
          ),
          Positioned(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(16, 17, 16, 17),
              child: m_Button(
                text: "立即邀请",
                OnPressed: () {
                  if (isValidation()) {
                    inviteMembers(context, mEmail, mPhone, mPosition, mName);
                  }
                },
              ),
            ),
            bottom: iskeyBoard(),
            left: 0,
            right: 0,
            height: 80,
          )
        ],
      ),
    );
  }

  saveData(Function() onSuccess) {}

  bool isValidation() {
    if (mName.isEmpty) {
      EasyLoading.showToast("名字不能为空");
      return false;
    } else if (mPhone.isEmpty) {
      EasyLoading.showToast("手机号不能为空");
      return false;
    } else if (mPosition.isEmpty) {
      EasyLoading.showToast("职位不能为空");
      return false;
    } else if (mEmail.isEmpty) {
      EasyLoading.showToast("邮箱不能为空");
      return false;
    } else {
      return true;
    }
  }

  double iskeyBoard() {
    if (MediaQuery.of(context).viewInsets.bottom > 30) {
      return 30 + MediaQuery.of(context).viewInsets.bottom - 30;
    } else {
      return 30;
    }
  }

  void inviteMembers(BuildContext context, String email, String mobile,
      String position, String realName) {
    FirmMineService.inviteMembersApi(email,mobile, position, realName,(object) => () {
              if (object.isSuccess) {
                Navigator.of(context).pop();
              }else {
                EasyLoading.showToast(object.message ?? '请求错误！');
              }
            });
  }

  void getCompanyInfoApi(){
    FirmMineService.getCompanyInfoApi( (object) {
      if (object.isSuccess) {
        setState(() {
          CompanyInfoData bean = object.data;
          mAddress = bean.address??'';
        });

      } else {
        EasyLoading.showToast(object.message ?? '请求错误！');
      }
    });
  }
}
