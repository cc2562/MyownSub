import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ownsub/appbar.dart';
import 'package:ownsub/lists/mainlist.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class homeview extends StatefulWidget {
  const homeview({Key? key}) : super(key: key);

  @override
  State<homeview> createState() => _homeviewState();
}

class _homeviewState extends State<homeview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              child: Column(
                children: [
                  appbars(
                    title: "所有数据",
                  ),
                  topcard(),
                  Padding(padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                    child: Alllistview(),
                  )

                ],
                //APPBAr
              ),
            )
        )
    );
  }

  //首页头部card
  Widget topcard() {
    return Container(
      width: 100.w,
      //height: 25.h,
      padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 1.h),
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Stack(
          children: [
            Container(
              width: 100.w,
              //height: 20.h,
              padding: EdgeInsets.fromLTRB(5.w, 0.h, 5.w, 1.h),
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 1.h, 3.w, 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "订阅总览",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      Container(
                        width: 100.w,
                        //height: 10.h,
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.sp)),
                            Container(
                              child: Text("APPS"),
                              alignment: Alignment.bottomLeft,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text("本月预计花费：15人民币")
                    ],
                  ),
                ),
              ),
            ),
            //卡片底层背景
          ],
        ),
      ),
    );
  }

//头部列表
}
