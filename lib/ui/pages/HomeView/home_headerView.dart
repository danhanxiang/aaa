import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/ProjectConfig.dart';
import 'package:people_living_flutterdemo/ui/pages/WebView/m_webView.dart';

class HeaderView extends StatefulWidget {
  HeaderView({Key? key}) : super(key: key);

  @override
  State<HeaderView> createState() => _HeaderViewState();
}

class _HeaderViewState extends State<HeaderView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text('欢迎成为自由开发者',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
              const SizedBox(height: 20),
              const Text(
                '热爱/灵活/匠心/享受',
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(68, 78, 100, 1)),
              ),
              const SizedBox(height: 24),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                //color: Colors.blue,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    imageBtnView('images/home/icon_home_card01@2x.png',
                        '小影/哈尔滨市/后端开发', '享受远程办公工作模式，提高工作效率', '4.5'),
                    const SizedBox(
                      width: 16,
                    ),
                    imageBtnView('images/home/icon_home_card02@2x.png',
                        '婷婷/随州市/前端开发', '陪伴孩子，抵抗变迁，远程让我自在安心', '4.8'),
                    const SizedBox(
                      width: 16,
                    ),
                    imageBtnView('images/home/icon_home_card03@2x.png',
                        '阿炳/运城市/后端开发', '为我远程链接客户，帮我重新平衡了工作与生活', '4.6'),
                  ],
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                //margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                width: MediaQuery.of(context).size.width - 12,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  //runAlignment: WrapAlignment.spaceEvenly,
                  children: [
                    IconButtonView(
                        'images/home/icon_home_cooperation.png', '合作模式', 0),
                    IconButtonView(
                        'images/home/icon_home_manual.png', '服务手册', 1),
                    IconButtonView(
                        'images/home/icon_home_problem.png', '常见问题', 2),
                    IconButtonView(
                        'images/home/icon_home_consultant.png', '联系顾问', 3),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TopTitleView extends StatelessWidget {
  const TopTitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text('欢迎成为自由开发者',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),
              const SizedBox(height: 10),
              const Text(
                '热爱/灵活/匠心/享受',
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(68, 78, 100, 1)),
              ),
              const SizedBox(height: 24),
              Container(
                //margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                width: MediaQuery.of(context).size.width - 12,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  //runAlignment: WrapAlignment.spaceEvenly,
                  children: [
                    IconButtonView(
                        'images/home/icon_home_cooperation.png', '合作模式', 0),
                    IconButtonView(
                        'images/home/icon_home_manual.png', '服务手册', 1),
                    IconButtonView(
                        'images/home/icon_home_problem.png', '常见问题', 2),
                    IconButtonView(
                        'images/home/icon_home_consultant.png', '联系顾问', 3),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class IconButtonView extends StatelessWidget {
  String imageUrl;
  String text;
  int index;

  IconButtonView(this.imageUrl, this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed(inAppWebView.routeName,
                arguments: {"baseUrl": ProjectConfig.HZMS, "title": "合作模式"});
            break;
          case 1:
            Navigator.of(context).pushNamed(inAppWebView.routeName,
                arguments: {"baseUrl": ProjectConfig.FWSC, "title": "服务手册"});
            break;
          case 2:
            Navigator.of(context).pushNamed(inAppWebView.routeName,
                arguments: {"baseUrl": ProjectConfig.CJWT, "title": "常见问题"});
            break;
          case 3:
            break;
          default:
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 46,
            height: 46,
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(32, 40, 57, 1),
            ),
          ),
        ],
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0)

          // foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
    );
  }
}

class imageBtnView extends StatelessWidget {
  String imageUrl;
  String title;
  String subText;
  String points;

  imageBtnView(this.imageUrl, this.title, this.subText, this.points);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      height: MediaQuery.of(context).size.height,
      width: 310,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Image.asset(
            imageUrl,
            width: 310,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subText,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
              bottom: 16,
              left: 16)
        ],
      ),
    );

    // return ListView(
    //   children: [
    //     Container(

    // width: 310,
    // height: MediaQuery.of(context).size.height,
    // child: Image.asset(
    //   'images/home/icon_home_card01@2x.png',
    //   //'images/home/icon_home_problem.png',
    //   width: MediaQuery.of(context).size.width,
    //   // height: MediaQuery.of(context).size.height,
    //   fit: BoxFit.cover,

    //  ),
    // ElevatedButton(
    //   onPressed: () {},
    //   child: Image.asset(
    //     //'images/home/icon_home_card01@2x.png',
    //     'images/home/icon_home_problem.png',
    //     width: MediaQuery.of(context).size.width,
    //     // height: MediaQuery.of(context).size.height,
    //     fit: BoxFit.cover,
    //   ),
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(Colors.red),
    //     elevation: MaterialStateProperty.all(0),
    //     // shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //     //   borderRadius: BorderRadius.circular(8)))
    //   ),
    // ),
    //     ),
    //   ],
    //   scrollDirection: Axis.horizontal,
    //   // padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
    // );
  }
}
