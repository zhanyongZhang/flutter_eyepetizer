import 'package:flutter/material.dart';
import 'package:get/get.dart';
//
import 'package:flutter_eyepetizer/router/index.dart';
//
import 'package:flutter_eyepetizer/service/videoHistory.dart';
import 'package:flutter_eyepetizer/utils/api.dart';
import 'package:flutter_eyepetizer/utils/storage.dart';
//
import 'package:flutter_eyepetizer/request/httpUtils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  await initStore();
  runApp(MyApp());
}

Future<void> initStore() async {
  // 初始化本地存储类
  await SpUtil().init();
  // 初始化request类
  HttpUtils.init(
    baseUrl: Api.baseUrl,
  );
  // 历史记录，全局
  await Get.putAsync(() => HistoryService().init());
  print("全局注入");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutes.INIT_ROUTER,
      getPages: PageRoutes.routes,
    );
  }
}
