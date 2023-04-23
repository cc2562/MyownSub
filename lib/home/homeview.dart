import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ownsub/appbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class homeview extends StatefulWidget {
  const homeview({Key? key}) : super(key: key);

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        child: Column(
          children: [
            appbars(title: "所有数据",),
            
          ],
          //APPBAr
        ),
      )
    ));
  }
}
