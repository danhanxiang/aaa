import 'package:people_living_flutterdemo/core/service/NetWork/httpManager.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';
import '../../models/index.dart';

class PersonalService {
//获取首页职位推荐列表
  static PostUpdateHeadImg(
      String imgfile, Function(ResultData object) onCompletion) async {
    await HttpManager.POST_file("/developer/modify/avatar", {}, imgfile, "png")
        .then((value) {
      onCompletion(value);
    });
  }

//获取入驻资料
  static getInUserdata(Function(ResultData object) onCompletion) async {
    await HttpManager.GET('/developer/detail/${User.userInfo.id}')
        .then((value) {
      if (value.isSuccess) {
        value.data = Person_inUuserData.fromJson(value.data);
      }
      onCompletion(value);
    });
  }

/*①基本信息 */
//保存基本信息
  static saveUserInfo(
      String developerId,
      String realName,
      String sex,
      String birthday,
      String provinceId,
      String cityId,
      String areasId,
      String remoteWorkReason,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST("/developer/update/basic/info", {
      "developerId": developerId,
      "realName": realName,
      "sex": sex,
      "birthday": birthday,
      "provinceId": provinceId,
      "cityId": cityId,
      "areasId": areasId,
      "remoteWorkReason": remoteWorkReason
    }).then((value) {
      onCompletion(value);
    });
  }

/*②职业信息 */
//保存职业信息
  static savePosition(
      String careerDirectionId,
      String curSalary,
      String highestSalary,
      String lowestSalary,
      String workDayMode,
      String workYearsId,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST("/developer/update/career/info", {
      "careerDirectionId": careerDirectionId,
      "curSalary": curSalary,
      "highestSalary": highestSalary,
      "lowestSalary": lowestSalary,
      "workDayMode": workDayMode,
      "workYearsId": workYearsId,
    }).then((value) {
      onCompletion(value);
    });
  }

/* ③教育经历*/
//新增教育 保存学历信息
  static saveEducation(
      String educationId,
      String collegeName,
      String major,
      String inSchoolStartTime,
      String inSchoolEndTime,
      String trainingMode,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST("/developer/add/education", {
      "educationId": educationId,
      "collegeName": collegeName,
      "major": major,
      "inSchoolStartTime": inSchoolStartTime,
      "inSchoolEndTime": inSchoolEndTime,
      "trainingMode": trainingMode
    }).then((value) {
      onCompletion(value);
    });
  }

//删除教育
  static deleteEducation(
      String educationId, Function(ResultData object) onCompletion) async {
    await HttpManager.Delete("/developer/delete/education/${educationId}", {})
        .then((value) {
      onCompletion(value);
    });
  }

//修改教育
  static putUpdateEducation(
      String id,
      String educationId,
      String collegeName,
      String major,
      String inSchoolStartTime,
      String inSchoolEndTime,
      String trainingMode,
      Function(ResultData object) onCompletion) async {
    await HttpManager.Put("/developer/update/education", {
      "id": id,
      "educationId": educationId,
      "collegeName": collegeName,
      "major": major,
      "inSchoolStartTime": inSchoolStartTime,
      "inSchoolEndTime": inSchoolEndTime,
      "trainingMode": trainingMode
    }).then((value) {
      onCompletion(value);
    });
  }

/* ④工作经历*/
//新增工作经历
  static saveWorkExperience(
      String developerId,
      String companyName,
      String industryId,
      String positionName,
      String workStartTime,
      String workEndTime,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST("/developer/v2/save/work", {
      "developerId": developerId,
      "companyName": companyName,
      "industryId": industryId,
      "positionName": positionName,
      "workStartTime": workStartTime,
      "workEndTime": workEndTime,
    }).then((value) {
      onCompletion(value);
    });
  }

//删除工作经历
  static deleteWorkExperience(
      String workId, Function(ResultData object) onCompletion) async {
    await HttpManager.Delete("/developer/v2/delete/work/${workId}", {})
        .then((value) {
      onCompletion(value);
    });
  }

//修改工作经历
  static putUpdateWorkExperience(
      String developerId,
      String companyName,
      String industryId,
      String positionName,
      String workStartTime,
      String workEndTime,
      String workExperienceId,
      Function(ResultData object) onCompletion) async {
    await HttpManager.Put("/developer/update/work", {
      "developerId": developerId,
      "companyName": companyName,
      "industryId": industryId,
      "positionName": positionName,
      "workStartTime": workStartTime,
      "workEndTime": workEndTime,
      "workExperienceId": workExperienceId
    }).then((value) {
      onCompletion(value);
    });
  }

/* ⑤项目经历*/

//新增项目
  /// 技能id  var : [String] skillIdList= []
  static saveProject(
      String projectName,
      String projectStartDate,
      String projectEndDate,
      String position,
      String companyName,
      String industryId,
      String description,
      List skillIdList,
      Function(ResultData object) onCompletion) async {
    await HttpManager.POST("/developer/project", {
      "projectName": projectName,
      "projectStartDate": projectStartDate,
      "projectEndDate": projectEndDate,
      "position": position,
      "companyName": companyName,
      "industryId": industryId,
      "description": description,
      "skillIdList": skillIdList
    }).then((value) {
      onCompletion(value);
    });
  }

//删除项目
  static deleteProject(
      String educationId, Function(ResultData object) onCompletion) async {
    await HttpManager.Delete("/developer/project/${educationId}", {})
        .then((value) {
      onCompletion(value);
    });
  }

//修改项目
  static putUpdateProject(
      String projectName,
      String projectStartDate,
      String projectEndDate,
      String position,
      String companyName,
      String industryId,
      String description,
      List skillIdList,
      String ID,
      Function(ResultData object) onCompletion) async {
    await HttpManager.Put("/developer/project/${ID}", {
      "projectName": projectName,
      "projectStartDate": projectStartDate,
      "projectEndDate": projectEndDate,
      "position": position,
      "companyName": companyName,
      "industryId": industryId,
      "description": description,
      "skillIdList": skillIdList
    }).then((value) {
      onCompletion(value);
    });
  }

//提交审核
  static saveInfoAudit(Function(ResultData object) onCompletion) async {
    await HttpManager.POST("/developer/submit/review", {}).then((value) {
      onCompletion(value);
    });
  }

//other
//获取城市列表
  static postCityList(Function(ResultData object) onCompletion) async {
    print("省市区接口");
    if (!User.provinceList.isEmpty) {
      print("省市区: ${User.provinceList.length}");
      return;
    }
    
    await HttpManager.GET("/dictionary/region/tree").then((value) {
      if (value.isSuccess) {
        //请求成功  存储地区信息
        List<Province> provinceList = [];
        for (var provice in value.data) {
          provinceList.add(Province.fromJson(provice));
        }
        User.saveProvince(provinceList);
      }
      onCompletion(value);
    });
  }

//获取远程办公原因
  static getworkWhy(Function(ResultData object) onCompletion) async {
    await HttpManager.GET("/dictionary/getByParentId/8").then((value) {
      if (value.isSuccess) {
        List<WorkWhy> lists = [];
        for (var item in value.data) {
          lists.add(WorkWhy.fromJson(item));
        }
        value.data = lists;
      }
      onCompletion(value);
    });
  }

//获取职业方向源数据
  static getPositionType(Function(ResultData object) onCompletion) async {
    await HttpManager.GET("/dictionary/getByParentId/6").then((value) {
      if (value.isSuccess) {
        List<PositonTypeModel> lists = [];
        for (var item in value.data) {
          lists.add(PositonTypeModel.fromJson(item));
        }
        value.data = lists;
      }
      onCompletion(value);
    });
  }

  //获取经验要求源数据
  static getWorkAgRequirements(Function(ResultData object) onCompletion) async {
    await HttpManager.GET("/dictionary/getByParentId/4").then((value) {
      if (value.isSuccess) {
        List<WorkAgeModel> lists = [];
        for (var item in value.data) {
          lists.add(WorkAgeModel.fromJson(item));
        }
        value.data = lists;
      }
      onCompletion(value);
    });
  }

  //获取学历要求源数据
  static getScrollRecord(Function(ResultData object) onCompletion) async {
    await HttpManager.GET("/dictionary/getByParentId/5").then((value) {
      if (value.isSuccess) {
        List<RecordScrollModel> lists = [];
        for (var item in value.data) {
          lists.add(RecordScrollModel.fromJson(item));
        }
        value.data = lists;
      }
      onCompletion(value);
    });
  }

  //获取培养方式源数据
  static getCultivatingWay(Function(ResultData object) onCompletion) async {
    await HttpManager.GET("/dictionary/getByParentId/7").then((value) {
      if (value.isSuccess) {
        List<CultivateModel> lists = [];
        for (var item in value.data) {
          lists.add(CultivateModel.fromJson(item));
        }
        value.data = lists;
      }
      onCompletion(value);
    });
  }

  //获取工作行业源数据
  static getIndustryList(Function(ResultData object) onCompletion) async {
    await HttpManager.GET("/dictionary/getByParentId/1").then((value) {
      if (value.isSuccess) {
        List<IndustryModel> lists = [];
        for (var item in value.data) {
          lists.add(IndustryModel.fromJson(item));
        }
        value.data = lists;
      }
      onCompletion(value);
    });
  }

  //获取技能标签源数据
  //careerDirectionId 职业方向ID
  static getSkillsList(String careerDirectionId,
      Function(ResultData object) onCompletion) async {
    await HttpManager.GET("/skill/tree/developer",
        params: {"careerDirectionId": careerDirectionId}).then((value) {
      if (value.isSuccess) {
        List<SkillsModel> lists = [];
        for (var item in value.data) {
          SkillsModel skillsmodel = SkillsModel.fromJson(item);
          List<SkillsClassModel> SkillsClassModelList = [];
          for (SkillsClassModel model in skillsmodel.children!) {
            model.selected = false;
            SkillsClassModelList.add(model);
          }
          skillsmodel.children = SkillsClassModelList;
          lists.add(skillsmodel);
        }
        value.data = lists;
      }
      onCompletion(value);
    });
  }
}
