import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/components/videoBanner.dart';
import 'package:flutter_eyepetizer/components/videoFactory.dart';
import 'package:flutter_eyepetizer/request/apiResponse.dart';
// request
import 'package:flutter_eyepetizer/request/httpUtils.dart';
// routes
import 'package:flutter_eyepetizer/router/index.dart';
// schema
import 'package:flutter_eyepetizer/schema/feed.dart';
import 'package:flutter_eyepetizer/utils/api.dart';
// utils
import 'package:flutter_eyepetizer/utils/toast.dart';
// widget
import 'package:flutter_eyepetizer/widget/imgState.dart';
import 'package:flutter_eyepetizer/widget/myButton.dart';
import 'package:flutter_eyepetizer/widget/myLoading.dart';
import 'package:flutter_eyepetizer/widget/myState.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppBarTabHome extends StatefulWidget {
  AppBarTabHome({Key? key}) : super(key: key);

  @override
  _AppBarTabHomeState createState() => _AppBarTabHomeState();
}

class _AppBarTabHomeState extends State<AppBarTabHome>
    with AutomaticKeepAliveClientMixin {
  bool? isInit;
  // 0加载中 1加载成功 2 失败
  int stateCode = 0;
  List<FeedIssueListItemList?> _swiperList = [];
  List<FeedIssueListItemList?> _itemList = [];
  String initPageUrl = Api.getFirstHomeData;
  String? nextPageUrl;
  bool isShowFloatBtn = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController = ScrollController();

  AppBar _buildPulicAppBar() {
    return AppBar(
      titleSpacing: 0,
      leading: Container(),
      title: Container(
        alignment: Alignment.center,
        child: Text("日报"),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Get.toNamed(PageName.SEARCH);
          },
        ),
      ],
    );
  }

  Future<ApiResponse<Feed>> getFeedData(url) async {
    try {
      dynamic response = await HttpUtils.get(url);
      // print(response);
      Feed data = Feed.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      print(e);
      return ApiResponse.error(e.error);
    }
  }

  Future<void> _refresh() async {
    _refreshController.refreshCompleted(resetFooterState: true);
    ApiResponse<Feed> swiperResponse = await getFeedData(initPageUrl);
    if (!mounted) {
      return;
    }
    if (swiperResponse.status == Status.COMPLETED) {
      setState(() {
        nextPageUrl = swiperResponse.data!.nextPageUrl;
        _swiperList = [];
        _swiperList.addAll(swiperResponse.data!.issueList![0]!.itemList!);
        _itemList = [];
      });
      // 拉取新的，列表
      await _loading();
    } else if (swiperResponse.status == Status.ERROR) {
      setState(() {
        stateCode = 2;
      });
      String errMsg = swiperResponse.exception!.getMessage();
      publicToast(errMsg);
      print("发生错误，位置home bottomBar1 swiper， url: ${initPageUrl}");
      print(swiperResponse.exception);
    }
  }

  Future<void> _loading() async {
    ApiResponse<Feed> itemResponse = await getFeedData(nextPageUrl!);
    _setRefreshState(itemResponse);
    if (!mounted) {
      return;
    }
    if (itemResponse.status == Status.COMPLETED) {
      setState(() {
        stateCode = 1;
        isInit = isInit ?? true;
        nextPageUrl = itemResponse.data!.nextPageUrl;
        _itemList.addAll(itemResponse.data!.issueList![0]!.itemList!);
      });
    } else if (itemResponse.status == Status.ERROR) {
      setState(() {
        stateCode = isInit == true ? 1 : 2;
      });
      String errMsg = itemResponse.exception!.getMessage();
      publicToast(errMsg);
      print("发生错误，位置home bottomBar1 items， url: ${nextPageUrl}");
    }
  }

  void _setRefreshState(ApiResponse<Feed> res) {
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

  Widget _headerSwiper() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 220,
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int idx) {
            String posterUrl = _swiperList[idx]!.data!.cover!.feed!;
            String videoTitle = _swiperList[idx]!.data!.title!;
            return VideoFactory(
              id: _swiperList[idx]!.data!.id!.toString(),
              playUrl: _swiperList[idx]!.data!.playUrl!,
              title: _swiperList[idx]!.data!.title!,
              typeName: _swiperList[idx]!.data!.category!,
              desText: _swiperList[idx]!.data!.description!,
              subTime: DateTime.fromMillisecondsSinceEpoch(
                      _swiperList[idx]!.data!.releaseTime!)
                  .toString()
                  .substring(0, 19),
              avatarUrl: _swiperList[idx]!.data!.author != null
                  ? _swiperList[idx]!.data!.author!.icon!
                  : "",
              authorDes: _swiperList[idx]!.data!.author != null
                  ? _swiperList[idx]!.data!.author!.description!
                  : "",
              authorName: _swiperList[idx]!.data!.author != null
                  ? _swiperList[idx]!.data!.author!.name!
                  : "",
              videoPoster: posterUrl,
              child: Container(
                height: 220,
                child: Stack(
                  children: [
                    Positioned(
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
                      child: Container(
                        height: 40,
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            videoTitle,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      bottom: 0,
                      left: 0,
                      right: 0,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: _swiperList.length,
          pagination: SwiperPagination(margin: EdgeInsets.only(bottom: 45)),
        ),
      ),
    );
  }

  Widget _loadingItems() {
    List<Widget> childList = _itemList.asMap().keys.map((idx) {
      bool isNotExistAuthor =
          _itemList[idx]!.data!.author == null ? true : false;
      String videoTitle = _itemList[idx]!.data!.title!;
      String videoCategory = _itemList[idx]!.data!.category!;
      // String authorIcon = _itemList[idx]!.data!.author!.icon!;
      // String authorName = _itemList[idx]!.data!.author!.name!;
      String videoPoster = _itemList[idx]!.data!.cover!.feed!;
      return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            VideoFactory(
              id: _itemList[idx]!.data!.id!.toString(),
              playUrl: _itemList[idx]!.data!.playUrl!,
              title: _itemList[idx]!.data!.title!,
              typeName: _itemList[idx]!.data!.category!,
              desText: _itemList[idx]!.data!.description!,
              subTime: DateTime.fromMillisecondsSinceEpoch(
                      _itemList[idx]!.data!.releaseTime!)
                  .toString()
                  .substring(0, 19),
              avatarUrl: _itemList[idx]!.data!.author != null
                  ? _itemList[idx]!.data!.author!.icon!
                  : "",
              authorDes: _itemList[idx]!.data!.author != null
                  ? _itemList[idx]!.data!.author!.description!
                  : "",
              authorName: _itemList[idx]!.data!.author != null
                  ? _itemList[idx]!.data!.author!.name!
                  : "",
              videoPoster: videoPoster,
              child: Container(
                height: 210,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 0,
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
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        child: Text(
                          videoCategory,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VideoBanner(
              avatarUrl:
                  isNotExistAuthor ? "" : _itemList[idx]!.data!.author!.icon!,
              rowTitle: videoTitle,
              isAssets: isNotExistAuthor,
              rowDes:
                  isNotExistAuthor ? "暂无" : _itemList[idx]!.data!.author!.name!,
              slotChild: MyIconButton(
                icon: Icon(
                  Icons.share,
                  size: 30,
                  color: Colors.black54,
                ),
                cb: () {},
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 1,
              color: Colors.black12,
            ),
          ],
        ),
      );
    }).toList();

    return Column(
      children: childList,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (stateCode == 0) {
      return Scaffold(
        appBar: _buildPulicAppBar(),
        body: MyLoading(message: "加载中"),
      );
    } else if (stateCode == 1) {
      return Scaffold(
        appBar: _buildPulicAppBar(),
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
        body: SmartRefresher(
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
              if (idx == 0) {
                return _headerSwiper();
              } else {
                return _loadingItems();
              }
            },
            // itemExtent: 100.0,
            itemCount: 2,
            controller: _scrollController,
          ),
          onRefresh: _refresh,
          onLoading: _loading,
          controller: _refreshController,
        ),
      );
    } else if (stateCode == 2) {
      return Scaffold(
        appBar: _buildPulicAppBar(),
        body: MyState(
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
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
