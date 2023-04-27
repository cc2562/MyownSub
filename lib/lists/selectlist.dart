import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ownsub/edit/addnew.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class selectlistview extends StatefulWidget {
  const selectlistview({Key? key}) : super(key: key);

  @override
  State<selectlistview> createState() => _selectlistviewState();
}

class _selectlistviewState extends State<selectlistview> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
        seclistbody(),
      ],
    );
  }

  Widget seclistbody(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 1.h, 0, 0),
      child: GestureDetector(
        onTap: (){
          showBarModalBottomSheet(
              context: context,
              builder: (context){
                return SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: addnewview(appdel: {},),
                );
              }
          );
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
                        width: 4.h,
                        height: 4.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage("https://imgres.pi7.com/pi7/16/77717-20210816161504611a1e88c6ffa.jpg"),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      SizedBox(width: 1.w,),
                      Container(
                        //height: 8.h,
                        //color: Colors.red,
                        //alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("抖音",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
