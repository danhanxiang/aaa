import 'package:flutter/material.dart';
import 'package:people_living_flutterdemo/ui/widget/bottomLine.dart';

import '../../../../core/models/index.dart';

class hopJob extends StatefulWidget {
  hopJob(this.jobList);
  List<Person_careerDto> jobList = [];

  @override
  State<hopJob> createState() => _hopJobState();
}

class _hopJobState extends State<hopJob> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SectionHeader(),
      Offstage(
          offstage: widget.jobList.length == 0 ? true : false, child: jboList())
    ]);
  }

  Widget jboList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: (widget.jobList).map((model) {
          return jobCell(model);
        }).toList(),
      ),
    );
  }

  Widget jobCell(Person_careerDto model) {
    String getCurSalary(){
      return "${(model.curSalary ?? 0.toDouble()) / 1000.0}-${(model.curSalary ?? 0.toDouble()) / 1000.0}k";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("${model.careerDirectionName}",
                                style:TextStyle(fontWeight: FontWeight.w500, fontSize: 15)
                          )
                ),
                Text(getCurSalary(),
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 15)),
              ],
            ),
            SizedBox(height: 8),
            Text("医疗健康 · 电子商务 · 社交网络"),
            bottomLine()
          ],
        )
      ]),
    );
  }

  Widget SectionHeader() {
    return Row(
      children: [
        Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(3)))),
        SizedBox(width: 3),
        Text("求职期望",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0)),
      ],
    );
  }
}
