import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class mycard extends StatefulWidget {
   Widget child = Container();
   mycard({Key? key,required this.child}) : super(key: key);
  @override
  State<mycard> createState() => _mycardState();
}

class _mycardState extends State<mycard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: widget.child,
    );
  }
}
