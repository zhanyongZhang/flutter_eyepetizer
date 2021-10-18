import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_eyepetizer/components/videoBanner.dart';
import 'package:flutter_eyepetizer/components/videoFactory.dart';
//
import 'package:flutter_eyepetizer/request/apiResponse.dart';
import 'package:flutter_eyepetizer/request/httpUtils.dart';
//
import 'package:flutter_eyepetizer/schema/reel_info.dart';
//
import 'package:flutter_eyepetizer/utils/api.dart';
import 'package:flutter_eyepetizer/utils/toast.dart';
//
import 'package:flutter_eyepetizer/widget/imgState.dart';
import 'package:flutter_eyepetizer/widget/myLoading.dart';
import 'package:flutter_eyepetizer/widget/myState.dart';
import 'package:get/get.dart';

class ReelDetaill extends StatefulWidget {
  ReelDetaill({Key? key}) : super(key: key);

  @override
  _ReelDetaillState createState() => _ReelDetaillState();
}

class _ReelDetaillState extends State<ReelDetaill>
    with AutomaticKeepAliveClientMixin {
  // 0加载中 1加载成功 2 失败
  int stateCode = 0;
  ReelInfo? reelInfo;
  String pageTitle = Get.parameters["title"] ?? "专题";
  String initPageUrl = Api.topicsDetailUrl;

  Future<ApiResponse<ReelInfo>> getReelInfoData() async {
    try {
      String paramId = Get.parameters["id"]!;
      dynamic response = await HttpUtils.get(initPageUrl + paramId);
      print(response);
      ReelInfo data = ReelInfo.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      print(e);
      return ApiResponse.error(e.error);
    }
  }

  Future<void> _pullData() async {
    ApiResponse<ReelInfo> reelInfoResponse = await getReelInfoData();
    if (!mounted) {
      return;
    }
    if (reelInfoResponse.status == Status.COMPLETED) {
      setState(() {
        stateCode = 1;
        reelInfo = reelInfoResponse.data;
      });
    } else if (reelInfoResponse.status == Status.ERROR) {
      setState(() {
        stateCode = 2;
      });
      String errMsg = reelInfoResponse.exception!.getMessage();
      publicToast(errMsg);
      print("发生错误，位置reel_detaill， url: ${initPageUrl}");
    }
  }

  @override
  void initState() {
    super.initState();
    _pullData();
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyView;
    if (stateCode == 0) {
      bodyView = MyLoading(message: "加载中");
    } else if (stateCode == 1) {
      bodyView = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Header(
              title: reelInfo!.brief!,
              desText: reelInfo!.text,
              bgImg: reelInfo!.headerImage,
            ),
            CollList(
              children: reelInfo!.itemList!,
            ),
          ],
        ),
      );
    } else if (stateCode == 2) {
      bodyView = MyState(
        cb: () async {
          setState(() {
            stateCode = 0;
          });
          // 重新加载
          await _pullData();
        },
        icon: Icon(
          Icons.new_releases,
          size: 100,
          color: Colors.red,
        ),
        text: "数据加载失败",
        btnText: '点击重试',
      );
    } else {
      bodyView = Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(pageTitle),
        ),
        actions: [
          Container(),
        ],
      ),
      body: bodyView,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Header extends StatelessWidget {
  String? bgImg;
  String? title;
  String? desText;
  Header({
    Key? key,
    this.bgImg,
    this.title,
    this.desText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 260,
              child: FadeInImage(
                placeholder: AssetImage('images/movie-lazy.gif'),
                image: NetworkImage(bgImg!),
                imageErrorBuilder: (context, obj, trace) {
                  return ImgState(
                    msg: "加载失败",
                    icon: Icons.broken_image,
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    // title
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black12),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          title!,
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    // des
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          desText!,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CollList extends StatelessWidget {
  List<ReelInfoItemList?>? children;
  CollList({Key? key, this.children}) : super(key: key);

  Widget _buildContextWidget() {
    if (children!.isEmpty) {
      return Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.new_releases,
              size: 60,
              color: Colors.red,
            ),
            SizedBox(height: 10),
            Text('暂无专题内容 ╮(╯▽╰)╭'),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Column(
          children: children!.map((e) {
            String videoPoster = e!.data!.content!.data!.cover!.feed!;
            return Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12)),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    VideoBanner(
                      avatarUrl: e.data!.content!.data!.author!.icon!,
                      rowTitle: e.data!.content!.data!.author!.name!,
                      slotChild: Container(),
                      rowDes: DateTime.fromMillisecondsSinceEpoch(
                              e.data!.content!.data!.releaseTime!)
                          .toString()
                          .substring(0, 19),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e.data!.content!.data!.title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e.data!.content!.data!.descriptionEditor!,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    VideoFactory(
                      id: e.id!.toString(),
                      playUrl: e.data!.content!.data!.playUrl!,
                      title: e.data!.content!.data!.title!,
                      typeName: e.data!.content!.data!.category!,
                      desText: e.data!.content!.data!.description!,
                      subTime: DateTime.fromMillisecondsSinceEpoch(
                              e.data!.content!.data!.releaseTime!)
                          .toString()
                          .substring(0, 19),
                      avatarUrl: e.data!.content!.data!.author != null
                          ? e.data!.content!.data!.author!.icon!
                          : "",
                      authorDes: e.data!.content!.data!.author != null
                          ? e.data!.content!.data!.author!.description!
                          : "",
                      authorName: e.data!.content!.data!.author != null
                          ? e.data!.content!.data!.author!.name!
                          : "",
                      videoPoster: videoPoster,
                      child: Container(
                        height: 210,
                        child: FadeInImage(
                          placeholder: AssetImage('images/movie-lazy.gif'),
                          image: NetworkImage(videoPoster),
                          imageErrorBuilder: (context, obj, trace) {
                            return ImgState(
                              msg: "加载失败",
                              icon: Icons.broken_image,
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContextWidget();
  }
}
