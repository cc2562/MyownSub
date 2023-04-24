import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
//所有信息列表
class Alllistview extends StatefulWidget {
  const Alllistview({Key? key}) : super(key: key);

  @override
  State<Alllistview> createState() => _AlllistviewState();
}

class _AlllistviewState extends State<Alllistview> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        alllist_body(),
        alllist_body()
      ],
    );
  }
//所有信息列表主体
  Widget alllist_body(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
      child: GestureDetector(
        onTap: (){
          print("hello");
        },
        child: InkWell(
          child: Container(
              width: 100.w,
              //height: 10.h,
              padding: EdgeInsets.all(1.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: Row(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        //alignment: Alignment.centerLeft,
                        width: 6.h,
                        //height: 6.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage("https://imgres.pi7.com/pi7/16/77717-20210816161504611a1e88c6ffa.jpg"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      SizedBox(width: 3.w,),
                      Container(
                        //height: 8.h,
                        //color: Colors.red,
                        //alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("抖音",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 1.w,),
                            Text("到期时间:2023-06-11")
                          ],
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                      child:
                      Container(
                        //height: 8.h,
                        padding: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("¥15.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                            SizedBox(height: 1.w,),
                            Text("4天后自动续费")
                          ],
                        ),
                      )
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}

