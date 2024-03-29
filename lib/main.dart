import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ownsub/home/chartview.dart';
import 'package:ownsub/home/homeview.dart';
import 'package:ownsub/home/my.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'generated/l10n.dart';
void main() {
  // Initialize FFI
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}
final FocusNode _nodeText1 = FocusNode();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          localeListResolutionCallback: (locales, supportedLocales) {
            print(locales);
            return;
          },
          theme: FlexThemeData.light(scheme: FlexScheme.blueWhale,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
          ),
        // The Mandy red, dark theme.
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
        // Use dark or light theme based on system setting.
        themeMode: ThemeMode.system,
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
    return  Scaffold(
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
              title: Text(S.of(context).home),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.pie_chart),
              title: Text(S.of(context).chart),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.settings),
              title: Text(S.of(context).Set),
              selectedColor: Colors.orange,
            ),
          ],
        ),
        body: PageView(
          controller: pagec,
          children: Pagelist,
        )
    );
  }
}

