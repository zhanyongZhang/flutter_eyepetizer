class Api {
  //base Url
  static const String baseUrl = "http://baobab.kaiyanapp.com/api/";

  //首页精选数据
  static const String getFirstHomeData = "${baseUrl}v2/feed";

  //根据视频ID 获取视频id=121313   //视频播放页面下面根据id加载的广告
  static const String getRelatedData = "${baseUrl}v4/video/related";

  //获取分类
  static const String getCategory = "${baseUrl}v4/categories";

  //获取分类详情列表 ?id=xxx
  static const String getCategoryDetailList =
      "${baseUrl}v4/categories/videoList";

  //获取全部排行榜的Info
  static const String getRankList = "${baseUrl}v4/rankList";

  //获取周排行
  static const String getWeekRankList =
      "${baseUrl}v4/rankList/videos?strategy=weekly";
  //获取月排行
  static const String getMonthRankList =
      "${baseUrl}v4/rankList/videos?strategy=monthly";
  //获取总排行
  static const String getHistoryRankList =
      "${baseUrl}v4/rankList/videos?strategy=historical";

  //获取专题列表
  static const topicsUrl = '${baseUrl}v3/specialTopics';

  //获取专题内容 /${params}
  static const topicsDetailUrl = '${baseUrl}v3/lightTopics/internal/';

  //获取关注数据
  static const String getFollowInfo = "${baseUrl}v4/tabs/follow";

  ///获取热门搜索词
  static const String getHotWords = "${baseUrl}v3/queries/hot";

  ///获取搜索结果
  static const String getSearchData =
      "${baseUrl}v1/search?&num=10&start=10&query=";
}
