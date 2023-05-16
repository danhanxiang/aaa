//最新的自定义普通按钮
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class MainButton extends StatelessWidget {
  final text;
  final OnPressed;
  final double heigth;
  final double width;
  final color;
  final disable;
  const MainButton({
    this.text = '我是自定义按钮',
    this.heigth = 50.0,
    this.width = 20.0,
    this.OnPressed = null,
    this.color = m_colors.backColor,
    this.disable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.fromLTRB(this.width, 0, this.width, 60),
          height: this.heigth,
          child: ElevatedButton(
            onPressed: disable ? this.OnPressed : null,
            child: Text(text),
            style: ButtonStyle(
                backgroundColor: disable
                    ? MaterialStateProperty.all(this.color)
                    : MaterialStateProperty.all(m_colors.disableColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(heigth / 2)))),
          ),
        ))
      ],
    );
  }
}

class m_Button extends StatelessWidget {
  final text;
  final OnPressed;
  final double heigth;
  final color;
  final disable;

  m_Button({
    this.text = '我是自定义按钮',
    this.heigth = 50.0,
    this.OnPressed = null,
    this.color = m_colors.backColor,
    this.disable = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? this.OnPressed : null,
      child: Text(text),
      style: ButtonStyle(
          backgroundColor: disable
              ? MaterialStateProperty.all(this.color)
              : MaterialStateProperty.all(m_colors.disableColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(heigth / 2)))),
    );
  }
}

class m_Button_border extends StatelessWidget {
  final text;
  final OnPressed;
  final double heigth;
  final color;
  final disable;

  m_Button_border({
    this.text = '我是自定义按钮',
    this.heigth = 50.0,
    this.OnPressed = null,
    this.color = Colors.white,
    this.disable = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? this.OnPressed : null,
      child: Text(text),
      style: ButtonStyle(
          //border: Border.all(width: 1, color: Color.fromRGBO(237, 239, 241, 1)),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: disable
              ? MaterialStateProperty.all(this.color)
              : MaterialStateProperty.all(m_colors.disableColor),
          foregroundColor: MaterialStateProperty.all(m_colors.title_01_color),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(heigth / 2))),
          side: MaterialStateProperty.all(
              BorderSide(width: 1, color: m_colors.divider_02_color))), //边框),
    );
  }
}
