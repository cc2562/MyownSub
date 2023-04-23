import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ownsub/appbar.dart';

class chartview extends StatefulWidget {
  const chartview({Key? key}) : super(key: key);

  @override
  State<chartview> createState() => _chartviewState();
}

class _chartviewState extends State<chartview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          appbars(title: "数据统计"),
        ],
      ),
    ));
  }
}
