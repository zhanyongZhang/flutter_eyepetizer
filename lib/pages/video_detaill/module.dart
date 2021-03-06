import 'package:dio/dio.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import 'package:flutter_eyepetizer/components/videoBanner.dart';
import 'package:flutter_eyepetizer/components/videoFactory.dart';
//
import 'package:flutter_eyepetizer/fijkplayer_skin/fijkplayer_skin.dart';
//
import 'package:flutter_eyepetizer/request/apiResponse.dart';
import 'package:flutter_eyepetizer/request/httpUtils.dart';
//
import 'package:flutter_eyepetizer/schema/video_related.dart';
//
import 'package:flutter_eyepetizer/service/videoHistory.dart';
//
import 'package:flutter_eyepetizer/utils/api.dart';
import 'package:flutter_eyepetizer/utils/toast.dart';
//
import 'package:flutter_eyepetizer/widget/imgState.dart';
import 'package:flutter_eyepetizer/widget/myLoading.dart';
import 'package:flutter_eyepetizer/widget/myState.dart';
import 'package:get/get.dart';

class PlayerShowConfig implements ShowConfigAbs {
  bool speedBtn = true;
  bool topBar = true;
  bool lockBtn = true;
  bool bottomPro = true;
  bool stateAuto = true;
}

class VideoDetaill extends StatefulWidget {
  VideoDetaill({Key? key}) : super(key: key);

  @override
  _VideoDetaillState createState() => _VideoDetaillState();
}

class _VideoDetaillState extends State<VideoDetaill>
    with AutomaticKeepAliveClientMixin {
  FijkPlayer player = FijkPlayer();
  ShowConfigAbs v_cfg = PlayerShowConfig();
  //
  bool isShowPlayer = false;
  //
  String curPlayUrl = Get.parameters["playUrl"]!;
  String videoId = Get.parameters["id"]!;
  String title = Get.parameters["title"]!;
  String typeName = Get.parameters["typeName"]!;
  String desText = Get.parameters["desText"]!;
  String subTime = Get.parameters["subTime"]!;
  String avatarUrl = Get.parameters["avatarUrl"]!;
  String authorDes = Get.parameters["authorDes"]!;
  String authorName = Get.parameters["authorName"]!;
  String videoPoster = Get.parameters["videoPoster"]!;
  bool isNotAuthor = Get.parameters["avatarUrl"]!.isEmpty ? true : false;

  // ???????????????
  HistoryService historyService = Get.put(HistoryService());

  @override
  void initState() {
    super.initState();
    // ???????????????
    Future.delayed(
      Duration(milliseconds: 400),
      () {
        setState(() {
          isShowPlayer = true;
        });
        player.setDataSource(
          curPlayUrl,
          autoPlay: true,
        );
      },
    );
    // ??????????????????
    historyService.add(
      id: videoId,
      playUrl: curPlayUrl,
      title: title,
      typeName: typeName,
      desText: desText,
      subTime: subTime,
      avatarUrl: avatarUrl,
      authorDes: authorDes,
      authorName: authorName,
      videoPoster: videoPoster,
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: videoId,
            child: isShowPlayer
                ? FijkView(
                    height: 260,
                    color: Colors.black,
                    fit: FijkFit.cover,
                    player: player,
                    panelBuilder: (
                      FijkPlayer player,
                      FijkData data,
                      BuildContext context,
                      Size viewSize,
                      Rect texturePos,
                    ) {
                      /// ????????????????????????
                      return CustomFijkPanel(
                        player: player,
                        viewSize: viewSize,
                        texturePos: texturePos,
                        pageContent: context,
                        showConfig: v_cfg,
                        curPlayUrl: curPlayUrl,
                      );
                    },
                  )
                : Container(
                    height: 260,
                    color: Colors.black,
                  ),
          ),
          VideoInfo(
            id: videoId,
            title: title,
            typeName: typeName,
            desText: desText,
            subTime: subTime,
            avatarUrl: avatarUrl,
            authorDes: authorDes,
            authorName: authorName,
            isNotAuthor: isNotAuthor,
            player: player,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class VideoInfo extends StatefulWidget {
  final String id;
  final String title;
  final String typeName;
  final String desText;
  final String subTime;
  final String avatarUrl;
  final String authorName;
  final String authorDes;
  final bool isNotAuthor;
  final FijkPlayer player;
  VideoInfo({
    Key? key,
    required this.id,
    required this.title,
    required this.typeName,
    required this.desText,
    required this.subTime,
    required this.avatarUrl,
    required this.authorName,
    required this.authorDes,
    required this.isNotAuthor,
    required this.player,
  }) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo>
    with AutomaticKeepAliveClientMixin {
  String get id => widget.id;
  bool get isNotAuthor => widget.isNotAuthor;
  FijkPlayer get player => widget.player;
  // 0????????? 1???????????? 2 ??????
  int stateCode = 0;
  String nextPageUrl = Api.getRelatedData;
  List<VideoRelatedItemList?> _itemList = [];

  Future<ApiResponse<VideoRelated>> getVideoRelatedData() async {
    try {
      dynamic response = await HttpUtils.get('${nextPageUrl}?id=${id}');
      print(response);
      VideoRelated data = VideoRelated.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      print(e);
      return ApiResponse.error(e.error);
    }
  }

  Future<void> _pullData() async {
    ApiResponse<VideoRelated> relatedResponse = await getVideoRelatedData();
    if (!mounted) {
      return;
    }
    if (relatedResponse.status == Status.COMPLETED) {
      setState(() {
        stateCode = 1;
        _itemList.addAll(relatedResponse.data!.itemList!);
      });
    } else if (relatedResponse.status == Status.ERROR) {
      setState(() {
        stateCode = 2;
      });
      String errMsg = relatedResponse.exception!.getMessage();
      publicToast(errMsg);
      print("?????????????????????video_detaill??? url: ${nextPageUrl}?id=${id}");
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
      bodyView = Container(
        alignment: Alignment.center,
        child: MyLoading(message: "?????????"),
      );
    } else if (stateCode == 1) {
      bodyView = Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      // ??????
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      // ??????
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '????????? ${widget.typeName}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      // ??????
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          child: Text(
                            widget.desText,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1),
              !isNotAuthor
                  ? Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: VideoBanner(
                        avatarUrl: widget.avatarUrl,
                        rowTitle: widget.authorName,
                        rowDes: widget.authorDes,
                        slotChild: Container(),
                      ),
                    )
                  : Container(),
              Divider(height: isNotAuthor ? 0 : 1),
              Container(
                child: Column(
                  children: _itemList.map((e) {
                    return VideoFactory(
                      id: e!.data!.id!.toString(),
                      playUrl: e.data!.playUrl!,
                      title: e.data!.title!,
                      typeName: e.data!.category!,
                      desText: e.data!.description!,
                      subTime: DateTime.fromMillisecondsSinceEpoch(
                              e.data!.releaseTime!)
                          .toString()
                          .substring(0, 19),
                      avatarUrl:
                          e.data!.author != null ? e.data!.author!.icon! : "",
                      authorDes: e.data!.author != null
                          ? e.data!.author!.description!
                          : "",
                      authorName:
                          e.data!.author != null ? e.data!.author!.name! : "",
                      videoPoster: e.data!.cover!.feed!,
                      isPopCurRoute: true,
                      routerPopEnter: () async {
                        await player.stop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black12),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: FadeInImage(
                                  placeholder:
                                      AssetImage('images/movie-lazy.gif'),
                                  image: NetworkImage(e.data!.cover!.feed!),
                                  imageErrorBuilder: (context, obj, trace) {
                                    return ImgState(
                                      msg: "????????????",
                                      icon: Icons.broken_image,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.data!.title!,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        e.data!.description!,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 13,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      );
    } else if (stateCode == 2) {
      bodyView = Container(
        alignment: Alignment.center,
        child: MyState(
          cb: () async {
            setState(() {
              stateCode = 0;
            });
            await _pullData();
          },
          icon: Icon(
            Icons.new_releases,
            size: 100,
            color: Colors.red,
          ),
          text: "??????????????????",
          btnText: "????????????",
        ),
      );
    } else {
      bodyView = Container();
    }
    return Expanded(
      child: bodyView,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
