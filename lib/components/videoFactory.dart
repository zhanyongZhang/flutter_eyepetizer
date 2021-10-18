import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/router/index.dart';
import 'package:get/get.dart';

class VideoFactory extends StatelessWidget {
  final String id;
  final String playUrl;
  final String title;
  final String typeName;
  final String desText;
  final String subTime;
  final String avatarUrl;
  final String authorDes;
  final String authorName;
  final String videoPoster;
  final Widget child;
  final bool isPopCurRoute;
  Function? routerPopEnter;
  VideoFactory({
    Key? key,
    required this.id,
    required this.playUrl,
    required this.title,
    required this.typeName,
    required this.desText,
    required this.subTime,
    required this.avatarUrl,
    required this.authorDes,
    required this.authorName,
    required this.videoPoster,
    required this.child,
    this.isPopCurRoute = false,
    this.routerPopEnter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isPopCurRoute) {
          await routerPopEnter!();
          Get.back();
        }
        Get.toNamed(
          PageName.VIDEO_DETAILL,
          parameters: {
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
          },
        );
      },
      child: Hero(
        tag: id,
        child: child,
      ),
    );
  }
}
