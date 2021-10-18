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
import 'package:flutter_eyepetizer/router/index.dart';
//
import 'package:flutter_eyepetizer/schema/follow.dart';
import 'package:flutter_eyepetizer/schema/reel.dart';
import 'package:flutter_eyepetizer/schema/types.dart';
//
import 'package:flutter_eyepetizer/utils/api.dart';
import 'package:flutter_eyepetizer/utils/toast.dart';
//
import 'package:flutter_eyepetizer/widget/imgState.dart';
import 'package:flutter_eyepetizer/widget/myButton.dart';
import 'package:flutter_eyepetizer/widget/myLoading.dart';
import 'package:flutter_eyepetizer/widget/myState.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppBarTabExplore extends StatefulWidget {
  AppBarTabExplore({Key? key}) : super(key: key);

  @override
  _AppBarTabExploreState createState() => _AppBarTabExploreState();
}

class _AppBarTabExploreState extends State<AppBarTabExplore>
    with AutomaticKeepAliveClientMixin {
  List<Widget> _tabLabelList = [
    '关注',
    '分类',
    '专题',
  ].map((e) {
    return Tab(
      text: e,
    );
  }).toList();
  List<Widget> _tabBodyList = [
    FollowTab(),
    TypesTab(),
    ReelTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBodyList.length,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: Container(),
          title: Container(
            alignment: Alignment.center,
            child: Text("发现"),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Get.toNamed(PageName.SEARCH);
              },
            ),
          ],
          bottom: TabBar(
            tabs: _tabLabelList,
          ),
        ),
        body: TabBarView(
          children: _tabBodyList,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// 关注
class FollowTab extends StatefulWidget {
  FollowTab({Key? key}) : super(key: key);

  @override
  FollowTabState createState() => FollowTabState();
}

class FollowTabState extends State<FollowTab>
    with AutomaticKeepAliveClientMixin {
  bool? isInit;
  // 0加载中 1加载成功 2 失败
  int stateCode = 0;
  List<FollowItemList?> _itemList = [];
  String initPageUrl = Api.getFollowInfo;
  String? nextPageUrl = Api.getFollowInfo;
  bool isShowFloatBtn = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController = ScrollController();

  Future<ApiResponse<Follow>> getFollowData() async {
    try {
      dynamic response = await HttpUtils.get(nextPageUrl!);
      print(response);
      Follow data = Follow.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      print(e);
      return ApiResponse.error(e.error);
    }
  }

  Future<void> _refresh() async {
    _refreshController.refreshCompleted(resetFooterState: true);
    nextPageUrl = initPageUrl;
    await _loading(true);
  }

  Future<void> _loading([bool isReset = false]) async {
    ApiResponse<Follow> itemResponse = await getFollowData();
    _setRefreshState(itemResponse);
    if (!mounted) {
      return;
    }
    if (itemResponse.status == Status.COMPLETED) {
      setState(() {
        if (isReset) {
          _itemList = [];
        }
        isInit = isInit ?? true;
        stateCode = 1;
        nextPageUrl = itemResponse.data!.nextPageUrl;
        _itemList.addAll(itemResponse.data!.itemList!);
      });
    } else if (itemResponse.status == Status.ERROR) {
      setState(() {
        stateCode = isInit == true ? 1 : 2;
      });
      String errMsg = itemResponse.exception!.getMessage();
      publicToast(errMsg);
      print("发生错误，位置home bottomBar2 tab1 => 关注， url: ${nextPageUrl}");
    }
  }

  void _setRefreshState(ApiResponse<Follow> res) {
    if (!mounted) return;
    if (res.status == Status.COMPLETED && res.data!.nextPageUrl == null) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  void _initScrollEvent() {
    _scrollController.addListener(() {
      if (_scrollController.offset < 1000 && isShowFloatBtn) {
        setState(() {
          isShowFloatBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && isShowFloatBtn == false) {
        setState(() {
          isShowFloatBtn = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
    _initScrollEvent();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (stateCode == 0) {
      body = MyLoading(message: "加载中");
    } else if (stateCode == 1) {
      body = SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        footer: CustomFooter(
          builder: (context, mode) {
            Widget? body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(width: 20),
                  Text('内容加载中'),
                ],
              );
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多！");
            } else if (mode == LoadStatus.noMore) {
              body = Text("没有更多数据了！");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int idx) {
            String authorIcon = _itemList[idx]!.data!.header!.icon!;
            String authorName = _itemList[idx]!.data!.header!.title!;
            String authorDes = _itemList[idx]!.data!.header!.description!;
            //
            List<Widget> curCartChildList =
                _itemList[idx]!.data!.itemList!.map((item) {
              //
              String curVideoItemPoster = item!.data!.cover!.feed!;
              String curVideoItemCategory = item.data!.category!;
              String curVideoItemTitle = item.data!.title!;
              String curVideoItemSubTime =
                  DateTime.fromMillisecondsSinceEpoch(item.data!.releaseTime!)
                      .toString()
                      .substring(0, 19);
              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: Container(
                  width: 260,
                  child: Column(
                    children: [
                      VideoFactory(
                        id: item.data!.id!.toString(),
                        playUrl: item.data!.playUrl!,
                        title: item.data!.title!,
                        typeName: item.data!.category!,
                        desText: item.data!.description!,
                        subTime: DateTime.fromMillisecondsSinceEpoch(
                                item.data!.releaseTime!)
                            .toString()
                            .substring(0, 19),
                        avatarUrl: item.data!.author != null
                            ? item.data!.author!.icon!
                            : "",
                        authorDes: item.data!.author != null
                            ? item.data!.author!.description!
                            : "",
                        authorName: item.data!.author != null
                            ? item.data!.author!.name!
                            : "",
                        videoPoster: curVideoItemPoster,
                        child: Container(
                          height: 160,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                top: 0,
                                child: FadeInImage(
                                  placeholder:
                                      AssetImage('images/movie-lazy.gif'),
                                  image: NetworkImage(curVideoItemPoster),
                                  imageErrorBuilder: (context, obj, trace) {
                                    return ImgState(
                                      msg: "加载失败",
                                      icon: Icons.broken_image,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  color: Color.fromRGBO(255, 255, 255, 0.9),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      curVideoItemCategory,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    curVideoItemTitle,
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Container(
                                  child: Text(
                                    curVideoItemSubTime,
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black45,
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
                ),
              );
            }).toList();
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 8,
                  bottom: 0,
                ),
                child: Container(
                  child: Column(
                    children: [
                      VideoBanner(
                        avatarUrl: authorIcon,
                        rowTitle: authorName,
                        rowDes: authorDes,
                        slotChild: MyIconButton(
                          icon: Icon(
                            Icons.share,
                            size: 28,
                            color: Colors.black54,
                          ),
                          cb: () {},
                        ),
                      ),
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: curCartChildList,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          // itemExtent: 100.0,
          itemCount: _itemList.length,
          controller: _scrollController,
        ),
        onRefresh: _refresh,
        onLoading: _loading,
        controller: _refreshController,
      );
    } else if (stateCode == 2) {
      body = MyState(
        cb: () async {
          setState(() {
            stateCode = 0;
          });
          // 重新加载
          await _refresh();
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
      body = Container();
    }
    return Scaffold(
      floatingActionButton: isShowFloatBtn
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  .0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
      body: body,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// 分类
class TypesTab extends StatefulWidget {
  TypesTab({Key? key}) : super(key: key);

  @override
  _TypesTabState createState() => _TypesTabState();
}

class _TypesTabState extends State<TypesTab>
    with AutomaticKeepAliveClientMixin {
  // 0加载中 1加载成功 2 失败
  int stateCode = 0;
  List<TypesData?> _typeList = [];
  String typesUrl = Api.getCategory;

  Future<ApiResponse<Types>> getTypesData() async {
    try {
      dynamic response = await HttpUtils.get(typesUrl);
      print(response);
      Types data = Types.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      print(e);
      return ApiResponse.error(e.error);
    }
  }

  Future<void> _refresh() async {
    ApiResponse<Types> typeResponse = await getTypesData();
    if (!mounted) {
      return;
    }
    if (typeResponse.status == Status.COMPLETED) {
      setState(() {
        stateCode = 1;
        _typeList.addAll(typeResponse.data!.data!);
      });
    } else if (typeResponse.status == Status.ERROR) {
      setState(() {
        stateCode = 2;
      });
      String errMsg = typeResponse.exception!.getMessage();
      publicToast(errMsg);
      print("发生错误，位置home bottomBar2 tab2 => 分类， url: ${typesUrl}");
    }
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyView;
    if (stateCode == 0) {
      bodyView = MyLoading(message: "加载中");
    } else if (stateCode == 1) {
      bodyView = Padding(
        padding: EdgeInsets.all(3),
        child: GridView.builder(
          itemCount: _typeList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //每行三列
            childAspectRatio: 1.0, //显示区域宽高相等
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
          ),
          itemBuilder: (ctx, idx) {
            String posterUrl = _typeList[idx]!.bgPicture!;
            String curTypeName = _typeList[idx]!.name!;
            String headerImg = _typeList[idx]!.headerImage!;
            String typeId = _typeList[idx]!.id!.toString();
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  PageName.TYPE_DETAILL,
                  parameters: {
                    "headerImg": headerImg,
                    "typeName": curTypeName,
                    "id": typeId,
                  },
                );
              },
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: FadeInImage(
                        height: 220,
                        placeholder: AssetImage('images/movie-lazy.gif'),
                        image: NetworkImage(posterUrl),
                        imageErrorBuilder: (context, obj, trace) {
                          return ImgState(
                            msg: "加载失败",
                            icon: Icons.broken_image,
                            errBgColor: Colors.black,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Container(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        alignment: Alignment.center,
                        child: Text(
                          curTypeName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else if (stateCode == 2) {
      bodyView = MyState(
        cb: () async {
          setState(() {
            stateCode = 0;
          });
          // 重新加载
          await _refresh();
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
      body: bodyView,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// 专题
class ReelTab extends StatefulWidget {
  ReelTab({Key? key}) : super(key: key);

  @override
  _ReelTabState createState() => _ReelTabState();
}

class _ReelTabState extends State<ReelTab> with AutomaticKeepAliveClientMixin {
  bool? isInit;
  // 0加载中 1加载成功 2 失败
  int stateCode = 0;
  List<ReelItemList?> _reelList = [];
  String initPageUrl = Api.topicsUrl;
  String? nextPageUrl = Api.topicsUrl;
  bool isShowFloatBtn = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController = ScrollController();

  Future<ApiResponse<Reel>> getReelData() async {
    try {
      dynamic response = await HttpUtils.get(nextPageUrl!);
      print(response);
      Reel data = Reel.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      print(e);
      return ApiResponse.error(e.error);
    }
  }

  Future<void> _refresh() async {
    _refreshController.refreshCompleted(resetFooterState: true);
    nextPageUrl = initPageUrl;
    await _loading(true);
  }

  Future<void> _loading([bool isReset = false]) async {
    ApiResponse<Reel> reelResponse = await getReelData();
    _setRefreshState(reelResponse);
    if (!mounted) {
      return;
    }
    if (reelResponse.status == Status.COMPLETED) {
      setState(() {
        if (isReset) {
          _reelList = [];
        }
        isInit = isInit ?? true;
        stateCode = 1;
        nextPageUrl = reelResponse.data!.nextPageUrl;
        _reelList.addAll(reelResponse.data!.itemList!);
      });
    } else if (reelResponse.status == Status.ERROR) {
      setState(() {
        stateCode = isInit == true ? 1 : 2;
      });
      String errMsg = reelResponse.exception!.getMessage();
      publicToast(errMsg);
      print("发生错误，位置home bottomBar2 tab3 => 专题， url: ${nextPageUrl}");
    }
  }

  void _setRefreshState(ApiResponse<Reel> res) {
    if (!mounted) return;
    if (res.status == Status.COMPLETED && res.data!.nextPageUrl == null) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  void _initScrollEvent() {
    _scrollController.addListener(() {
      if (_scrollController.offset < 1000 && isShowFloatBtn) {
        setState(() {
          isShowFloatBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && isShowFloatBtn == false) {
        setState(() {
          isShowFloatBtn = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _refresh();
    _initScrollEvent();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyView;
    if (stateCode == 0) {
      bodyView = MyLoading(message: "加载中");
    } else if (stateCode == 1) {
      bodyView = SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        footer: CustomFooter(
          builder: (context, mode) {
            Widget? body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(width: 20),
                  Text('内容加载中'),
                ],
              );
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多！");
            } else if (mode == LoadStatus.noMore) {
              body = Text("没有更多数据了！");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext ctx, int idx) {
            String curReelItemPoster = _reelList[idx]!.data!.image!;
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    try {
                      String enCodeUrl = _reelList[idx]!.data!.actionUrl!;
                      if (enCodeUrl is String) {
                        String webUrl =
                            Uri.parse(enCodeUrl).queryParameters["url"]!;
                        String queryId =
                            Uri.parse(webUrl).queryParameters["nid"]!;
                        String queryTitle =
                            Uri.parse(enCodeUrl).queryParameters["title"]!;
                        Get.toNamed(
                          PageName.REEL_DETAILL,
                          parameters: {
                            "id": queryId,
                            "title": queryTitle,
                          },
                        );
                      }
                    } catch (err) {
                      print(err);
                      publicToast("发生错误");
                    }
                  },
                  child: Container(
                    height: 210,
                    child: FadeInImage(
                      placeholder: AssetImage('images/movie-lazy.gif'),
                      image: NetworkImage(curReelItemPoster),
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
              ),
            );
          },
          // itemExtent: 100.0,
          itemCount: _reelList.length,
          controller: _scrollController,
        ),
        onRefresh: _refresh,
        onLoading: _loading,
        controller: _refreshController,
      );
    } else if (stateCode == 2) {
      bodyView = MyState(
        cb: () async {
          setState(() {
            stateCode = 0;
          });
          // 重新加载
          await _refresh();
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
      body: bodyView,
      floatingActionButton: isShowFloatBtn
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(
                  .0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
