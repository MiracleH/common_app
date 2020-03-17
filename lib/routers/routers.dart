import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:common_app/routers/router_init.dart';

import 'package:common_app/views/mine/mine_router.dart';

import 'package:common_app/views/home/home_page.dart';
import 'package:common_app/views/splash/splash_page.dart';



class Routers {
  static String root = "/";
  static String homePage = "/home";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    // 闪屏页面
    router.define(root,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    SplashPage()));
    // 主页面
    router.define(homePage,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    HomePage()));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(MineRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
