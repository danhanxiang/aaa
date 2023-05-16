import 'package:fluwx/fluwx.dart';
import 'package:people_living_flutterdemo/ProjectConfig/ProjectConfig.dart';
import 'package:people_living_flutterdemo/ProjectConfig/user_manager.dart';

class WchatManager {
  WchatManager._();
  static WchatManager? _singleton;
  static WchatManager init() => _singleton ??= WchatManager._();  


  static void initFluwx(Function(String) errorBlock) async {
    //初始化微信分享
    await registerWxApi(
      appId: ProjectConfig.WXAppID,
      doOnAndroid:true,
      doOnIOS:true,
      universalLink: 'https://talent.tntlinking.com/');

      //判断是否安装微信
      var result = await isWeChatInstalled;

      if (result != null && !result) {
        errorBlock('无法打开微信 请检查是否安装了微信');
        return;
      }
  }

  static shareUrl(
    linkUrl, 
    {
      required String title, 
      String? description, 
      WeChatScene scene = WeChatScene.SESSION}) {
        /// 分享到好友
        var model =WeChatShareWebPageModel(
          // 分享链接
          linkUrl,
          /// 标题
          title: title,
          /// 描述
          description: description,
          // logo图标
          thumbnail: WeChatImage.asset('images/person/icon_person_Logo.png'),
          // 分享类型
          scene: scene
        );
        shareToWeChat(model);
  }

  /// 微信小程序 上传简历 
  static void initFluWeChatMiniProgram() {
    String path = 'pages/resumeUpload/index?phone=${User.userInfo.mobile}';
    launchWeChatMiniProgram(
      username: ProjectConfig.WXUserName,
      path: path,
      miniProgramType: ProjectConfig.isDev ? WXMiniProgramType.PREVIEW : WXMiniProgramType.RELEASE ,
    );
  }
}