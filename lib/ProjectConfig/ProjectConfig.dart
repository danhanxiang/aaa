class ProjectConfig {
  //API
  static bool isDev = true; //环境api配置  测试true  生产flase
  static String DevApi = 'https://staging.tntlinking.com'; //测试环境
  static String ProdApi = 'https://talent.tntlinking.com'; //生产环境

  static String G_URl =
      isDev ? DevApi + "/api/new_gateway" : ProdApi + "/api/new_gateway";

  static String M_URl =
      isDev ? DevApi + "/api/new_manpower" : ProdApi + "/api/new_manpower";



  //UM一键登录
  static String iOSKey = '61e8b19ee014255fcbf77477';
  static String AndroidKey = '622ee2c92b8de26e11f85471';
  static String AndroidUMKey =
      "zsiyoIhID4V/zG7ep9TMDRFlYwg/sHdC4Xj851YQplYTu7l3QNohhBoE5iDWBaMiKxbLRquqkY5wdcTuIOZ4oPOjnX3SOyZJ+zGIrFojZjx5IIfD0lrXnPnEnKy/rwcnE1Vy+KMCGEYC43balOmA2fZzxyq8dUeKeHOn0szVw3pWh5Ndx69KTAyU5pFyNM0sGdVL+vwrtrrv/BN7vFvRatDjfylsDDkLEwnMR4H/dZWvKt5ysUXigSW2wa0YXGWI/FURiw+UMKN2t1r2rp6zdleCGti/D3FbKUIji0tKiLvlEzGUpwcd2YVUDQPffLup";
  static String iOSUMKey =
      'tBC2XGJKJLKrH3gu7N8qovVoiXLg3VjLHuchhUhBEVMn3ef8T4xJtCb4FEjQi4SAOxZW3oXBfExuu7b0kA+RF694iDBCFQ958elZX8KDFqhd+4ZqTzow7TCwXdCsUuzcN5X6Ef0ubQ8G/0Feam4Yo0HD9H+0AJIxzKM+ioEFPNLeOgywfvVymDNWAka0SKMk7LVw9QMMbPY61Lk6/uCFBl+5W/VlG684nM+ui1fh9kRnJvY1CWVmG37myV358ti/8xSY/IQ1JaxFponOHgsBSA==';

//微信APPID
  static String WXAppID = 'wx1e91399d09c1cd9a';
// 小程序username
  static String WXUserName = 'gh_3d9e6fe5d03c';
  
  

  static String AGREEMENT_URL_DEBUG =
      "https://talent-business.staging.tntlinking.com/#/page/article?pageCode=02d1a173715748a9bd74cfffe5600374";
  static String AGREEMENT_URL_RELEASE =
      "https://talent-business.tntlinking.com/#/page/article?pageCode=04858774a247409a997e5e822daf2d25";

  static String PRIVATE_URL_DEBUG =
      "https://talent-business.staging.tntlinking.com/#/page/article?pageCode=049afbccd6e64a76951a1b204031801b";
  static String PRIVATE_URL_RELEASE =
      "https://talent-business.tntlinking.com/#/page/article?pageCode=5f537d5726744c0ab632f8379eeae3e5";

//隐私政策
  static String YSZC = isDev ? PRIVATE_URL_DEBUG : PRIVATE_URL_RELEASE;

// 用户协议
  static String YHXY = isDev ? AGREEMENT_URL_DEBUG : AGREEMENT_URL_RELEASE;

  static String api = "https://talent-business.tntlinking.com";

   /// 合作模式，服务手册，常见问题，拍照技巧，活动规则的相关测试地址和正式地址配置
   static String OTHER_SERVICE_URL = isDev ? "https://minio.stage-ttchain.tntlinking.com" : "https://s3.ttchain.tntlinking.com";

  // 服务手册
  static String FWSC = "${OTHER_SERVICE_URL}/manpower-pages/service_guide.md";

  /// 常见问题
  static String CJWT =
      "${OTHER_SERVICE_URL}/manpower-pages/faq_guide.md";

  /// 合作模式
  static String HZMS =
      "${OTHER_SERVICE_URL}/manpower-pages/recruit_guide.pdf";

  /// 拍照技巧
  static String PicMD =
      "${OTHER_SERVICE_URL}/manpower-pages/photography.md";

  /// 活动规则
  static String HDGZ =
      "${OTHER_SERVICE_URL}/manpower-pages/recommend_guide.mdf";

  /// 微信分享开职位详情
  static String positionDetailShareUrl(num developerId) {
    if (isDev) {
      return 'https://wechat.staging.tntlinking.com/#/pages/jobDetail/index?positionId=$developerId&share=true';
    } else {
      return 'https://wechats.tntlinking.com/#/pages/jobDetail/index?positionId=$developerId&share=true';
    }
  }

  /// 微信分享开发者详情
  static String developerDetailShareUrl(num developerId) {
    if (isDev) {
      return 'http://talent.staging.tntlinking.com/#/developer-details?developerId=$developerId';
    } else {
      return 'https://talent.tntlinking.com/#/developer-details?developerId=$developerId';
    }
  }
}
