import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ownsub/appbar.dart';
import 'package:ownsub/lists/selectlist.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class selectappview extends StatefulWidget {
  const selectappview({Key? key}) : super(key: key);

  @override
  State<selectappview> createState() => _selectappviewState();
}

class _selectappviewState extends State<selectappview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appbars(title: "添加新的订阅"),
        Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(5.w, 1.w, 5.w, 0),
              child: Container(
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).secondaryHeaderColor
                ),
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "搜索已知内容"
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
              child: selectlistview(),
            ),
          ],
        ),

      ],
    );
  }
}
