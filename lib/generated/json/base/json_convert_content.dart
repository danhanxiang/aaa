// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:people_living_flutterdemo/core/models/FirmCollectModel/collect_status_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmCollectModel/firm_collect_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/career_direction_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/dev_info_item_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmHomeModel/developer_detail_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/account_wallet_list_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/audition_item_list_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/company_info_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/firm_manage_list_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/new_company_info_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/search_company_info_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmMineModel/treaty_order_list_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmPositionModel/firm_info_id_bean_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmPositionModel/firm_position_entity.dart';
import 'package:people_living_flutterdemo/core/models/FirmPositionModel/firm_recommend_bean_entity.dart';
import 'package:people_living_flutterdemo/core/models/HomeModel/home_positionListModel.dart';
import 'package:people_living_flutterdemo/core/models/HomeModel/home_position_detail_model.dart';
import 'package:people_living_flutterdemo/core/models/LoginModel/login_userInfo.dart';
import 'package:people_living_flutterdemo/core/models/PositionModel/position_item.dart';
import 'package:people_living_flutterdemo/core/models/PositionModel/position_item_list.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/Province.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/RecordScrollModel.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/WorkAgeModel.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/city.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/cultivateModel.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/industryModel.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/industry_typeModel.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/positonTypeModel.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/town.dart';
import 'package:people_living_flutterdemo/core/models/otherModel/workWhy.dart';
import 'package:people_living_flutterdemo/core/models/personModel/person_careerDto.dart';
import 'package:people_living_flutterdemo/core/models/personModel/person_educationDto.dart';
import 'package:people_living_flutterdemo/core/models/personModel/person_inUuserData.dart';
import 'package:people_living_flutterdemo/core/models/personModel/person_projectDto.dart';
import 'package:people_living_flutterdemo/core/models/personModel/person_workExperienceDto.dart';
import 'package:people_living_flutterdemo/core/models/personModel/person_workModeDto.dart';
import 'package:people_living_flutterdemo/core/models/personModel/skillsClassModel.dart';
import 'package:people_living_flutterdemo/core/models/personModel/skillsModel.dart';
import 'package:people_living_flutterdemo/ui/pages/PersonalView/personal_historicalOrders/historcalOrder_model_list.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
	static final Map<String, JsonConvertFunction> convertFuncMap = {
		(CollectStatusEntity).toString(): CollectStatusEntity.fromJson,
		(FirmCollectEntity).toString(): FirmCollectEntity.fromJson,
		(FirmCollectData).toString(): FirmCollectData.fromJson,
		(FirmCollectDataList).toString(): FirmCollectDataList.fromJson,
		(CareerDirectionEntity).toString(): CareerDirectionEntity.fromJson,
		(CareerDirectionData).toString(): CareerDirectionData.fromJson,
		(CareerDirectionDataChildren).toString(): CareerDirectionDataChildren.fromJson,
		(CareerDirectionDataChildrenChildren).toString(): CareerDirectionDataChildrenChildren.fromJson,
		(DevInfoItemEntity).toString(): DevInfoItemEntity.fromJson,
		(DevInfoItemData).toString(): DevInfoItemData.fromJson,
		(DevInfoItemDataList).toString(): DevInfoItemDataList.fromJson,
		(DeveloperDetailEntity).toString(): DeveloperDetailEntity.fromJson,
		(DeveloperDetailData).toString(): DeveloperDetailData.fromJson,
		(DeveloperDetailDataCareerDto).toString(): DeveloperDetailDataCareerDto.fromJson,
		(DeveloperDetailDataWorkModeDtoList).toString(): DeveloperDetailDataWorkModeDtoList.fromJson,
		(DeveloperDetailDataEducationDtoList).toString(): DeveloperDetailDataEducationDtoList.fromJson,
		(DeveloperDetailDataProjectDtoList).toString(): DeveloperDetailDataProjectDtoList.fromJson,
		(DeveloperDetailDataProjectDtoListProjectSkillList).toString(): DeveloperDetailDataProjectDtoListProjectSkillList.fromJson,
		(DeveloperDetailDataWorkExperienceDtoList).toString(): DeveloperDetailDataWorkExperienceDtoList.fromJson,
		(DeveloperDetailDataDeveloperSkillDtoList).toString(): DeveloperDetailDataDeveloperSkillDtoList.fromJson,
		(AccountWalletEntity).toString(): AccountWalletEntity.fromJson,
		(AccountWalletData).toString(): AccountWalletData.fromJson,
		(AccountWalletListEntity).toString(): AccountWalletListEntity.fromJson,
		(AccountWalletListData).toString(): AccountWalletListData.fromJson,
		(AccountWalletListDataList).toString(): AccountWalletListDataList.fromJson,
		(AuditionItemListEntity).toString(): AuditionItemListEntity.fromJson,
		(AuditionItemListData).toString(): AuditionItemListData.fromJson,
		(AuditionItemListDataList).toString(): AuditionItemListDataList.fromJson,
		(CompanyInfoEntity).toString(): CompanyInfoEntity.fromJson,
		(CompanyInfoData).toString(): CompanyInfoData.fromJson,
		(FirmManageListEntity).toString(): FirmManageListEntity.fromJson,
		(FirmManageListData).toString(): FirmManageListData.fromJson,
		(FirmManageListDataList).toString(): FirmManageListDataList.fromJson,
		(NewCompanyInfoEntity).toString(): NewCompanyInfoEntity.fromJson,
		(NewCompanyInfoData).toString(): NewCompanyInfoData.fromJson,
		(SearchCompanyInfoEntity).toString(): SearchCompanyInfoEntity.fromJson,
		(SearchCompanyInfoData).toString(): SearchCompanyInfoData.fromJson,
		(TreatyOrderListEntity).toString(): TreatyOrderListEntity.fromJson,
		(TreatyOrderListData).toString(): TreatyOrderListData.fromJson,
		(TreatyOrderListDataList).toString(): TreatyOrderListDataList.fromJson,
		(FirmInfoIdBeanEntity).toString(): FirmInfoIdBeanEntity.fromJson,
		(FirmInfoIdBeanData).toString(): FirmInfoIdBeanData.fromJson,
		(FirmPositionEntity).toString(): FirmPositionEntity.fromJson,
		(FirmPositionData).toString(): FirmPositionData.fromJson,
		(FirmPositionDataList).toString(): FirmPositionDataList.fromJson,
		(FirmRecommendBeanEntity).toString(): FirmRecommendBeanEntity.fromJson,
		(FirmRecommendBeanData).toString(): FirmRecommendBeanData.fromJson,
		(FirmRecommendBeanDataList).toString(): FirmRecommendBeanDataList.fromJson,
		(FirmRecommendBeanDataListDeveloperSkillMatchDto).toString(): FirmRecommendBeanDataListDeveloperSkillMatchDto.fromJson,
		(Home_positionListModel).toString(): Home_positionListModel.fromJson,
		(Home_position_detail_model).toString(): Home_position_detail_model.fromJson,
		(Login_userInfo).toString(): Login_userInfo.fromJson,
		(Position_item).toString(): Position_item.fromJson,
		(Position_item_list).toString(): Position_item_list.fromJson,
		(Province).toString(): Province.fromJson,
		(RecordScrollModel).toString(): RecordScrollModel.fromJson,
		(WorkAgeModel).toString(): WorkAgeModel.fromJson,
		(City).toString(): City.fromJson,
		(CultivateModel).toString(): CultivateModel.fromJson,
		(IndustryModel).toString(): IndustryModel.fromJson,
		(Industry_typeModel).toString(): Industry_typeModel.fromJson,
		(PositonTypeModel).toString(): PositonTypeModel.fromJson,
		(Town).toString(): Town.fromJson,
		(WorkWhy).toString(): WorkWhy.fromJson,
		(Person_careerDto).toString(): Person_careerDto.fromJson,
		(Person_educationDto).toString(): Person_educationDto.fromJson,
		(Person_inUuserData).toString(): Person_inUuserData.fromJson,
		(Person_projectDto).toString(): Person_projectDto.fromJson,
		(Person_workExperienceDto).toString(): Person_workExperienceDto.fromJson,
		(Person_workModeDto).toString(): Person_workModeDto.fromJson,
		(SkillsClassModel).toString(): SkillsClassModel.fromJson,
		(SkillsModel).toString(): SkillsModel.fromJson,
		(HistorcalOrder_model_list).toString(): HistorcalOrder_model_list.fromJson,
	};

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

List<T>? convertListNotNull<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<CollectStatusEntity>[] is M){
			return data.map<CollectStatusEntity>((Map<String, dynamic> e) => CollectStatusEntity.fromJson(e)).toList() as M;
		}
		if(<FirmCollectEntity>[] is M){
			return data.map<FirmCollectEntity>((Map<String, dynamic> e) => FirmCollectEntity.fromJson(e)).toList() as M;
		}
		if(<FirmCollectData>[] is M){
			return data.map<FirmCollectData>((Map<String, dynamic> e) => FirmCollectData.fromJson(e)).toList() as M;
		}
		if(<FirmCollectDataList>[] is M){
			return data.map<FirmCollectDataList>((Map<String, dynamic> e) => FirmCollectDataList.fromJson(e)).toList() as M;
		}
		if(<CareerDirectionEntity>[] is M){
			return data.map<CareerDirectionEntity>((Map<String, dynamic> e) => CareerDirectionEntity.fromJson(e)).toList() as M;
		}
		if(<CareerDirectionData>[] is M){
			return data.map<CareerDirectionData>((Map<String, dynamic> e) => CareerDirectionData.fromJson(e)).toList() as M;
		}
		if(<CareerDirectionDataChildren>[] is M){
			return data.map<CareerDirectionDataChildren>((Map<String, dynamic> e) => CareerDirectionDataChildren.fromJson(e)).toList() as M;
		}
		if(<CareerDirectionDataChildrenChildren>[] is M){
			return data.map<CareerDirectionDataChildrenChildren>((Map<String, dynamic> e) => CareerDirectionDataChildrenChildren.fromJson(e)).toList() as M;
		}
		if(<DevInfoItemEntity>[] is M){
			return data.map<DevInfoItemEntity>((Map<String, dynamic> e) => DevInfoItemEntity.fromJson(e)).toList() as M;
		}
		if(<DevInfoItemData>[] is M){
			return data.map<DevInfoItemData>((Map<String, dynamic> e) => DevInfoItemData.fromJson(e)).toList() as M;
		}
		if(<DevInfoItemDataList>[] is M){
			return data.map<DevInfoItemDataList>((Map<String, dynamic> e) => DevInfoItemDataList.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailEntity>[] is M){
			return data.map<DeveloperDetailEntity>((Map<String, dynamic> e) => DeveloperDetailEntity.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailData>[] is M){
			return data.map<DeveloperDetailData>((Map<String, dynamic> e) => DeveloperDetailData.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailDataCareerDto>[] is M){
			return data.map<DeveloperDetailDataCareerDto>((Map<String, dynamic> e) => DeveloperDetailDataCareerDto.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailDataWorkModeDtoList>[] is M){
			return data.map<DeveloperDetailDataWorkModeDtoList>((Map<String, dynamic> e) => DeveloperDetailDataWorkModeDtoList.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailDataEducationDtoList>[] is M){
			return data.map<DeveloperDetailDataEducationDtoList>((Map<String, dynamic> e) => DeveloperDetailDataEducationDtoList.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailDataProjectDtoList>[] is M){
			return data.map<DeveloperDetailDataProjectDtoList>((Map<String, dynamic> e) => DeveloperDetailDataProjectDtoList.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailDataProjectDtoListProjectSkillList>[] is M){
			return data.map<DeveloperDetailDataProjectDtoListProjectSkillList>((Map<String, dynamic> e) => DeveloperDetailDataProjectDtoListProjectSkillList.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailDataWorkExperienceDtoList>[] is M){
			return data.map<DeveloperDetailDataWorkExperienceDtoList>((Map<String, dynamic> e) => DeveloperDetailDataWorkExperienceDtoList.fromJson(e)).toList() as M;
		}
		if(<DeveloperDetailDataDeveloperSkillDtoList>[] is M){
			return data.map<DeveloperDetailDataDeveloperSkillDtoList>((Map<String, dynamic> e) => DeveloperDetailDataDeveloperSkillDtoList.fromJson(e)).toList() as M;
		}
		if(<AccountWalletEntity>[] is M){
			return data.map<AccountWalletEntity>((Map<String, dynamic> e) => AccountWalletEntity.fromJson(e)).toList() as M;
		}
		if(<AccountWalletData>[] is M){
			return data.map<AccountWalletData>((Map<String, dynamic> e) => AccountWalletData.fromJson(e)).toList() as M;
		}
		if(<AccountWalletListEntity>[] is M){
			return data.map<AccountWalletListEntity>((Map<String, dynamic> e) => AccountWalletListEntity.fromJson(e)).toList() as M;
		}
		if(<AccountWalletListData>[] is M){
			return data.map<AccountWalletListData>((Map<String, dynamic> e) => AccountWalletListData.fromJson(e)).toList() as M;
		}
		if(<AccountWalletListDataList>[] is M){
			return data.map<AccountWalletListDataList>((Map<String, dynamic> e) => AccountWalletListDataList.fromJson(e)).toList() as M;
		}
		if(<AuditionItemListEntity>[] is M){
			return data.map<AuditionItemListEntity>((Map<String, dynamic> e) => AuditionItemListEntity.fromJson(e)).toList() as M;
		}
		if(<AuditionItemListData>[] is M){
			return data.map<AuditionItemListData>((Map<String, dynamic> e) => AuditionItemListData.fromJson(e)).toList() as M;
		}
		if(<AuditionItemListDataList>[] is M){
			return data.map<AuditionItemListDataList>((Map<String, dynamic> e) => AuditionItemListDataList.fromJson(e)).toList() as M;
		}
		if(<CompanyInfoEntity>[] is M){
			return data.map<CompanyInfoEntity>((Map<String, dynamic> e) => CompanyInfoEntity.fromJson(e)).toList() as M;
		}
		if(<CompanyInfoData>[] is M){
			return data.map<CompanyInfoData>((Map<String, dynamic> e) => CompanyInfoData.fromJson(e)).toList() as M;
		}
		if(<FirmManageListEntity>[] is M){
			return data.map<FirmManageListEntity>((Map<String, dynamic> e) => FirmManageListEntity.fromJson(e)).toList() as M;
		}
		if(<FirmManageListData>[] is M){
			return data.map<FirmManageListData>((Map<String, dynamic> e) => FirmManageListData.fromJson(e)).toList() as M;
		}
		if(<FirmManageListDataList>[] is M){
			return data.map<FirmManageListDataList>((Map<String, dynamic> e) => FirmManageListDataList.fromJson(e)).toList() as M;
		}
		if(<NewCompanyInfoEntity>[] is M){
			return data.map<NewCompanyInfoEntity>((Map<String, dynamic> e) => NewCompanyInfoEntity.fromJson(e)).toList() as M;
		}
		if(<NewCompanyInfoData>[] is M){
			return data.map<NewCompanyInfoData>((Map<String, dynamic> e) => NewCompanyInfoData.fromJson(e)).toList() as M;
		}
		if(<SearchCompanyInfoEntity>[] is M){
			return data.map<SearchCompanyInfoEntity>((Map<String, dynamic> e) => SearchCompanyInfoEntity.fromJson(e)).toList() as M;
		}
		if(<SearchCompanyInfoData>[] is M){
			return data.map<SearchCompanyInfoData>((Map<String, dynamic> e) => SearchCompanyInfoData.fromJson(e)).toList() as M;
		}
		if(<TreatyOrderListEntity>[] is M){
			return data.map<TreatyOrderListEntity>((Map<String, dynamic> e) => TreatyOrderListEntity.fromJson(e)).toList() as M;
		}
		if(<TreatyOrderListData>[] is M){
			return data.map<TreatyOrderListData>((Map<String, dynamic> e) => TreatyOrderListData.fromJson(e)).toList() as M;
		}
		if(<TreatyOrderListDataList>[] is M){
			return data.map<TreatyOrderListDataList>((Map<String, dynamic> e) => TreatyOrderListDataList.fromJson(e)).toList() as M;
		}
		if(<FirmInfoIdBeanEntity>[] is M){
			return data.map<FirmInfoIdBeanEntity>((Map<String, dynamic> e) => FirmInfoIdBeanEntity.fromJson(e)).toList() as M;
		}
		if(<FirmInfoIdBeanData>[] is M){
			return data.map<FirmInfoIdBeanData>((Map<String, dynamic> e) => FirmInfoIdBeanData.fromJson(e)).toList() as M;
		}
		if(<FirmPositionEntity>[] is M){
			return data.map<FirmPositionEntity>((Map<String, dynamic> e) => FirmPositionEntity.fromJson(e)).toList() as M;
		}
		if(<FirmPositionData>[] is M){
			return data.map<FirmPositionData>((Map<String, dynamic> e) => FirmPositionData.fromJson(e)).toList() as M;
		}
		if(<FirmPositionDataList>[] is M){
			return data.map<FirmPositionDataList>((Map<String, dynamic> e) => FirmPositionDataList.fromJson(e)).toList() as M;
		}
		if(<FirmRecommendBeanEntity>[] is M){
			return data.map<FirmRecommendBeanEntity>((Map<String, dynamic> e) => FirmRecommendBeanEntity.fromJson(e)).toList() as M;
		}
		if(<FirmRecommendBeanData>[] is M){
			return data.map<FirmRecommendBeanData>((Map<String, dynamic> e) => FirmRecommendBeanData.fromJson(e)).toList() as M;
		}
		if(<FirmRecommendBeanDataList>[] is M){
			return data.map<FirmRecommendBeanDataList>((Map<String, dynamic> e) => FirmRecommendBeanDataList.fromJson(e)).toList() as M;
		}
		if(<FirmRecommendBeanDataListDeveloperSkillMatchDto>[] is M){
			return data.map<FirmRecommendBeanDataListDeveloperSkillMatchDto>((Map<String, dynamic> e) => FirmRecommendBeanDataListDeveloperSkillMatchDto.fromJson(e)).toList() as M;
		}
		if(<Home_positionListModel>[] is M){
			return data.map<Home_positionListModel>((Map<String, dynamic> e) => Home_positionListModel.fromJson(e)).toList() as M;
		}
		if(<Home_position_detail_model>[] is M){
			return data.map<Home_position_detail_model>((Map<String, dynamic> e) => Home_position_detail_model.fromJson(e)).toList() as M;
		}
		if(<Login_userInfo>[] is M){
			return data.map<Login_userInfo>((Map<String, dynamic> e) => Login_userInfo.fromJson(e)).toList() as M;
		}
		if(<Position_item>[] is M){
			return data.map<Position_item>((Map<String, dynamic> e) => Position_item.fromJson(e)).toList() as M;
		}
		if(<Position_item_list>[] is M){
			return data.map<Position_item_list>((Map<String, dynamic> e) => Position_item_list.fromJson(e)).toList() as M;
		}
		if(<Province>[] is M){
			return data.map<Province>((Map<String, dynamic> e) => Province.fromJson(e)).toList() as M;
		}
		if(<RecordScrollModel>[] is M){
			return data.map<RecordScrollModel>((Map<String, dynamic> e) => RecordScrollModel.fromJson(e)).toList() as M;
		}
		if(<WorkAgeModel>[] is M){
			return data.map<WorkAgeModel>((Map<String, dynamic> e) => WorkAgeModel.fromJson(e)).toList() as M;
		}
		if(<City>[] is M){
			return data.map<City>((Map<String, dynamic> e) => City.fromJson(e)).toList() as M;
		}
		if(<CultivateModel>[] is M){
			return data.map<CultivateModel>((Map<String, dynamic> e) => CultivateModel.fromJson(e)).toList() as M;
		}
		if(<IndustryModel>[] is M){
			return data.map<IndustryModel>((Map<String, dynamic> e) => IndustryModel.fromJson(e)).toList() as M;
		}
		if(<Industry_typeModel>[] is M){
			return data.map<Industry_typeModel>((Map<String, dynamic> e) => Industry_typeModel.fromJson(e)).toList() as M;
		}
		if(<PositonTypeModel>[] is M){
			return data.map<PositonTypeModel>((Map<String, dynamic> e) => PositonTypeModel.fromJson(e)).toList() as M;
		}
		if(<Town>[] is M){
			return data.map<Town>((Map<String, dynamic> e) => Town.fromJson(e)).toList() as M;
		}
		if(<WorkWhy>[] is M){
			return data.map<WorkWhy>((Map<String, dynamic> e) => WorkWhy.fromJson(e)).toList() as M;
		}
		if(<Person_careerDto>[] is M){
			return data.map<Person_careerDto>((Map<String, dynamic> e) => Person_careerDto.fromJson(e)).toList() as M;
		}
		if(<Person_educationDto>[] is M){
			return data.map<Person_educationDto>((Map<String, dynamic> e) => Person_educationDto.fromJson(e)).toList() as M;
		}
		if(<Person_inUuserData>[] is M){
			return data.map<Person_inUuserData>((Map<String, dynamic> e) => Person_inUuserData.fromJson(e)).toList() as M;
		}
		if(<Person_projectDto>[] is M){
			return data.map<Person_projectDto>((Map<String, dynamic> e) => Person_projectDto.fromJson(e)).toList() as M;
		}
		if(<Person_workExperienceDto>[] is M){
			return data.map<Person_workExperienceDto>((Map<String, dynamic> e) => Person_workExperienceDto.fromJson(e)).toList() as M;
		}
		if(<Person_workModeDto>[] is M){
			return data.map<Person_workModeDto>((Map<String, dynamic> e) => Person_workModeDto.fromJson(e)).toList() as M;
		}
		if(<SkillsClassModel>[] is M){
			return data.map<SkillsClassModel>((Map<String, dynamic> e) => SkillsClassModel.fromJson(e)).toList() as M;
		}
		if(<SkillsModel>[] is M){
			return data.map<SkillsModel>((Map<String, dynamic> e) => SkillsModel.fromJson(e)).toList() as M;
		}
		if(<HistorcalOrder_model_list>[] is M){
			return data.map<HistorcalOrder_model_list>((Map<String, dynamic> e) => HistorcalOrder_model_list.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.convert<M>(json);
		}
	}
}