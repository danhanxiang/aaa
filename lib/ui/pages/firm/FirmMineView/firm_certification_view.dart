import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import 'package:people_living_flutterdemo/core/service/firm_position_api/firm_position_api.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/firm_search_company_view.dart';
import 'package:people_living_flutterdemo/ui/pages/firm/FirmMineView/new_company_view.dart';
import '../../../../ProjectConfig/user_manager.dart';
import '../../../../core/components/m_mainButton.dart';
import '../../../../core/components/m_textFiled.dart';
import 'package:people_living_flutterdemo/ProjectConfig/tools.dart';
import '../../../../core/models/FirmMineModel/search_company_info_entity.dart';
import '../../../../core/models/otherModel/Province.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../core/service/personal_api/personal_api.dart';
import '../../../widget/SectionCellView.dart';

//企业认证
class firm_certification_view extends StatefulWidget {
  static const String routeName = '/firm/firm_certification';

  firm_certification_view({Key? key, required this.StateMap}) : super(key: key);
  Map StateMap;

  @override
  State<firm_certification_view> createState() =>
      _firm_certification_viewState();
}

class _firm_certification_viewState extends State<firm_certification_view> {
  String mRealName = ''; //名字
  String mCompanyId = ""; //公司id
  String mCompanyName = ""; //公司名称
  String mPosition = ""; //职位名称
  String mMobile = ""; //手机号
  String mEmail = ''; //培养方式id
  String mEmailCode = ""; //培养方式
  String mAddress = ''; //工作年限id

  late List<Province> proLists;

  //区域
  String initProvince = '', initCity = '', initTown = '';
  String chooseProvinceID = '', chooseCityID = '', chooseTownID = '';
  Map multiData = new Map();
  SearchCompanyInfoData searchBean = SearchCompanyInfoData();
  late TextEditingController _searchController;
  String type = ''; //是否是 更换企业，默认是不跟换 false
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonalService.postCityList((object) {
      if (object.isSuccess) {}
    });

    _searchController = TextEditingController();

    mRealName = User.userInfo.realName ?? '';
    mMobile = User.userInfo.mobile ?? '';

    //地区数据源
    proLists = User.provinceList;
    multiData = m_tools.getProvince(proLists);

    type = widget.StateMap['type'];
    if (type == "1") {
      // 发布职位页面过来的，
      setState(() {});
    } else if (type == "2") {
      setState(() {
        searchBean = widget.StateMap['searchBean'];
        mCompanyName = searchBean.companyName ?? '';
        mCompanyId = searchBean.id.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, type == "1" ? "更换企业账户" : "升级企业账户"),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: 60),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  m_textFiled(
                    hintText: "请输入您的真实姓名",
                    TextEditingtext: mRealName,
                    onChanged: (value) {
                      setState(() {
                        mRealName = value;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: m_colors.divider_02_color))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Text(
                            mCompanyName.isEmpty ? '请选择所属公司' : mCompanyName,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(firm_search_company_view.routeName);
                          },
                        ),
                        GestureDetector(
                          child: const Text(
                            '新建公司',
                            style: TextStyle(
                                color: m_colors.backColor, fontSize: 14),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(new_company_view.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                  m_textFiled(
                    hintText: "请输入您当前的职位(可选)",
                    TextEditingtext: mPosition,
                    onChanged: (value) {
                      setState(() {
                        mPosition = value;
                      });
                    },
                  ),
                  Container(
                    width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: m_colors.divider_02_color))),
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Text(
                        mMobile,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 200,
                          child: TextField(
                            //focusNode: _focusNode,
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: '邮箱',
                              hintStyle:
                                  TextStyle(color: m_colors.content_02_color),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                                fontSize: 16, color: m_colors.title_01_color),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                m_colors.disableColor),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              mEmail = _searchController.text.toString();
                            });
                            getEmailCode(mCompanyId, mEmail);
                          },
                          child: Text("获取验证码"),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: m_colors.divider_02_color))),
                  ),
                  m_textFiled(
                    hintText: "请输入您的邮箱验证码",
                    TextEditingtext: mEmailCode,
                    onChanged: (value) {
                      setState(() {
                        mEmailCode = value;
                      });
                    },
                  ),
                  m_textFiledBtn(
                    onTap: () {
                      Pickers.showMultiLinkPicker(
                        context,
                        data: multiData,
                        selectData: [initProvince, initCity, initTown],
                        columeNum: 3,
                        suffix: ['', '', ''],
                        pickerStyle: ClosePickerStyle(
                            haveRadius: true, title: "请选择当前居住地"),
                        onChanged: (p, index) {
                          setState(() {
                            initProvince = p[0];
                            initCity = p[1];
                            initTown = p[2];
                            List list =
                                m_tools.getIndexProvince(proLists, index);
                            chooseProvinceID = list[0];
                            chooseCityID = list[1];
                            chooseTownID = list[2];
                          });
                          print(p);
                          print(index);
                        },
                      );
                    },
                    hintText: "请选择当前居住地",
                    TextEditingtext: initProvince.isEmpty
                        ? '请选择所在区域'
                        : "$initProvince-$initCity-$initTown",
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: const [
                        Text(
                          '该地址作为联系您和寄回纸质协议等使用',
                          style: TextStyle(
                              color: m_colors.color_FB8B39, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  m_textFiled(
                    TextEditingtext: mAddress,
                    onChanged: (value) {
                      setState(() {
                        mAddress = value;
                      });
                    },
                    hintText: "请输入详细地址",
                    InputType: TextInputType.number,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      children: const [
                        Text(
                          '该地址作为联系您和寄回纸质协议等使用',
                          style: TextStyle(
                              color: m_colors.color_FB8B39, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(16, 17, 16, 17),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: m_Button(
                          text: "提交",
                          OnPressed: () {
                            // Navigator.of(context).pop();
                            // if (isValidation()) {
                            //   if (type == "1") {
                            //
                            //
                            //   } else if (type == "2") {
                            //     // updateDeveloper();
                            //   }
                            // }

                            submitCertification(
                                mAddress,
                                chooseProvinceID,
                                chooseCityID,
                                chooseTownID,
                                mCompanyId,
                                mEmail,
                                mEmailCode,
                                mPosition,
                                mRealName);
                          },
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  saveData(Function() onSuccess) {
    if (isValidation()) {
      if (type == "1") {
        EasyLoading.show(status: "保存中...");
        // submitDeveloper();
      } else if (type == "2") {
        //修改
        EasyLoading.show(status: "修改中...");
        // updateDeveloper();
      }
    }
  }

  bool isValidation() {
    if (mRealName.isEmpty) {
      EasyLoading.showToast("你还没有填写真实姓名");
      return false;
    } else if (mEmail.isEmpty) {
      EasyLoading.showToast("你还没有填写邮箱");
      return false;
    } else if (mEmailCode.isEmpty) {
      EasyLoading.showToast("你还没有填写邮箱验证码");
      return false;
    } else if (mAddress.isEmpty) {
      EasyLoading.showToast("你还没有填写详细地址");
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

  /// 提交企业认证
  void submitCertification(
      String address,
      String provinceId,
      String cityId,
      String areaId,
      String companyId,
      String email,
      String emailCode,
      String positionName,
      String realName) {
    FirmMineService.firmCertificationApi(
        address,
        provinceId,
        cityId,
        areaId,
        companyId,
        email,
        emailCode,
        positionName,
        realName,
        (object) => () {
              if (object.isSuccess) {}
            });
  }

  /// 更新企业认证
  void updateCertification(
      String address,
      String provinceId,
      String cityId,
      String areaId,
      String companyId,
      String email,
      String emailCode,
      String positionName,
      String realName) {
    FirmMineService.firmCertificationChangeApi(
        address,
        provinceId,
        cityId,
        areaId,
        companyId,
        email,
        emailCode,
        positionName,
        realName,
        (object) => () {
              if (object.isSuccess) {}
            });
  }

  void getEmailCode(String companyId, String mEmail) {
    FirmMineService.sendCompanyEmailApi(
        companyId,
        mEmail,
        (object) => () {
              if (object.isSuccess) {
              } else {
                EasyLoading.showToast(object.message ?? '请求错误！');
              }
            });
  }
}
