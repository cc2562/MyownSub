import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '/generated/l10n.dart' as SS1;
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ownsub/appbar.dart';
import 'package:ownsub/widgets/bomenu.dart';
import 'package:ownsub/widgets/inputtextfild.dart';
import 'package:ownsub/widgets/mycard.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
class addnewview extends StatefulWidget {
  Map appdel = {};
  addnewview({Key? key,required appdel}) : super(key: key);
  @override
  State<addnewview> createState() => _addnewviewState();
}

class _addnewviewState extends State<addnewview> {
  String nowpaystr = SS1.S.current.mobthpay,nowtypestr = "未分类",nowappname="抖音";
  DateTime _selectedDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 31));
  int nowpayid = 1,nowtypeid=6,freetrailday=0;
  final FocusNode _nodeText1 = FocusNode();
  Map result = {};
  List iconurl = ["url","https://imgres.pi7.com/pi7/16/77717-20210816161504611a1e88c6ffa.jpg"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
        child:KeyboardActions(
          tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
          config: KeyboardActionsConfig(
              keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
              keyboardBarColor: Colors.grey[200],
              actions: [
                KeyboardActionsItem(
                    focusNode: _nodeText1, toolbarButtons: [
                      (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                    );
                  }
                ]),
              ]
          ),
          child:ListView(
            children: [
              appbars(title: "新增订阅"),
              mycard(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final List<AssetEntity>? result = await AssetPicker.pickAssets(
                              context,
                              pickerConfig: const AssetPickerConfig(
                                requestType: RequestType.image,
                                maxAssets: 1,
                                //themeColor: Theme.of(context).primaryColor,
                              ),
                            );
                            var files = await result![0].file;
                            setState(() {
                              iconurl = ["path",files];
                            });
                            //print(result![0].file);
                          },
                          child: Container(
                            width: 20.w,
                            height:20.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: showicon(iconurl),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(nowappname,style: TextStyle(fontSize: 16.sp),),
                            IconButton(onPressed: (){
                              showBarModalBottomSheet(
                                  context: context,
                                  builder: (context){
                                    return SingleChildScrollView(
                                      controller: ModalScrollController.of(context),
                                      child: bottomtextfild(inputword: nowappname, texttype: TextInputType.text,),
                                    );
                                  }
                              ).then((value) {
                                if(value.toString().isNotEmpty){
                                  print(value);
                                  setState(() {
                                    nowappname = value;
                                  });
                                }
                              });
                            }, icon: Icon(HeroIcons.pencil),iconSize: 16.sp,color: Theme.of(context).secondaryHeaderColor,)
                          ],
                        )
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
                                focusNode: _nodeText1,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
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
                                    child: bottommenu(menus: {0:SS1.S.of(context).weekpay,1:SS1.S.of(context).mobthpay,2:SS1.S.of(context).quarterly_payment,3:SS1.S.of(context).semi_annual_payment,4:SS1.S.of(context).annual_fee,5:SS1.S.of(context).permanent},),
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
                    //类型选择
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("软件类型"),
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
                                    child: bottommenu(menus: {0:"影音娱乐",1:"阅读学习",2:"效率工具",3:"社交",4:"生活",5:"健康",6:"未分类"},),
                                  );
                                }
                            ).then((value) {
                              if(value>=0&&value<6) {
                                print("1234::$value");
                                setState(() {
                                  nowtypeid = value;
                                  nowtypestr = checktype(value);
                                });
                              }
                            });
                          },
                          child: Text(nowtypestr),
                        )
                      ],
                    ),
                    //订阅开始日期
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("订阅开始日期"),
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
                            ).then((value) {
                              setState(() {
                                print("123");
                                nowpaystr = checkpay(nowpayid);
                              });
                            } );
                          },
                          child: Text(formatDate(this._selectedDate, [yyyy, '-', mm, '-', dd])),
                        )
                      ],
                    ),
                    //订阅试用日期
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("订阅试用天数"),
                        SizedBox(width: 2.w,),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                          ),
                          onPressed: (){
                            showBarModalBottomSheet(
                                context: context,
                                builder: (context){
                                  return SingleChildScrollView(
                                    controller: ModalScrollController.of(context),
                                    child: bottomtextfild(inputword: freetrailday.toString(), texttype: TextInputType.number,),
                                  );
                                }
                            ).then((value){
                              setState(() {
                                freetrailday = int.parse(value);
                                checkpay(nowpayid);
                              });
                            });
                          },
                          child: Text(freetrailday.toString()+SS1.S.current.day),
                        )
                      ],
                    ),
                    //订阅结束日期
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("下一次付费日期"),
                        SizedBox(width: 2.w,),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                          ),
                          onPressed: () {
                            /*
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
                                          selectedDate: _endDate,
                                          locale: Locale("zh"),
                                          onDateTimeChanged: (DateTime value) {
                                            setState(() {
                                              _endDate = value;
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

                        */
                          },
                          child: Text(formatDate(this._endDate, [yyyy, '-', mm, '-', dd])),
                        )
                      ],
                    ),
                    //保存
                    InkWell(
                      onTap: (){
                        savedata();
                      },
                      child: Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).secondaryHeaderColor
                        ),
                        child: Row(
                          children: [
                            Icon(HeroIcons.check),
                            Text("保存")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ),
            ],
          ),
        )



    );


  }
  
  //图标展示
  ImageProvider showicon(List theurl){
    if(theurl[0]=="url"){
      return NetworkImage(theurl[1]);
    }else{
      return FileImage(theurl[1]);
    }
  }
  //保存数据
  void savedata(){
    Map result1 = {
      "appname":nowappname,
      "waytopay":nowpayid,
      "apptype":nowtypeid,
      "startdate":_selectedDate,
      "enddate":_endDate,
    };
    Navigator.of(context).pop(result1);
  }
  //付费周期判断
 String checkpay(int index){
    String state = SS1.S.of(context).mobthpay;
    print("456");
    switch (index){
      case 0:
        setState(() {
          _endDate = _selectedDate.add(Duration(days: 7+freetrailday));
        });
        state = SS1.S.of(context).weekpay;
        break;
      case 1:
        setState(() {
          _endDate = _selectedDate.add(Duration(days: 31+freetrailday));
        });
        state = SS1.S.of(context).mobthpay;
        print("6777");
        break;
      case 2:
        setState(() {
          _endDate = _selectedDate.add(Duration(days: 93+freetrailday));
        });
        state = SS1.S.of(context).quarterly_payment;
        break;
      case 3:
        setState(() {
          _endDate = _selectedDate.add(Duration(days: 186+freetrailday));
        });
        state = SS1.S.of(context).semi_annual_payment;
        break;
      case 4:
        setState(() {
          _endDate = _selectedDate.add(Duration(days: 365+freetrailday));
        });
        state = SS1.S.of(context).annual_fee;
        break;
      case 5:
        setState(() {
          _endDate = _selectedDate.add(Duration(days: 3650000+freetrailday));
        });
        state =SS1.S.of(context).permanent;
        break;
    }
    print(_endDate.toString());
    return state;

 }
 String checktype(int index){
    late String state;
    switch (index){
      case 0:
        state = "影音娱乐";
        break;
      case 1:
        state = "阅读学习";
        break;
      case 2:
        state = "效率工具";
        break;
      case 3:
        state = "社交";
        break;
      case 4:
        state = "生活";
        break;
      case 5:
        state = "健康";
        break;
      case 6:
        state = "未分类";
        break;
    }
    return state;
  }
}
