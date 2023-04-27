import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottommenu extends StatefulWidget {
  Map<int,String> menus = {};
  bottommenu({Key? key,required this.menus}) : super(key: key);

  @override
  State<bottommenu> createState() => _bottommenuState();
}

class _bottommenuState extends State<bottommenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Container(
          child: ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.menus.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(widget.menus.values.elementAt(index)),
                onTap: (){
                    getchoose(index);
                },
              );
            },
          ),
        )
    );
  }

  int getchoose(int index){
    print(widget.menus.keys.elementAt(index));
    Navigator.of(context).pop(widget.menus.keys.elementAt(index));
    return widget.menus.keys.elementAt(index);
  }
}
