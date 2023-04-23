import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class appbars extends StatefulWidget {
  String title = "appbar";
  appbars({Key? key,required this.title}) : super(key: key);

  @override
  State<appbars> createState() => _appbarsState();
}

class _appbarsState extends State<appbars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
      width: 100.w,
      height: 10.h,
      alignment: Alignment.centerLeft,
      color: Theme.of(context).colorScheme.background,
      child: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
    );
  }
}
