import 'package:flutter/material.dart';
import 'package:ownsub/home/chartview.dart';
import 'package:ownsub/home/homeview.dart';
import 'package:ownsub/home/my.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.green,
            useMaterial3: true,
          ),
          home: const homepage(),
        );
      },
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Widget> Pagelist = [
    homeview(),
    chartview(),
    myview(),
  ];
  int _selectedIndex = 0;
  PageController pagec = new PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (i) {
          setState(() {
            pagec.initialPage;
            pagec.jumpToPage(i);
            _selectedIndex = i;
          } );
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.pie_chart),
            title: Text("Chart"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Set"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
        body: PageView(
          controller: pagec,
          children: Pagelist,
        )
    )
    );
  }
}

