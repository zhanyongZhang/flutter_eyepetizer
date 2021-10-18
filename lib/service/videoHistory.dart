// utils
import 'package:flutter_eyepetizer/utils/storage.dart';
import 'package:get/get.dart';

// 全局响应数据
class HistoryService extends GetxService {
  // 历史记录
  RxList<dynamic> hisList = [].obs;

  Future<HistoryService> init() async {
    List<Map<String, dynamic>> hisData =
        List.from(SpUtil().getJSON("history") ?? []);
    hisList.addAll(hisData);
    return this;
  }

  Future<bool> add({
    required String id,
    required String playUrl,
    required String title,
    required String typeName,
    required String desText,
    required String subTime,
    required String avatarUrl,
    required String authorDes,
    required String authorName,
    required String videoPoster,
  }) async {
    // 插入一条新的
    String newKey = id;
    // 检查是否存在
    bool isExist = hisList.any((el) => el["id"] == newKey);
    // 是否超出限制50个存储配额, 并且当前历史记录中没有这个视频
    if (hisList.length >= 50 && !isExist) {
      hisList.removeLast();
    }
    // 当前的id是否已经存在
    if (isExist) {
      // 存在就删除，重新插入，变化位置，插入到最前
      hisList.removeWhere((el) => el["id"] == newKey);
    }
    // 插入新的
    hisList.insert(0, <String, String>{
      "id": id,
      "playUrl": playUrl,
      "title": title,
      "typeName": typeName,
      "desText": desText,
      "subTime": subTime,
      "avatarUrl": avatarUrl,
      "authorDes": authorDes,
      "authorName": authorName,
      "videoPoster": videoPoster,
    });
    // 存入
    // ignore: invalid_use_of_protected_member
    return SpUtil().setJSON('history', hisList.value);
  }

  Future<bool> removeKey(String keyName) async {
    hisList.removeWhere((element) => true);
    return SpUtil().remove(keyName);
  }
}
