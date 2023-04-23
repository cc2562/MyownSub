import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../appbar.dart';

class myview extends StatefulWidget {
  const myview({Key? key}) : super(key: key);

  @override
  State<myview> createState() => _myviewState();
}

class _myviewState extends State<myview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          appbars(title: "设置"),
        ],
      ),
    ));;
  }
}
