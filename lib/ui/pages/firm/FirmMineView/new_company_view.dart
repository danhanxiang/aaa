import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/default_style.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_AppBar.dart';
import '../../../../core/components/m_mainButton.dart';
import '../../../../core/components/m_textFiled.dart';
import '../../../../core/models/FirmMineModel/new_company_info_entity.dart';
import '../../../../core/models/FirmMineModel/search_company_info_entity.dart';
import '../../../../core/models/otherModel/industryModel.dart';
import '../../../../core/service/firm_mine_api/firm_mine_api.dart';
import '../../../../core/components/m_choose_imagevideo_tool.dart';
import '../../../../core/service/personal_api/personal_api.dart';
import '../../../../utils/utils.dart';
import '../../../widget/TextView.dart';

///新建公司
class new_company_view extends StatefulWidget {
  static const String routeName = '/firm/new_company';

  new_company_view({Key? key}) : super(key: key);

  @override
  State<new_company_view> createState() => _firm_certification_viewState();
}

class _firm_certification_viewState extends State<new_company_view> {
  String mBusinessLicense = ''; //文件路径
  String mCompanyName = ""; //公司全名字
  String mTaxInvoice = ""; //公司代码
  String mAddress = ""; //公司地址
  String mShortName = ''; //公司简称
  //所在行业
  String industryTypeStr = "";
  String industryTypeStr_two = "";
  String industryTypeID_two = "";
  String mPersonSizeId = ''; //公司人员规模id
  String mPersonSizeName = ''; //公司人员规模
  String mEmailSuffix = ''; //公司企业邮箱
  String imgUrl = '';
  TextEditingController mCompanyNameController = TextEditingController();
  TextEditingController mTaxInvoiceController = TextEditingController();
  TextEditingController mAddressController = TextEditingController();

  List<IndustryModel> industryTypeList = [];
  Map industryTypeTextDic = {};

  List<IndustryModel> ScrollTypeList = [];
  List ScrollTypeTextList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PersonalService.getIndustryList((object) {
      setState(() {
        industryTypeList = object.data;
        for (IndustryModel industry in industryTypeList) {
          List list = [];
          for (var item in industry.children!) {
            list.add(item.name);
          }
          industryTypeTextDic[industry.name] = list;
        }
      });
    });

    PersonalService.getCompanyPeopleList((object) {
      if (object.isSuccess) {
        setState(() {
          ScrollTypeList = object.data;
          for (var item in ScrollTypeList) {
            ScrollTypeTextList.add(item.name);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: m_AppBar(context, "新建公司"),
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
                  GestureDetector(
                    child: imgUrl.isNotEmpty
                        ? Container(
                            width: double.infinity,
                            height: 200,
                            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Image.file(
                              File(imgUrl),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: m_colors.divider_02_color,
                                    width: 1)),
                            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/person/icon_person_write.png",
                                  width: 26,
                                  height: 26,
                                  fit: BoxFit.cover,
                                ),
                                const Text(
                                  '上传高清营业执照照片',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                                const Text(
                                  '大小5M以内，支持JPG/PNG格式',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            )),
                    onTap: () {
                      _openGallery();
                    },
                  ),
                  m_textFiled(
                    hintText: "请输入公司全称(必选)",
                    TextEditingcontoll: mCompanyNameController,
                    onChanged: (value) {
                      setState(() {
                        mCompanyName = value;
                      });
                    },
                  ),
                  m_textFiled(
                    hintText: "请输入公司简称(必选)",
                    TextEditingtext: mShortName,
                    onChanged: (value) {
                      setState(() {
                        mShortName = value;
                      });
                    },
                  ),
                  m_textFiledBtn(
                    onTap: () {
                      Pickers.showMultiLinkPicker(context,
                          data: industryTypeTextDic,
                          columeNum: 2,
                          selectData: [industryTypeStr, industryTypeStr_two],
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "请选择行业",
                          ), onChanged: (p, index) {
                        setState(() {
                          industryTypeStr = industryTypeList[index[0]].name!;
                          industryTypeStr_two = industryTypeList[index[0]]
                              .children![index[1]]
                              .name!;

                          industryTypeID_two = (industryTypeList[index[0]]
                                  .children![index[1]]
                                  .id)
                              .toString();
                        });
                      });
                    },
                    hintText: "请选择公司行业(必选)",
                    TextEditingtext: industryTypeStr.length <= 0
                        ? industryTypeStr_two
                        : "${industryTypeStr}-${industryTypeStr_two}",
                  ),
                  m_textFiledBtn(
                    hintText: "请选择人员规模(必选)",
                    TextEditingtext: mPersonSizeName,
                    onTap: () {
                      Pickers.showSinglePicker(context,
                          data: ScrollTypeTextList,
                          selectData: mPersonSizeName,
                          pickerStyle: ClosePickerStyle(
                            haveRadius: true,
                            title: "请选择培养方式",
                          ), onChanged: (p, index) {
                        print(index);
                        setState(() {
                          mPersonSizeName = p;
                          mPersonSizeId = ScrollTypeList[index].id.toString();
                        });
                      });
                    },
                  ),
                  m_textFiled(
                    hintText: "统一社会信用代码(可选)",
                    TextEditingcontoll: mTaxInvoiceController,
                    onChanged: (value) {
                      setState(() {
                        mTaxInvoice = value;
                      });
                    },
                  ),
                  m_textFiled(
                    TextEditingcontoll: mAddressController,
                    onChanged: (value) {
                      setState(() {
                        mAddress = value;
                      });
                    },
                    hintText: "请输入企业邮箱后缀(可选)",
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
                          text: "新建",
                          OnPressed: () {
                            // if (isValidation()) {}

                            createNewCompany(
                                mBusinessLicense,
                                mCompanyName,
                                mEmailSuffix,
                                industryTypeID_two,
                                mPersonSizeId,
                                mShortName,
                                mTaxInvoice,
                                mAddress);
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
    if (isValidation()) {}
  }

  bool isValidation() {
    if (mCompanyName.isEmpty) {
      EasyLoading.showToast("你还没有填写公司全称");
      return false;
    } else if (mShortName.isEmpty) {
      EasyLoading.showToast("你还没有填写公司简称");
      return false;
    } else if (industryTypeID_two.isEmpty) {
      EasyLoading.showToast("你还没有选择公司行业");
      return false;
    } else if (mPersonSizeId.isEmpty) {
      EasyLoading.showToast("你还没有选择公司规模");
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


  //打开文件夹选单张图片
  _openGallery() async {
    choose_imagevideo_tool.m_choose_image((xfile) {
      if (xfile != null) {
        EasyLoading.show(status: '上传中...');
        FirmMineService.PostUpdateHeadImg(xfile.path, (object) {
          if (object.isSuccess) {
            EasyLoading.showToast('上传成功');
            EasyLoading.dismiss();
            setState(() {
              NewCompanyInfoData bean = object.data;
              mCompanyName = bean.companyName ?? '';
              mBusinessLicense = bean.businessLicense ?? '';
              mTaxInvoice = bean.taxInvoice ?? '';
              mAddress = bean.address ?? '';
              imgUrl = xfile.path;

              mCompanyNameController.text = mCompanyName;
              mTaxInvoiceController.text = mTaxInvoice;
              mAddressController.text = mAddress;
            });
          } else {
            EasyLoading.showToast(object.message!);
          }
        });
      }
    });
  }

  ///新建公司
  createNewCompany(
    String businessLicense,
    String companyName,
    String emailSuffix,
    String industryId,
    String personSizeId,
    String shortName,
    String taxInvoice,
    String address,
  ) {
    FirmMineService.createNewCompanyApi(
        businessLicense,
        companyName,
        emailSuffix,
        industryId,
        personSizeId,
        shortName,
        taxInvoice,
        address,
        (object) => () {
              if (object.isSuccess) {

                EasyLoading.showToast('新建成功');
                Navigator.of(context).pop();
              }
            });
  }

  ///更换企业
  changeNewCompany(
      String businessLicense,
      String companyName,
      String emailSuffix,
      String industryId,
      String personSizeId,
      String shortName,
      String taxInvoice,
      String address,
      ) {
    FirmMineService.createNewCompanyChangeApi(
        businessLicense,
        companyName,
        emailSuffix,
        industryId,
        personSizeId,
        shortName,
        taxInvoice,
        address,
            (object) => () {
          if (object.isSuccess) {

            EasyLoading.showToast('更换成功');
            Navigator.of(context).pop();
          }
        });
  }
}
