import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ownsub/appbar.dart';
import 'package:ownsub/widgets/bomenu.dart';
import 'package:ownsub/widgets/mycard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class addnewview extends StatefulWidget {
  Map appdel = {};
  addnewview({Key? key,required appdel}) : super(key: key);

  @override
  State<addnewview> createState() => _addnewviewState();
}

class _addnewviewState extends State<addnewview> {
  String nowpaystr = "月付";
  DateTime _selectedDate = DateTime.now();
  int nowpayid = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      child: Column(
        children: [
          appbars(title: "新增订阅"),
          mycard(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: 20.w,
                      height:20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage("https://imgres.pi7.com/pi7/16/77717-20210816161504611a1e88c6ffa.jpg"),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Text("抖音",style: TextStyle(fontSize: 16.sp),),
                  ],
                ),
              )
          ),
          SizedBox(height: 2.h,),
          mycard(child: Container(
            child: Column(
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Text("价格"),
                    SizedBox(width: 2.w,),
                    Expanded(
                        child:Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(3.w,0,3.w,0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "输入订阅价格"
                            ),
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(height: 1.h,),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("订阅周期"),
                    SizedBox(width: 2.w,),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        showBarModalBottomSheet(
                            context: context,
                            builder: (context){
                              return SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: bottommenu(menus: {0:"周付",1:"月付",2:"季付",3:"半年付",4:"年付",5:"一次性"},),
                              );
                            }
                        ).then((value) {
                              if(value>=0&&value<6) {
                                print("1234::$value");
                                setState(() {
                                  nowpayid = value;
                                  nowpaystr = checkpay(value);
                                });
                              }
                        });
                      },
                      child: Text(nowpaystr),
                    )
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("订阅周期"),
                    SizedBox(width: 2.w,),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        showBarModalBottomSheet(
                          enableDrag: false,
                            context: context,
                            builder: (context){
                              return SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: Container(
                                  width: 100.w,
                                  height: 40.h,
                                  child: Column(
                                    children: [
                                      appbars(title: "选择日期"),
                                      Container(
                                        height: 25.h,
                                        child: ScrollDatePicker(
                                          selectedDate: _selectedDate,
                                          locale: Locale("zh"),
                                          onDateTimeChanged: (DateTime value) {
                                            setState(() {
                                              _selectedDate = value;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Text(_selectedDate.toString()),
                    )
                  ],
                ),
              ],
            ),
          ),
          ),
        ],
      ),
    ));
  }

  //付费周期判断
 String checkpay(int index){
    late String state;
    switch (index){
      case 0:
        state = "周付";
        break;
      case 1:
        state = "月付";
        break;
      case 2:
        state = "季付";
        break;
      case 3:
        state = "半年付";
        break;
      case 4:
        state = "年付";
        break;
      case 5:
        state = "一次性";
        break;
    }
    return state;

 }
}
