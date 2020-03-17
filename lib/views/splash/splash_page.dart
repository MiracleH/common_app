import 'package:flutter/material.dart';

import 'package:common_app/constant/constant.dart';


/// 闪屏界面主要用来中转（新特性界面、登陆界面、主页面）
class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// If you use a dependent context-free method to obtain screen parameters and adaptions, you need to call this method.
    MediaQuery.of(context);
    Widget child;
    child = _buildDefaultLaunchImage();
    return Material(child: child);
  }

  /// 默认情况是一个启动页 1200x530
  /// https://game.gtimg.cn/images/yxzj/img201606/heroimg/121/121-bigskin-4.jpg
  Widget _buildDefaultLaunchImage() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        // 这里设置颜色 跟启动页一致的背景色，以免发生白屏闪烁
        color: Color.fromRGBO(0, 10, 24, 1),
        image: DecorationImage(
          // 注意：启动页 别搞太大 以免加载慢
          image: AssetImage(Constant.assetsImagesTabbar + 'yaoqing.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
