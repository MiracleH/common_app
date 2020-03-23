import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:common_app/constant/constant.dart';
import 'package:common_app/constant/style.dart';
import 'package:common_app/providers/tab_bar_provider.dart';

import 'package:provider/provider.dart';

import 'package:common_app/views/mine/mine_page.dart';

class _TabBarItem {
  String title, image, selectedImage;
  _TabBarItem(this.title, this.image, this.selectedImage);
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List tabData = [
    _TabBarItem('item1', 
        Constant.assetsImagesTabbar + 'feic.png',
        Constant.assetsImagesTabbar + 'feicx.png'),
    _TabBarItem('item2',
        Constant.assetsImagesTabbar + 'feic.png',
        Constant.assetsImagesTabbar + 'feicx.png'),
    _TabBarItem('item3',
        Constant.assetsImagesTabbar + 'feic.png',
        Constant.assetsImagesTabbar + 'feicx.png'),
    _TabBarItem('item4', 
        Constant.assetsImagesTabbar + 'feic.png',
        Constant.assetsImagesTabbar + 'feicx.png'),
  ];

  String appBarTitle = "app";
  List<Widget> list = List();
  int _currentIndex = 0;
  List<BottomNavigationBarItem> myTabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      final item = tabData[i];
      myTabs.add(
        BottomNavigationBarItem(
          icon: Image.asset(item.image),
          activeIcon: Image.asset(item.selectedImage),
          title: Text(
            item.title,
            textScaleFactor: 1.0,
            // Fixed Bug: 这个只需要设置字体大小即可，颜色不要设置
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
        ),
      );
    }
    list
      ..add(MinePage())
      ..add(MinePage())
      ..add(MinePage())
      ..add(MinePage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _itemTapped(int index) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _currentIndex = index;
      appBarTitle = tabData[index].title;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Consumer<TabBarProvider>(
      builder: (context, tabBarProvider, _) {
        return Scaffold(
          appBar: null,
          body: list[_currentIndex],
          bottomNavigationBar: tabBarProvider.hidden
              ? null
              : CupertinoTabBar(
                  items: myTabs,
                  onTap: _itemTapped,
                  currentIndex: _currentIndex,
                  activeColor: Style.mainColor,
                  inactiveColor: Color(0xFF191919),
                ),
        );
      },
    );
  }
}
