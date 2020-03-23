import 'package:flutter/material.dart';

import 'package:flustars/flustars.dart';
import 'package:fluro/fluro.dart';

import 'package:common_app/routers/fluro_navigator.dart';
import 'package:common_app/routers/routers.dart';

import 'package:common_app/constant/constant.dart';

/// 闪屏跳转模式
enum MHSplashSkipMode {
  homePage, // 主页
}

/// 闪屏界面主要用来中转
class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  /// 跳转方式
  MHSplashSkipMode _skipMode;

  @override
  void dispose() {
    super.dispose();
    print('🔥 Splash Page is Over 👉');
  }

  @override
  void initState() {
    super.initState();
    // 监听部件渲染完
    /// widget渲染监听。
    WidgetUtil widgetUtil = new WidgetUtil();
    widgetUtil.asyncPrepares(true, (_) async {
      // widget渲染完成。
      // App启动时读取Sp数据，需要异步等待Sp初始化完成。必须保证它 优先初始化。
      await SpUtil.getInstance();
      _switchRootView();
    });
  }

  // 切换rootView
  void _switchRootView() {
    // 跳转路径
    String skipPath;
    // 跳转模式
    MHSplashSkipMode skipMode;
    skipMode = MHSplashSkipMode.homePage;
    skipPath = Routers.homePage;
    // 这里无需更新 页面 直接跳转即可
    _skipMode = skipMode;
    print('🔥');
    // 跳转对应的主页
    NavigatorUtils.push(context, skipPath,
        clearStack: true, transition: TransitionType.fadeIn);
    print('👉');
  }


  @override
  Widget build(BuildContext context) {
    /// If you use a dependent context-free method to obtain screen parameters and adaptions, you need to call this method.
    MediaQuery.of(context);
    Widget child;
    child = _buildDefaultLaunchImage();
    print('build');
    return Material(child: child);
  }

    Widget _buildDefaultLaunchImage() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        // 这里设置颜色 跟启动页一致的背景色，以免发生白屏闪烁
        color: Color.fromRGBO(0, 10, 24, 1),
        image: DecorationImage(
          // 注意：启动页 别搞太大 以免加载慢
          image: AssetImage(Constant.assetsImagesTabbar + 'yaoqing.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
