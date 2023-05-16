import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/components/m_mainButton.dart';


class Sheet extends StatelessWidget {
  // BuildContext context;
  Sheet(
    {Key? key,
    // this.context,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Column(
        children: [
          Text('data')
        ],
      ),

    );
  }
}


/// 自定义标签弹框
void showAddTagAlertDialog(BuildContext context, Function(String tagTitle) onCompletion) {
  String text = '';

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return
         AlertDialog(
          title: Text('添加自定义标签 ',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  maxLength: 15,
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: '请输入自定义标签',
                    border: InputBorder.none
                  ),
                  onChanged: (value) {
                    print(value);
                    text = value;
                  },
                ),
                const SizedBox(
                  height: 5,
                ),

                Row(children: [
                    TextButton(style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),//内边距
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,//外边距
                      ),
                      onPressed: (){
                      Navigator.pop(context);
                    }, 
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 1.0,
                            color: m_colors.divider_02_color),
                          ),
                        child: Text('取消', style: TextStyle(color: m_colors.title_01_color),))
                    ),
                  
                    const SizedBox(
                      width: 10,
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),//内边距
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,//外边距
                          ),
                      onPressed: (){
                      onCompletion(text);
                      Navigator.pop(context);
                    }, 
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: m_colors.backColor),
                        child: Text('添加', style: TextStyle(color: Colors.white),))
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

/// 签约弹框
void showSigningAlertDialog(BuildContext context, Function() onCompletion) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return
         AlertDialog(
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('在用户使用身份认证的功能或相关服务所需时，根据相关法律法规，本平台可能收集你的真实身份信息（真实姓名、身份证号码、手机号、人脸信息）以完成验证，特别且必要情况下基于安全考虑，为了确保我们为用户本人提供服务，本平台可能会根据用户提供的信息进行校验，将通过人脸识别的方式验证你的身份。身份证号以及人脸信息属于个人敏感信息，用户可以拒绝提供，但用户将可能无法获得相关服务，但不影响其他功能与服务的正常使用。', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: m_colors.content_01_color)
                ),
                const SizedBox(
                  height: 28,
                ),

                Row(children: [
                  Expanded(child:
                         TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),//内边距
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,//外边距
                          ),
                          onPressed: (){
                          Navigator.pop(context);
                        }, 
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.0,
                                color: m_colors.divider_02_color),
                              ),
                            child: Text('不同意', style: TextStyle(fontSize: 13, color: m_colors.title_01_color),)
                          )
                        ),
                      ),
                    
                      const SizedBox(
                        width: 18,
                      ),
                      
                      Expanded(
                        child: 
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),//内边距
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,//外边距
                          ),
                          onPressed: (){
                          Navigator.pop(context);
                          onCompletion();
                        }, 
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: m_colors.backColor),
                            child: Text('同意', style: TextStyle(fontSize: 13, color: Colors.white),))
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      });
}