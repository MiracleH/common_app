import 'package:fluro/fluro.dart';
import 'package:common_app/routers/router_init.dart';
import 'mine_page.dart';

class MineRouter implements IRouterProvider {
  static String minePage = "mine";

  @override
  void initRouter(Router router) {
    router.define(minePage,
        handler: Handler(handlerFunc: (_, params) => MinePage()));
  }
}
