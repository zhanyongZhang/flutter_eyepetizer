///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class PopularCollItemListDataPlayInfoUrlList {
/*
{
  "name": "aliyun",
  "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=",
  "size": 6300150
} 
*/

  String? name;
  String? url;
  int? size;

  PopularCollItemListDataPlayInfoUrlList({
    this.name,
    this.url,
    this.size,
  });
  PopularCollItemListDataPlayInfoUrlList.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    url = json["url"]?.toString();
    size = json["size"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["url"] = url;
    data["size"] = size;
    return data;
  }
}

class PopularCollItemListDataPlayInfo {
/*
{
  "height": 480,
  "width": 854,
  "urlList": [
    {
      "name": "aliyun",
      "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=",
      "size": 6300150
    }
  ],
  "name": "标清",
  "type": "normal",
  "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid="
} 
*/

  int? height;
  int? width;
  List<PopularCollItemListDataPlayInfoUrlList?>? urlList;
  String? name;
  String? type;
  String? url;

  PopularCollItemListDataPlayInfo({
    this.height,
    this.width,
    this.urlList,
    this.name,
    this.type,
    this.url,
  });
  PopularCollItemListDataPlayInfo.fromJson(Map<String, dynamic> json) {
    height = json["height"]?.toInt();
    width = json["width"]?.toInt();
    if (json["urlList"] != null) {
      final v = json["urlList"];
      final arr0 = <PopularCollItemListDataPlayInfoUrlList>[];
      v.forEach((v) {
        arr0.add(PopularCollItemListDataPlayInfoUrlList.fromJson(v));
      });
      urlList = arr0;
    }
    name = json["name"]?.toString();
    type = json["type"]?.toString();
    url = json["url"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["height"] = height;
    data["width"] = width;
    if (urlList != null) {
      final v = urlList;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["urlList"] = arr0;
    }
    data["name"] = name;
    data["type"] = type;
    data["url"] = url;
    return data;
  }
}

class PopularCollItemListDataWebUrl {
/*
{
  "raw": "http://www.eyepetizer.net/detail.html?vid=6482",
  "forWeibo": "http://wandou.im/1vcy1m"
} 
*/

  String? raw;
  String? forWeibo;

  PopularCollItemListDataWebUrl({
    this.raw,
    this.forWeibo,
  });
  PopularCollItemListDataWebUrl.fromJson(Map<String, dynamic> json) {
    raw = json["raw"]?.toString();
    forWeibo = json["forWeibo"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["raw"] = raw;
    data["forWeibo"] = forWeibo;
    return data;
  }
}

class PopularCollItemListDataCover {
/*
{
  "feed": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
  "detail": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
  "blurred": "http://img.kaiyanapp.com/d3ad0df9992489946127fe4d3f4dbab9.jpeg?imageMogr2/quality/100"
} 
*/

  String? feed;
  String? detail;
  String? blurred;

  PopularCollItemListDataCover({
    this.feed,
    this.detail,
    this.blurred,
  });
  PopularCollItemListDataCover.fromJson(Map<String, dynamic> json) {
    feed = json["feed"]?.toString();
    detail = json["detail"]?.toString();
    blurred = json["blurred"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["feed"] = feed;
    data["detail"] = detail;
    data["blurred"] = blurred;
    return data;
  }
}

class PopularCollItemListDataAuthorShield {
/*
{
  "itemType": "author",
  "itemId": 2162,
  "shielded": false
} 
*/

  String? itemType;
  int? itemId;
  bool? shielded;

  PopularCollItemListDataAuthorShield({
    this.itemType,
    this.itemId,
    this.shielded,
  });
  PopularCollItemListDataAuthorShield.fromJson(Map<String, dynamic> json) {
    itemType = json["itemType"]?.toString();
    itemId = json["itemId"]?.toInt();
    shielded = json["shielded"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["itemType"] = itemType;
    data["itemId"] = itemId;
    data["shielded"] = shielded;
    return data;
  }
}

class PopularCollItemListDataAuthorFollow {
/*
{
  "itemType": "author",
  "itemId": 2162,
  "followed": false
} 
*/

  String? itemType;
  int? itemId;
  bool? followed;

  PopularCollItemListDataAuthorFollow({
    this.itemType,
    this.itemId,
    this.followed,
  });
  PopularCollItemListDataAuthorFollow.fromJson(Map<String, dynamic> json) {
    itemType = json["itemType"]?.toString();
    itemId = json["itemId"]?.toInt();
    followed = json["followed"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["itemType"] = itemType;
    data["itemId"] = itemId;
    data["followed"] = followed;
    return data;
  }
}

class PopularCollItemListDataAuthor {
/*
{
  "id": 2162,
  "icon": "http://img.kaiyanapp.com/98beab66d3885a139b54f21e91817c4f.jpeg",
  "name": "全球广告精选",
  "description": "我们精选世界最好看的广告，为全世界广告人的精彩创意点赞。",
  "link": "",
  "latestReleaseTime": 1634432418000,
  "videoNum": 1627,
  "follow": {
    "itemType": "author",
    "itemId": 2162,
    "followed": false
  },
  "shield": {
    "itemType": "author",
    "itemId": 2162,
    "shielded": false
  },
  "approvedNotReadyVideoCount": 0,
  "ifPgc": true,
  "recSort": 0,
  "expert": false
} 
*/

  int? id;
  String? icon;
  String? name;
  String? description;
  String? link;
  int? latestReleaseTime;
  int? videoNum;
  PopularCollItemListDataAuthorFollow? follow;
  PopularCollItemListDataAuthorShield? shield;
  int? approvedNotReadyVideoCount;
  bool? ifPgc;
  int? recSort;
  bool? expert;

  PopularCollItemListDataAuthor({
    this.id,
    this.icon,
    this.name,
    this.description,
    this.link,
    this.latestReleaseTime,
    this.videoNum,
    this.follow,
    this.shield,
    this.approvedNotReadyVideoCount,
    this.ifPgc,
    this.recSort,
    this.expert,
  });
  PopularCollItemListDataAuthor.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    icon = json["icon"]?.toString();
    name = json["name"]?.toString();
    description = json["description"]?.toString();
    link = json["link"]?.toString();
    latestReleaseTime = json["latestReleaseTime"]?.toInt();
    videoNum = json["videoNum"]?.toInt();
    follow = (json["follow"] != null)
        ? PopularCollItemListDataAuthorFollow.fromJson(json["follow"])
        : null;
    shield = (json["shield"] != null)
        ? PopularCollItemListDataAuthorShield.fromJson(json["shield"])
        : null;
    approvedNotReadyVideoCount = json["approvedNotReadyVideoCount"]?.toInt();
    ifPgc = json["ifPgc"];
    recSort = json["recSort"]?.toInt();
    expert = json["expert"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["icon"] = icon;
    data["name"] = name;
    data["description"] = description;
    data["link"] = link;
    data["latestReleaseTime"] = latestReleaseTime;
    data["videoNum"] = videoNum;
    if (follow != null) {
      data["follow"] = follow!.toJson();
    }
    if (shield != null) {
      data["shield"] = shield!.toJson();
    }
    data["approvedNotReadyVideoCount"] = approvedNotReadyVideoCount;
    data["ifPgc"] = ifPgc;
    data["recSort"] = recSort;
    data["expert"] = expert;
    return data;
  }
}

class PopularCollItemListDataProvider {
/*
{
  "name": "YouTube",
  "alias": "youtube",
  "icon": "http://img.kaiyanapp.com/fa20228bc5b921e837156923a58713f6.png"
} 
*/

  String? name;
  String? alias;
  String? icon;

  PopularCollItemListDataProvider({
    this.name,
    this.alias,
    this.icon,
  });
  PopularCollItemListDataProvider.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    alias = json["alias"]?.toString();
    icon = json["icon"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["alias"] = alias;
    data["icon"] = icon;
    return data;
  }
}

class PopularCollItemListDataConsumption {
/*
{
  "collectionCount": 55332,
  "shareCount": 94636,
  "replyCount": 578,
  "realCollectionCount": 6451
} 
*/

  int? collectionCount;
  int? shareCount;
  int? replyCount;
  int? realCollectionCount;

  PopularCollItemListDataConsumption({
    this.collectionCount,
    this.shareCount,
    this.replyCount,
    this.realCollectionCount,
  });
  PopularCollItemListDataConsumption.fromJson(Map<String, dynamic> json) {
    collectionCount = json["collectionCount"]?.toInt();
    shareCount = json["shareCount"]?.toInt();
    replyCount = json["replyCount"]?.toInt();
    realCollectionCount = json["realCollectionCount"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["collectionCount"] = collectionCount;
    data["shareCount"] = shareCount;
    data["replyCount"] = replyCount;
    data["realCollectionCount"] = realCollectionCount;
    return data;
  }
}

class PopularCollItemListDataTags {
/*
{
  "id": 748,
  "name": "这些广告超有梗",
  "actionUrl": "eyepetizer://tag/748/?title=%E8%BF%99%E4%BA%9B%E5%B9%BF%E5%91%8A%E8%B6%85%E6%9C%89%E6%A2%97",
  "bgPicture": "http://img.kaiyanapp.com/9056413cfeffaf0c841d894390aa8e08.jpeg?imageMogr2/quality/60/format/jpg",
  "headerImage": "http://img.kaiyanapp.com/ff0f6d0ad5f4b6211a3f746aaaffd916.jpeg?imageMogr2/quality/60/format/jpg",
  "tagRecType": "IMPORTANT",
  "haveReward": false,
  "ifNewest": false,
  "communityIndex": 0
} 
*/

  int? id;
  String? name;
  String? actionUrl;
  String? bgPicture;
  String? headerImage;
  String? tagRecType;
  bool? haveReward;
  bool? ifNewest;
  int? communityIndex;

  PopularCollItemListDataTags({
    this.id,
    this.name,
    this.actionUrl,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.haveReward,
    this.ifNewest,
    this.communityIndex,
  });
  PopularCollItemListDataTags.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    actionUrl = json["actionUrl"]?.toString();
    bgPicture = json["bgPicture"]?.toString();
    headerImage = json["headerImage"]?.toString();
    tagRecType = json["tagRecType"]?.toString();
    haveReward = json["haveReward"];
    ifNewest = json["ifNewest"];
    communityIndex = json["communityIndex"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["actionUrl"] = actionUrl;
    data["bgPicture"] = bgPicture;
    data["headerImage"] = headerImage;
    data["tagRecType"] = tagRecType;
    data["haveReward"] = haveReward;
    data["ifNewest"] = ifNewest;
    data["communityIndex"] = communityIndex;
    return data;
  }
}

class PopularCollItemListData {
/*
{
  "dataType": "VideoBeanForClient",
  "id": 6482,
  "title": "嘿，你的安全套",
  "description": "这是一套神奇的互帮互助系统：当你和她激情燃烧却没有带安全套时，只需通过这套系统发送你的定位，就会有陌生人以最体面的方式为你解决燃眉之急。人们之间的善意以及体贴都通过这套系统体现出来了呢~From LLLLITL",
  "library": "DAILY",
  "tags": [
    {
      "id": 748,
      "name": "这些广告超有梗",
      "actionUrl": "eyepetizer://tag/748/?title=%E8%BF%99%E4%BA%9B%E5%B9%BF%E5%91%8A%E8%B6%85%E6%9C%89%E6%A2%97",
      "bgPicture": "http://img.kaiyanapp.com/9056413cfeffaf0c841d894390aa8e08.jpeg?imageMogr2/quality/60/format/jpg",
      "headerImage": "http://img.kaiyanapp.com/ff0f6d0ad5f4b6211a3f746aaaffd916.jpeg?imageMogr2/quality/60/format/jpg",
      "tagRecType": "IMPORTANT",
      "haveReward": false,
      "ifNewest": false,
      "communityIndex": 0
    }
  ],
  "consumption": {
    "collectionCount": 55332,
    "shareCount": 94636,
    "replyCount": 578,
    "realCollectionCount": 6451
  },
  "resourceType": "video",
  "provider": {
    "name": "YouTube",
    "alias": "youtube",
    "icon": "http://img.kaiyanapp.com/fa20228bc5b921e837156923a58713f6.png"
  },
  "category": "广告",
  "author": {
    "id": 2162,
    "icon": "http://img.kaiyanapp.com/98beab66d3885a139b54f21e91817c4f.jpeg",
    "name": "全球广告精选",
    "description": "我们精选世界最好看的广告，为全世界广告人的精彩创意点赞。",
    "link": "",
    "latestReleaseTime": 1634432418000,
    "videoNum": 1627,
    "follow": {
      "itemType": "author",
      "itemId": 2162,
      "followed": false
    },
    "shield": {
      "itemType": "author",
      "itemId": 2162,
      "shielded": false
    },
    "approvedNotReadyVideoCount": 0,
    "ifPgc": true,
    "recSort": 0,
    "expert": false
  },
  "cover": {
    "feed": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
    "detail": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
    "blurred": "http://img.kaiyanapp.com/d3ad0df9992489946127fe4d3f4dbab9.jpeg?imageMogr2/quality/100"
  },
  "playUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=",
  "duration": 77,
  "webUrl": {
    "raw": "http://www.eyepetizer.net/detail.html?vid=6482",
    "forWeibo": "http://wandou.im/1vcy1m"
  },
  "releaseTime": 1460995200000,
  "playInfo": [
    {
      "height": 480,
      "width": 854,
      "urlList": [
        {
          "name": "aliyun",
          "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=",
          "size": 6300150
        }
      ],
      "name": "标清",
      "type": "normal",
      "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid="
    }
  ],
  "ad": false,
  "type": "NORMAL",
  "ifLimitVideo": false,
  "searchWeight": 0,
  "idx": 0,
  "date": 1460995200000,
  "descriptionEditor": "这是一套神奇的互帮互助系统：当你和她激情燃烧却没有带安全套时，只需通过这套系统发送你的定位，就会有陌生人以最体面的方式为你解决燃眉之急。人们之间的善意以及体贴都通过这套系统体现出来了呢~From LLLLITL",
  "collected": false,
  "reallyCollected": false,
  "played": false
} 
*/

  String? dataType;
  int? id;
  String? title;
  String? description;
  String? theLibrary;
  List<PopularCollItemListDataTags?>? tags;
  PopularCollItemListDataConsumption? consumption;
  String? resourceType;
  PopularCollItemListDataProvider? provider;
  String? category;
  PopularCollItemListDataAuthor? author;
  PopularCollItemListDataCover? cover;
  String? playUrl;
  int? duration;
  PopularCollItemListDataWebUrl? webUrl;
  int? releaseTime;
  List<PopularCollItemListDataPlayInfo?>? playInfo;
  bool? ad;
  String? type;
  bool? ifLimitVideo;
  int? searchWeight;
  int? idx;
  int? date;
  String? descriptionEditor;
  bool? collected;
  bool? reallyCollected;
  bool? played;

  PopularCollItemListData({
    this.dataType,
    this.id,
    this.title,
    this.description,
    this.theLibrary,
    this.tags,
    this.consumption,
    this.resourceType,
    this.provider,
    this.category,
    this.author,
    this.cover,
    this.playUrl,
    this.duration,
    this.webUrl,
    this.releaseTime,
    this.playInfo,
    this.ad,
    this.type,
    this.ifLimitVideo,
    this.searchWeight,
    this.idx,
    this.date,
    this.descriptionEditor,
    this.collected,
    this.reallyCollected,
    this.played,
  });
  PopularCollItemListData.fromJson(Map<String, dynamic> json) {
    dataType = json["dataType"]?.toString();
    id = json["id"]?.toInt();
    title = json["title"]?.toString();
    description = json["description"]?.toString();
    theLibrary = json["library"]?.toString();
    if (json["tags"] != null) {
      final v = json["tags"];
      final arr0 = <PopularCollItemListDataTags>[];
      v.forEach((v) {
        arr0.add(PopularCollItemListDataTags.fromJson(v));
      });
      tags = arr0;
    }
    consumption = (json["consumption"] != null)
        ? PopularCollItemListDataConsumption.fromJson(json["consumption"])
        : null;
    resourceType = json["resourceType"]?.toString();
    provider = (json["provider"] != null)
        ? PopularCollItemListDataProvider.fromJson(json["provider"])
        : null;
    category = json["category"]?.toString();
    author = (json["author"] != null)
        ? PopularCollItemListDataAuthor.fromJson(json["author"])
        : null;
    cover = (json["cover"] != null)
        ? PopularCollItemListDataCover.fromJson(json["cover"])
        : null;
    playUrl = json["playUrl"]?.toString();
    duration = json["duration"]?.toInt();
    webUrl = (json["webUrl"] != null)
        ? PopularCollItemListDataWebUrl.fromJson(json["webUrl"])
        : null;
    releaseTime = json["releaseTime"]?.toInt();
    if (json["playInfo"] != null) {
      final v = json["playInfo"];
      final arr0 = <PopularCollItemListDataPlayInfo>[];
      v.forEach((v) {
        arr0.add(PopularCollItemListDataPlayInfo.fromJson(v));
      });
      playInfo = arr0;
    }
    ad = json["ad"];
    type = json["type"]?.toString();
    ifLimitVideo = json["ifLimitVideo"];
    searchWeight = json["searchWeight"]?.toInt();
    idx = json["idx"]?.toInt();
    date = json["date"]?.toInt();
    descriptionEditor = json["descriptionEditor"]?.toString();
    collected = json["collected"];
    reallyCollected = json["reallyCollected"];
    played = json["played"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["dataType"] = dataType;
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["library"] = theLibrary;
    if (tags != null) {
      final v = tags;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["tags"] = arr0;
    }
    if (consumption != null) {
      data["consumption"] = consumption!.toJson();
    }
    data["resourceType"] = resourceType;
    if (provider != null) {
      data["provider"] = provider!.toJson();
    }
    data["category"] = category;
    if (author != null) {
      data["author"] = author!.toJson();
    }
    if (cover != null) {
      data["cover"] = cover!.toJson();
    }
    data["playUrl"] = playUrl;
    data["duration"] = duration;
    if (webUrl != null) {
      data["webUrl"] = webUrl!.toJson();
    }
    data["releaseTime"] = releaseTime;
    if (playInfo != null) {
      final v = playInfo;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["playInfo"] = arr0;
    }
    data["ad"] = ad;
    data["type"] = type;
    data["ifLimitVideo"] = ifLimitVideo;
    data["searchWeight"] = searchWeight;
    data["idx"] = idx;
    data["date"] = date;
    data["descriptionEditor"] = descriptionEditor;
    data["collected"] = collected;
    data["reallyCollected"] = reallyCollected;
    data["played"] = played;
    return data;
  }
}

class PopularCollItemList {
/*
{
  "type": "video",
  "data": {
    "dataType": "VideoBeanForClient",
    "id": 6482,
    "title": "嘿，你的安全套",
    "description": "这是一套神奇的互帮互助系统：当你和她激情燃烧却没有带安全套时，只需通过这套系统发送你的定位，就会有陌生人以最体面的方式为你解决燃眉之急。人们之间的善意以及体贴都通过这套系统体现出来了呢~From LLLLITL",
    "library": "DAILY",
    "tags": [
      {
        "id": 748,
        "name": "这些广告超有梗",
        "actionUrl": "eyepetizer://tag/748/?title=%E8%BF%99%E4%BA%9B%E5%B9%BF%E5%91%8A%E8%B6%85%E6%9C%89%E6%A2%97",
        "bgPicture": "http://img.kaiyanapp.com/9056413cfeffaf0c841d894390aa8e08.jpeg?imageMogr2/quality/60/format/jpg",
        "headerImage": "http://img.kaiyanapp.com/ff0f6d0ad5f4b6211a3f746aaaffd916.jpeg?imageMogr2/quality/60/format/jpg",
        "tagRecType": "IMPORTANT",
        "haveReward": false,
        "ifNewest": false,
        "communityIndex": 0
      }
    ],
    "consumption": {
      "collectionCount": 55332,
      "shareCount": 94636,
      "replyCount": 578,
      "realCollectionCount": 6451
    },
    "resourceType": "video",
    "provider": {
      "name": "YouTube",
      "alias": "youtube",
      "icon": "http://img.kaiyanapp.com/fa20228bc5b921e837156923a58713f6.png"
    },
    "category": "广告",
    "author": {
      "id": 2162,
      "icon": "http://img.kaiyanapp.com/98beab66d3885a139b54f21e91817c4f.jpeg",
      "name": "全球广告精选",
      "description": "我们精选世界最好看的广告，为全世界广告人的精彩创意点赞。",
      "link": "",
      "latestReleaseTime": 1634432418000,
      "videoNum": 1627,
      "follow": {
        "itemType": "author",
        "itemId": 2162,
        "followed": false
      },
      "shield": {
        "itemType": "author",
        "itemId": 2162,
        "shielded": false
      },
      "approvedNotReadyVideoCount": 0,
      "ifPgc": true,
      "recSort": 0,
      "expert": false
    },
    "cover": {
      "feed": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
      "detail": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
      "blurred": "http://img.kaiyanapp.com/d3ad0df9992489946127fe4d3f4dbab9.jpeg?imageMogr2/quality/100"
    },
    "playUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=",
    "duration": 77,
    "webUrl": {
      "raw": "http://www.eyepetizer.net/detail.html?vid=6482",
      "forWeibo": "http://wandou.im/1vcy1m"
    },
    "releaseTime": 1460995200000,
    "playInfo": [
      {
        "height": 480,
        "width": 854,
        "urlList": [
          {
            "name": "aliyun",
            "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=",
            "size": 6300150
          }
        ],
        "name": "标清",
        "type": "normal",
        "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid="
      }
    ],
    "ad": false,
    "type": "NORMAL",
    "ifLimitVideo": false,
    "searchWeight": 0,
    "idx": 0,
    "date": 1460995200000,
    "descriptionEditor": "这是一套神奇的互帮互助系统：当你和她激情燃烧却没有带安全套时，只需通过这套系统发送你的定位，就会有陌生人以最体面的方式为你解决燃眉之急。人们之间的善意以及体贴都通过这套系统体现出来了呢~From LLLLITL",
    "collected": false,
    "reallyCollected": false,
    "played": false
  },
  "id": 0,
  "adIndex": -1
} 
*/

  String? type;
  PopularCollItemListData? data;
  int? id;
  int? adIndex;

  PopularCollItemList({
    this.type,
    this.data,
    this.id,
    this.adIndex,
  });
  PopularCollItemList.fromJson(Map<String, dynamic> json) {
    type = json["type"]?.toString();
    data = (json["data"] != null)
        ? PopularCollItemListData.fromJson(json["data"])
        : null;
    id = json["id"]?.toInt();
    adIndex = json["adIndex"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["type"] = type;
    if (data != null) {
      data["data"] = this.data!.toJson();
    }
    data["id"] = id;
    data["adIndex"] = adIndex;
    return data;
  }
}

class PopularColl {
/*
{
  "itemList": [
    {
      "type": "video",
      "data": {
        "dataType": "VideoBeanForClient",
        "id": 6482,
        "title": "嘿，你的安全套",
        "description": "这是一套神奇的互帮互助系统：当你和她激情燃烧却没有带安全套时，只需通过这套系统发送你的定位，就会有陌生人以最体面的方式为你解决燃眉之急。人们之间的善意以及体贴都通过这套系统体现出来了呢~From LLLLITL",
        "library": "DAILY",
        "tags": [
          {
            "id": 748,
            "name": "这些广告超有梗",
            "actionUrl": "eyepetizer://tag/748/?title=%E8%BF%99%E4%BA%9B%E5%B9%BF%E5%91%8A%E8%B6%85%E6%9C%89%E6%A2%97",
            "bgPicture": "http://img.kaiyanapp.com/9056413cfeffaf0c841d894390aa8e08.jpeg?imageMogr2/quality/60/format/jpg",
            "headerImage": "http://img.kaiyanapp.com/ff0f6d0ad5f4b6211a3f746aaaffd916.jpeg?imageMogr2/quality/60/format/jpg",
            "tagRecType": "IMPORTANT",
            "haveReward": false,
            "ifNewest": false,
            "communityIndex": 0
          }
        ],
        "consumption": {
          "collectionCount": 55332,
          "shareCount": 94636,
          "replyCount": 578,
          "realCollectionCount": 6451
        },
        "resourceType": "video",
        "provider": {
          "name": "YouTube",
          "alias": "youtube",
          "icon": "http://img.kaiyanapp.com/fa20228bc5b921e837156923a58713f6.png"
        },
        "category": "广告",
        "author": {
          "id": 2162,
          "icon": "http://img.kaiyanapp.com/98beab66d3885a139b54f21e91817c4f.jpeg",
          "name": "全球广告精选",
          "description": "我们精选世界最好看的广告，为全世界广告人的精彩创意点赞。",
          "link": "",
          "latestReleaseTime": 1634432418000,
          "videoNum": 1627,
          "follow": {
            "itemType": "author",
            "itemId": 2162,
            "followed": false
          },
          "shield": {
            "itemType": "author",
            "itemId": 2162,
            "shielded": false
          },
          "approvedNotReadyVideoCount": 0,
          "ifPgc": true,
          "recSort": 0,
          "expert": false
        },
        "cover": {
          "feed": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
          "detail": "http://img.kaiyanapp.com/316ab6196630815bb53fd85198227b0e.jpeg?imageMogr2/quality/100",
          "blurred": "http://img.kaiyanapp.com/d3ad0df9992489946127fe4d3f4dbab9.jpeg?imageMogr2/quality/100"
        },
        "playUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=",
        "duration": 77,
        "webUrl": {
          "raw": "http://www.eyepetizer.net/detail.html?vid=6482",
          "forWeibo": "http://wandou.im/1vcy1m"
        },
        "releaseTime": 1460995200000,
        "playInfo": [
          {
            "height": 480,
            "width": 854,
            "urlList": [
              {
                "name": "aliyun",
                "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=",
                "size": 6300150
              }
            ],
            "name": "标清",
            "type": "normal",
            "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=6482&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid="
          }
        ],
        "ad": false,
        "type": "NORMAL",
        "ifLimitVideo": false,
        "searchWeight": 0,
        "idx": 0,
        "date": 1460995200000,
        "descriptionEditor": "这是一套神奇的互帮互助系统：当你和她激情燃烧却没有带安全套时，只需通过这套系统发送你的定位，就会有陌生人以最体面的方式为你解决燃眉之急。人们之间的善意以及体贴都通过这套系统体现出来了呢~From LLLLITL",
        "collected": false,
        "reallyCollected": false,
        "played": false
      },
      "id": 0,
      "adIndex": -1
    }
  ],
  "count": 10,
  "total": 0,
  "adExist": false
} 
*/

  List<PopularCollItemList?>? itemList;
  int? count;
  int? total;
  bool? adExist;
  String? nextPageUrl;

  PopularColl({
    this.itemList,
    this.count,
    this.total,
    this.adExist,
    this.nextPageUrl,
  });
  PopularColl.fromJson(Map<String, dynamic> json) {
    if (json["itemList"] != null) {
      final v = json["itemList"];
      final arr0 = <PopularCollItemList>[];
      v.forEach((v) {
        if (v["type"] == "video") {
          arr0.add(PopularCollItemList.fromJson(v));
        }
      });
      itemList = arr0;
    }
    count = json["count"]?.toInt();
    total = json["total"]?.toInt();
    adExist = json["adExist"];
    nextPageUrl = json["nextPageUrl"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (itemList != null) {
      final v = itemList;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["itemList"] = arr0;
    }
    data["count"] = count;
    data["total"] = total;
    data["adExist"] = adExist;
    return data;
  }
}
