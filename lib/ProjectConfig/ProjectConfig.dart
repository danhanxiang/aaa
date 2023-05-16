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
//隐私政策
  static String YSZC =
      "https://talent-business.stage-ttchain.tntlinking.com/#/page/article?pageCode=049afbccd6e64a76951a1b204031801b";
// 用户协议
  static String YHXY =
      "https://talent-business.stage-ttchain.tntlinking.com/#/page/article?pageCode=02d1a173715748a9bd74cfffe5600374";

  static String api = "https://talent-business.tntlinking.com";
  // 服务手册
  static String FWSC =
      "${api}/#/page/article?pageCode=89890f4dfcb34a37aff65de3166fdac1";

  /// 常见问题
  static String CJWT =
      "${api}/#/page/article?pageCode=9f8ef8b48d124395a475e29fd09a7ac0";

  /// 合作模式
  static String HZMS =
      "${api}/#/page/article?pageCode=ec773f224f2b41069d844af9178bcc1b";

  /// 拍照技巧
  static String PicMD =
      "${api}/#/page/article?pageCode=62a410151649428791cdbf2a75bbe56c";

  /// 活动规则
  static String HDGZ =
      "${api}/#/page/article?pageCode=0501dc5abf964f8eb1c31ee6ba4281cf";
}
