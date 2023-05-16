import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/core/extension/int_extension.dart';
import 'package:people_living_flutterdemo/ProjectConfig/m_colors.dart';

class SectionCellView extends StatelessWidget {
  SectionCellView({
    Key? key,
    this.title = '', 
    this.imgURl = '', 
    this.subTitle = '', 
    this.onTap}) : super(key:key);
  
  String subTitle;
  String title;
  String imgURl;
  Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 24.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imgURl,
                width: 24.px,
                height: 24.px,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.px,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 13.px,
                    fontWeight: FontWeight.w600,
                    color: m_colors.content_01_color
                ),
              )
            ],
          ),
          Row(
            children: [
              Offstage(
                offstage: subTitle.isEmpty,
                child: Text(
                subTitle,
                style: TextStyle(
                  fontSize: 13.px, 
                  color: m_colors.content_02_color
                  ),
                ),
              ),
              
              Image.asset(
                "images/person/icon_person_meau_arrow.png",
                width: 24.px,
                height: 24.px,
                fit: BoxFit.cover,
              )
            ],
          )
        ],
      ),
    ),
    onTap: () {
      if (onTap !=null) {
        onTap!(title);
      }
    },
  );;
  } 
}