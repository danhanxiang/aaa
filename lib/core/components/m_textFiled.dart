import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';

// FocusScope.of(context).requestFocus(FocusNode()); 收起键盘

class m_textFiled extends StatefulWidget {
  m_textFiled(
      {Key? key,
      this.onChanged,
      this.TextEditingcontoll,
      this.TextEditingtext,
      this.hintText,
      this.InputType})
      : super(key: key);
  TextEditingController? TextEditingcontoll;
  String? TextEditingtext = "";
  String? hintText = "";
  TextInputType? InputType;
  final onChanged;

  @override
  // ignore: no_logic_in_create_state
  State<m_textFiled> createState() => _m_textFiledState();
}

class _m_textFiledState extends State<m_textFiled> {
  late String Editingtext;
  TextEditingController _userController =
      TextEditingController(); //   controller

  FocusNode _focusNode = FocusNode(); //创建FocusNode对象实例
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.TextEditingcontoll != null) {
      _userController = widget.TextEditingcontoll!;
    } else {
      _userController.text = widget.TextEditingtext ?? "";
    }

    //_usernameController是输入框的控制对象
    _userController.addListener(() {
      setState(() {
        print("11222");
      });
    });

    _focusNode.addListener(() {
      setState(() {});
      // if (!_focusNode.hasFocus) {
      //   print('失去焦点');
      // } else {
      //   print('得到焦点');
      // }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
      child: TextField(
        focusNode: _focusNode,
        controller: widget.TextEditingcontoll != null
            ? widget.TextEditingcontoll!
            : _userController,
        keyboardType: widget.InputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: m_colors.content_02_color),
          border: InputBorder.none,
          suffixIcon: isHiddenDeleteIcon()
              ? IconButton(
                  onPressed: () {
                    _userController.clear();
                  },
                  icon: Image.asset(
                    "images/person/icon_person_textfiled_delete.png",
                    width: 14,
                    height: 14,
                    fit: BoxFit.cover,
                  ))
              : null,
        ),
        style: TextStyle(fontSize: 14, color: m_colors.title_01_color),
        onChanged: widget.onChanged,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: m_colors.divider_02_color))),
    );
  }

  TextEditingController _updateserContorl() {
    _userController.text = widget.TextEditingtext ?? "";
    return _userController;
  }

  bool isHiddenDeleteIcon() {
    if (_userController.text.length > 0 && _focusNode.hasFocus) {
      //得到焦点的时候 有值 则显示删除按钮
      return true;
    } else if (_userController.text.length <= 0 && _focusNode.hasFocus) {
      //得到焦点的时候 有值 则隐藏删除按钮
      return false;
    } else if (!_focusNode.hasFocus) {
      //失去焦点的时候
      return false;
    }

    return true;
  }
}

class m_textFiledBtn extends StatefulWidget {
  m_textFiledBtn({Key? key, this.onTap, this.TextEditingtext, this.hintText})
      : super(key: key);
  String? TextEditingtext = "";
  String? hintText = "";
  final onTap;

  @override
  // ignore: no_logic_in_create_state
  State<m_textFiledBtn> createState() => m_textFiledBtnState();
}

class m_textFiledBtnState extends State<m_textFiledBtn> {
  late String Editingtext;
  TextEditingController _userController =
      TextEditingController(); //   controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userController.text = widget.TextEditingtext ?? "";

    //_usernameController是输入框的控制对象
    _userController.addListener(() {
      setState(() {});
    });
  }

  TextEditingController inputext(String text) {
    _userController.text = text;
    return _userController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.px),
      padding: EdgeInsets.only(top: 26.px),
      child: TextField(
        readOnly: true,
        controller: inputext(widget.TextEditingtext ?? ""),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: m_colors.content_02_color),
          border: InputBorder.none,
          suffixIcon: Padding(
            padding: EdgeInsets.all(11.px),
            child: Image.asset(
              "images/person/icon_person_meau_arrow.png",
              width: 8.px,
              height: 8.px,
              fit: BoxFit.cover,
            ),
          ),
        ),
        style: TextStyle(fontSize: 14.px, color: m_colors.title_01_color),
        onTap: widget.onTap,
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: m_colors.divider_02_color))),
    );
  }
}
