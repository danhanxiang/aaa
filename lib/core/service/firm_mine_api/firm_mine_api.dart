import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_list_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/audition_item_list_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/company_info_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/firm_manage_list_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/new_company_info_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/search_company_info_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/treaty_order_list_entity.dart';
import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';

class FirmMineService {
  ///获取首页职位推荐列表
  static getFirmWalletCurrent(Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/company/wallet/current').then((value) {
      if (value.isSuccess) {
        // List<CareerDirectionData> newdata = [];
        // for (Map<String, dynamic> item in value.data) {
        //   newdata.add(CareerDirectionData.fromJson(item));
        // }
        AccountWalletData newdata = AccountWalletData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取发布职位列表
  static getFirmFreezeRecordApi(
      date, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/company/wallet/freeze_record',
        params: {"date": date, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        AccountWalletListData newdata =
            AccountWalletListData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取面试管理列表
  static getFirmAuditionApi(
      pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/interview/getInterviewList',
        params: {"pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        AuditionItemListData newdata =
            AuditionItemListData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取面试历史记录列表
  static getFirmAuditionHistoryApi(
      pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/interview/getInterviewHistory',
        params: {"pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        AuditionItemListData newdata =
            AuditionItemListData.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取面试详情
  static getAuditionDetailApi(
      interviewId, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/interview/appDetail',
        params: {"interviewId": interviewId}).then((value) {
      if (value.isSuccess) {
        AuditionItemListDataList newdata =
            AuditionItemListDataList.fromJson(value.data);

        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///获取企业订单列表
  static getFirmOrderListApi(
      orderStatus, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/businessOrder/getOrderList',
        params: {"orderStatus": orderStatus, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        TreatyOrderListData newdata = TreatyOrderListData.fromJson(value.data);
        //
        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///搜索企业订单列表
  static searchFirmOrderListApi(
      search, pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/businessOrder/getOrderList',
        params: {"search": search, "pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        TreatyOrderListData newdata = TreatyOrderListData.fromJson(value.data);
        //
        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///搜索企业订单列表
  static getFirmMemberList(
      pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/companyMember/member/page',
        path: '/tntlinking-member/sso/app',
        params: {"pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        FirmManageListData newdata = FirmManageListData.fromJson(value.data);
        //
        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///移交管理员
  static modifyAdminApi(
      memberId, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/companyMember/modifyAdmin',
        path: '/tntlinking-member/sso/app',
        params: {"memberId": memberId}).then((value) {
      if (value.isSuccess) {
        // FirmManageListData newdata = FirmManageListData.fromJson(value.data);
        // //
        // value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///移出成员
  static deleteMembersApi(
      String memberId, Function(ResultData object) onCompletion) async {
    await HttpManager.Delete(
            "/tntlinking-member/sso/company/removeMember/${memberId}", {})
        .then((value) {
      onCompletion(value);
    });
  }

  ///获取公司下待审核成员
  static getFirmMemberToBeAuditedApi(
      pageNum, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/companyMember/getToBeAuditedMembers/page',
        path: '/tntlinking-member/sso/app',
        params: {"pageNum": pageNum}).then((value) {
      if (value.isSuccess) {
        FirmManageListData newdata = FirmManageListData.fromJson(value.data);
        //
        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///拒绝加入公司
  static disagreeJoinApi(
      memberId, Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/company/removeMember/${memberId}', {},
            path: "tntlinking-member/sso/app")
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }

  ///同意加入公司
  static agreeJoinApi(
      memberId, Function(ResultData object) onCompletion) async {
    await HttpManager.POST('/companyMember/agreeJoin/${memberId}', {},
            path: "tntlinking-member/sso/app")
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }

  ///获取公司详细信息
  static getCompanyInfoApi(Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/company/info', path: '/tntlinking-member/sso')
        .then((value) {
      if (value.isSuccess) {
        CompanyInfoData newdata = CompanyInfoData.fromJson(value.data);
        value.data = newdata;
      }
      onCompletion(value);
    });
  }

  ///邀请公司成员
  static inviteMembersApi(email, mobile, position, realName,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST(
            '/companyMember/invite/members',
            {
              "email": email,
              "mobile": mobile,
              "position": position,
              "realName": realName,
            },
            path: "/tntlinking-member/sso/app")
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }

  ///获取邮箱验证码
  static sendCompanyEmailApi(
      companyId, email, Function(ResultData object) onCompletion) async {
    await HttpManager.POST(
            '/company/sendCompanyEmail',
            {
              "companyId": companyId,
              "email": email,
            },
            path: "/tntlinking-member/sso")
        .then((value) {
      if (value.isSuccess) {
        EasyLoading.showToast('验证码已发送');
      }
      onCompletion(value);
    });
  }

  ///企业认证审核
  static firmCertificationApi(
      address,
      provinceId,
      cityId,
      areaId,
      companyId,
      email,
      emailCode,
      positionName,
      realName,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST(
            '/companyMember/upgradeAccount',
            {
              "address": address,
              "provinceId": provinceId,
              "cityId": cityId,
              "areaId": areaId,
              "companyId": companyId,
              "email": email,
              "emailCode": emailCode,
              "positionName": positionName,
              "realName": realName,
            },
            path: "/tntlinking-member/sso/app")
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }

  ///企业认证更换操作
  static firmCertificationChangeApi(
      address,
      provinceId,
      cityId,
      areaId,
      companyId,
      email,
      emailCode,
      positionName,
      realName,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST(
            '/companyMember/change',
            {
              "address": address,
              "provinceId": provinceId,
              "cityId": cityId,
              "areaId": areaId,
              "companyId": companyId,
              "email": email,
              "emailCode": emailCode,
              "positionName": positionName,
              "realName": realName,
            },
            path: "/tntlinking-member/sso/app")
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }

  ///搜索公司
  static searchCompanyApi(
      name, Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/company/searchCompany',
        path: '/tntlinking-member/sso', params: {"name": name}).then((value) {
      if (value.isSuccess) {
        List<SearchCompanyInfoData> newdata = [];
        for (Map<String, dynamic> item in value.data) {
          newdata.add(SearchCompanyInfoData.fromJson(item));
        }

        value.data = newdata;
      }
      onCompletion(value);
    });
  }
///上传企业执照
  static PostUpdateHeadImg( String imgfile, Function(ResultData object) onCompletion) async {
    await HttpManager.POST_CompanyImage("/companyMember/uploadBusinessLicense", {}, imgfile, "png",path: '/tntlinking-member/sso/app')
        .then((value) {
      if (value.isSuccess) {
        NewCompanyInfoData newdata = NewCompanyInfoData.fromJson(value.data);
        value.data = newdata;
      }

      onCompletion(value);
    });
  }

  ///新建公司
  static createNewCompanyApi(
      businessLicense,
      companyName,
      emailSuffix,
      industryId,
      personSizeId,
      shortName,
      taxInvoice,
      address,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST(
        '/company/createAndAutoJoin',
        {
          "businessLicense": businessLicense,
          "companyName": companyName,
          "emailSuffix": emailSuffix,
          "industryId": industryId,
          "personSizeId": personSizeId,
          "shortName": shortName,
          "taxInvoice": taxInvoice,
          "address": address,
        },
        path: "/tntlinking-member/sso")
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }

  ///更换公司
  static createNewCompanyChangeApi(
      businessLicense,
      companyName,
      emailSuffix,
      industryId,
      personSizeId,
      shortName,
      taxInvoice,
      address,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST(
        '/companyMember/create/offerChangeCompany',
        {
          "businessLicense": businessLicense,
          "companyName": companyName,
          "emailSuffix": emailSuffix,
          "industryId": industryId,
          "personSizeId": personSizeId,
          "shortName": shortName,
          "taxInvoice": taxInvoice,
          "address": address,
        },
        path: "/tntlinking-member/sso/app")
        .then((value) {
      if (value.isSuccess) {}
      onCompletion(value);
    });
  }
}
