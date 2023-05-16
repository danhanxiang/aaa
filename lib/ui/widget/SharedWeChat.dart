import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/core/extension/string_extension.dart';
import 'package:people_living_flutterdemo/ui/widget/button_widget/TextIconButton.dart';

class SharedWeChat extends StatelessWidget {
  SharedWeChat({Key? key, this.scene}): super(key: key);
  
  Function(WeChatScene)? scene;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.px, 16.px, 16.px, 26.px),
      padding: EdgeInsets.all(16.px),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.px)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '分享至',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.px,
              color: m_colors.title_01_color
            )
          ),
          SizedBox(height: 8.px),
          wcstyleRow()
        ],
      ),
    );
  }

  Widget wcstyleRow(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextIconButton(
          type: TextIconButtonType.imageTop,
          icon: Image.asset(
            'my_signing_hezuo'.png, 
            width: 36.px, 
            height: 36.px
          ), 
          text: Text(
            "微信好友", 
            style: TextStyle(
              fontSize: 13.px, 
              color: m_colors.title_01_color)
          ),
          onTap: () {
            if (scene != null) {
              scene!(WeChatScene.SESSION);
            }
          },
        ),
        
        SizedBox(width: 30.px),

        TextIconButton(
          type: TextIconButtonType.imageTop,
          icon: Image.asset('my_signing_hezuo'.png, width: 36.px, height: 36.px,), 
          text: Text(
            "朋友圈", 
            style: TextStyle(
              fontSize: 13.px, 
              color: m_colors.title_01_color)
          ),
          onTap: () {
            if (scene != null) {
              scene!(WeChatScene.TIMELINE);
            }
          },
        )
      ],
    );
  }
}