import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class bottomtextfild extends StatefulWidget {
  String inputword = "";
  TextInputType texttype = TextInputType.text;
  bottomtextfild({Key? key,required this.inputword,required this.texttype}) : super(key: key);

  @override
  State<bottomtextfild> createState() => _bottomtextfildState();

}

class _bottomtextfildState extends State<bottomtextfild> {
  TextEditingController inputcon = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    inputcon.text = widget.inputword;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 5.w+MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(3.w,0,3.w,0),
            decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: inputcon,
              onChanged: (value){
                widget.inputword = value;
              },
              textInputAction: TextInputAction.done,
              keyboardType: widget.texttype,
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  //hintText: "输入订阅价格"
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          InkWell(
            onTap: (){
              Navigator.of(context).pop(widget.inputword);
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
          ),
        ],
      ),
    );
  }
}
