///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class TypeInfoItemListDataPlayInfoUrlList {
/*
{
  "name": "aliyun",
  "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
  "size": 54736512
} 
*/

  String? name;
  String? url;
  int? size;

  TypeInfoItemListDataPlayInfoUrlList({
    this.name,
    this.url,
    this.size,
  });
  TypeInfoItemListDataPlayInfoUrlList.fromJson(Map<String, dynamic> json) {
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

class TypeInfoItemListDataPlayInfo {
/*
{
  "height": 480,
  "width": 854,
  "urlList": [
    {
      "name": "aliyun",
      "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
      "size": 54736512
    }
  ],
  "name": "标清",
  "type": "normal",
  "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04"
} 
*/

  int? height;
  int? width;
  List<TypeInfoItemListDataPlayInfoUrlList?>? urlList;
  String? name;
  String? type;
  String? url;

  TypeInfoItemListDataPlayInfo({
    this.height,
    this.width,
    this.urlList,
    this.name,
    this.type,
    this.url,
  });
  TypeInfoItemListDataPlayInfo.fromJson(Map<String, dynamic> json) {
    height = json["height"]?.toInt();
    width = json["width"]?.toInt();
    if (json["urlList"] != null) {
      final v = json["urlList"];
      final arr0 = <TypeInfoItemListDataPlayInfoUrlList>[];
      v.forEach((v) {
        arr0.add(TypeInfoItemListDataPlayInfoUrlList.fromJson(v));
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

class TypeInfoItemListDataWebUrl {
/*
{
  "raw": "http://www.eyepetizer.net/detail.html?vid=281527",
  "forWeibo": "https://m.eyepetizer.net/u1/video-detail?video_id=281527&resource_type=video&utm_campaign=routine&utm_medium=share&utm_source=weibo&uid=0"
} 
*/

  String? raw;
  String? forWeibo;

  TypeInfoItemListDataWebUrl({
    this.raw,
    this.forWeibo,
  });
  TypeInfoItemListDataWebUrl.fromJson(Map<String, dynamic> json) {
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

class TypeInfoItemListDataCover {
/*
{
  "feed": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
  "detail": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
  "blurred": "http://img.kaiyanapp.com/6177d0d6941254a394701b7a229207e3.jpeg?imageMogr2/quality/60/format/jpg"
} 
*/

  String? feed;
  String? detail;
  String? blurred;

  TypeInfoItemListDataCover({
    this.feed,
    this.detail,
    this.blurred,
  });
  TypeInfoItemListDataCover.fromJson(Map<String, dynamic> json) {
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

class TypeInfoItemListDataAuthorShield {
/*
{
  "itemType": "author",
  "itemId": 2708,
  "shielded": false
} 
*/

  String? itemType;
  int? itemId;
  bool? shielded;

  TypeInfoItemListDataAuthorShield({
    this.itemType,
    this.itemId,
    this.shielded,
  });
  TypeInfoItemListDataAuthorShield.fromJson(Map<String, dynamic> json) {
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

class TypeInfoItemListDataAuthorFollow {
/*
{
  "itemType": "author",
  "itemId": 2708,
  "followed": false
} 
*/

  String? itemType;
  int? itemId;
  bool? followed;

  TypeInfoItemListDataAuthorFollow({
    this.itemType,
    this.itemId,
    this.followed,
  });
  TypeInfoItemListDataAuthorFollow.fromJson(Map<String, dynamic> json) {
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

class TypeInfoItemListDataAuthor {
/*
{
  "id": 2708,
  "icon": "http://img.kaiyanapp.com/8a8c70fa2a97408c7ba452f81a4b3eaa.jpeg?imageMogr2/quality/60/format/jpg",
  "name": "Vox",
  "description": "Vox 帮你排除其他的声音，更好的理解国际大事和民生新闻，从国家大事到国际动荡再到娱乐八卦！",
  "link": "",
  "latestReleaseTime": 1634178859000,
  "videoNum": 39,
  "follow": {
    "itemType": "author",
    "itemId": 2708,
    "followed": false
  },
  "shield": {
    "itemType": "author",
    "itemId": 2708,
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
  TypeInfoItemListDataAuthorFollow? follow;
  TypeInfoItemListDataAuthorShield? shield;
  int? approvedNotReadyVideoCount;
  bool? ifPgc;
  int? recSort;
  bool? expert;

  TypeInfoItemListDataAuthor({
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
  TypeInfoItemListDataAuthor.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    icon = json["icon"]?.toString();
    name = json["name"]?.toString();
    description = json["description"]?.toString();
    link = json["link"]?.toString();
    latestReleaseTime = json["latestReleaseTime"]?.toInt();
    videoNum = json["videoNum"]?.toInt();
    follow = (json["follow"] != null)
        ? TypeInfoItemListDataAuthorFollow.fromJson(json["follow"])
        : null;
    shield = (json["shield"] != null)
        ? TypeInfoItemListDataAuthorShield.fromJson(json["shield"])
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

class TypeInfoItemListDataProvider {
/*
{
  "name": "定制来源",
  "alias": "CustomSrc",
  "icon": ""
} 
*/

  String? name;
  String? alias;
  String? icon;

  TypeInfoItemListDataProvider({
    this.name,
    this.alias,
    this.icon,
  });
  TypeInfoItemListDataProvider.fromJson(Map<String, dynamic> json) {
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

class TypeInfoItemListDataConsumption {
/*
{
  "collectionCount": 0,
  "shareCount": 7,
  "replyCount": 0,
  "realCollectionCount": 0
} 
*/

  int? collectionCount;
  int? shareCount;
  int? replyCount;
  int? realCollectionCount;

  TypeInfoItemListDataConsumption({
    this.collectionCount,
    this.shareCount,
    this.replyCount,
    this.realCollectionCount,
  });
  TypeInfoItemListDataConsumption.fromJson(Map<String, dynamic> json) {
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

class TypeInfoItemListDataTags {
/*
{
  "id": 44,
  "name": "5 分钟新知",
  "actionUrl": "eyepetizer://tag/44/?title=5%20%E5%88%86%E9%92%9F%E6%96%B0%E7%9F%A5",
  "desc": "大千世界，总有你不知道的",
  "bgPicture": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
  "headerImage": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
  "tagRecType": "IMPORTANT",
  "haveReward": false,
  "ifNewest": false,
  "communityIndex": 0
} 
*/

  int? id;
  String? name;
  String? actionUrl;
  String? desc;
  String? bgPicture;
  String? headerImage;
  String? tagRecType;
  bool? haveReward;
  bool? ifNewest;
  int? communityIndex;

  TypeInfoItemListDataTags({
    this.id,
    this.name,
    this.actionUrl,
    this.desc,
    this.bgPicture,
    this.headerImage,
    this.tagRecType,
    this.haveReward,
    this.ifNewest,
    this.communityIndex,
  });
  TypeInfoItemListDataTags.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    actionUrl = json["actionUrl"]?.toString();
    desc = json["desc"]?.toString();
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
    data["desc"] = desc;
    data["bgPicture"] = bgPicture;
    data["headerImage"] = headerImage;
    data["tagRecType"] = tagRecType;
    data["haveReward"] = haveReward;
    data["ifNewest"] = ifNewest;
    data["communityIndex"] = communityIndex;
    return data;
  }
}

class TypeInfoItemListData {
/*
{
  "dataType": "VideoBeanForClient",
  "id": 281527,
  "title": "特朗普统治下的奥巴马医改",
  "description": "我们前往肯塔基州惠特利县，了解为什么从奥巴马医改中获益最多的人会投票给唐纳德·特朗普。一些人认为特朗普实际上不会废除奥巴马医改。其他人认为奥巴马医改负担不起。",
  "library": "NOT_RECOMMEND",
  "tags": [
    {
      "id": 44,
      "name": "5 分钟新知",
      "actionUrl": "eyepetizer://tag/44/?title=5%20%E5%88%86%E9%92%9F%E6%96%B0%E7%9F%A5",
      "desc": "大千世界，总有你不知道的",
      "bgPicture": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
      "headerImage": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
      "tagRecType": "IMPORTANT",
      "haveReward": false,
      "ifNewest": false,
      "communityIndex": 0
    }
  ],
  "consumption": {
    "collectionCount": 0,
    "shareCount": 7,
    "replyCount": 0,
    "realCollectionCount": 0
  },
  "resourceType": "video",
  "provider": {
    "name": "定制来源",
    "alias": "CustomSrc",
    "icon": ""
  },
  "category": "生活",
  "author": {
    "id": 2708,
    "icon": "http://img.kaiyanapp.com/8a8c70fa2a97408c7ba452f81a4b3eaa.jpeg?imageMogr2/quality/60/format/jpg",
    "name": "Vox",
    "description": "Vox 帮你排除其他的声音，更好的理解国际大事和民生新闻，从国家大事到国际动荡再到娱乐八卦！",
    "link": "",
    "latestReleaseTime": 1634178859000,
    "videoNum": 39,
    "follow": {
      "itemType": "author",
      "itemId": 2708,
      "followed": false
    },
    "shield": {
      "itemType": "author",
      "itemId": 2708,
      "shielded": false
    },
    "approvedNotReadyVideoCount": 0,
    "ifPgc": true,
    "recSort": 0,
    "expert": false
  },
  "cover": {
    "feed": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
    "detail": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
    "blurred": "http://img.kaiyanapp.com/6177d0d6941254a394701b7a229207e3.jpeg?imageMogr2/quality/60/format/jpg"
  },
  "playUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
  "duration": 620,
  "webUrl": {
    "raw": "http://www.eyepetizer.net/detail.html?vid=281527",
    "forWeibo": "https://m.eyepetizer.net/u1/video-detail?video_id=281527&resource_type=video&utm_campaign=routine&utm_medium=share&utm_source=weibo&uid=0"
  },
  "releaseTime": 1634011499000,
  "playInfo": [
    {
      "height": 480,
      "width": 854,
      "urlList": [
        {
          "name": "aliyun",
          "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
          "size": 54736512
        }
      ],
      "name": "标清",
      "type": "normal",
      "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04"
    }
  ],
  "ad": false,
  "type": "NORMAL",
  "titlePgc": "特朗普统治下的奥巴马医改",
  "descriptionPgc": "我们前往肯塔基州惠特利县，了解为什么从奥巴马医改中获益最多的人会投票给唐纳德·特朗普。一些人认为特朗普实际上不会废除奥巴马医改。其他人认为奥巴马医改负担不起。",
  "ifLimitVideo": false,
  "searchWeight": 0,
  "idx": 0,
  "date": 1634011499000,
  "descriptionEditor": "",
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
  List<TypeInfoItemListDataTags?>? tags;
  TypeInfoItemListDataConsumption? consumption;
  String? resourceType;
  TypeInfoItemListDataProvider? provider;
  String? category;
  TypeInfoItemListDataAuthor? author;
  TypeInfoItemListDataCover? cover;
  String? playUrl;
  int? duration;
  TypeInfoItemListDataWebUrl? webUrl;
  int? releaseTime;
  List<TypeInfoItemListDataPlayInfo?>? playInfo;
  bool? ad;
  String? type;
  String? titlePgc;
  String? descriptionPgc;
  bool? ifLimitVideo;
  int? searchWeight;
  int? idx;
  int? date;
  String? descriptionEditor;
  bool? collected;
  bool? reallyCollected;
  bool? played;

  TypeInfoItemListData({
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
    this.titlePgc,
    this.descriptionPgc,
    this.ifLimitVideo,
    this.searchWeight,
    this.idx,
    this.date,
    this.descriptionEditor,
    this.collected,
    this.reallyCollected,
    this.played,
  });
  TypeInfoItemListData.fromJson(Map<String, dynamic> json) {
    dataType = json["dataType"]?.toString();
    id = json["id"]?.toInt();
    title = json["title"]?.toString();
    description = json["description"]?.toString();
    theLibrary = json["library"]?.toString();
    if (json["tags"] != null) {
      final v = json["tags"];
      final arr0 = <TypeInfoItemListDataTags>[];
      v.forEach((v) {
        arr0.add(TypeInfoItemListDataTags.fromJson(v));
      });
      tags = arr0;
    }
    consumption = (json["consumption"] != null)
        ? TypeInfoItemListDataConsumption.fromJson(json["consumption"])
        : null;
    resourceType = json["resourceType"]?.toString();
    provider = (json["provider"] != null)
        ? TypeInfoItemListDataProvider.fromJson(json["provider"])
        : null;
    category = json["category"]?.toString();
    author = (json["author"] != null)
        ? TypeInfoItemListDataAuthor.fromJson(json["author"])
        : null;
    cover = (json["cover"] != null)
        ? TypeInfoItemListDataCover.fromJson(json["cover"])
        : null;
    playUrl = json["playUrl"]?.toString();
    duration = json["duration"]?.toInt();
    webUrl = (json["webUrl"] != null)
        ? TypeInfoItemListDataWebUrl.fromJson(json["webUrl"])
        : null;
    releaseTime = json["releaseTime"]?.toInt();
    if (json["playInfo"] != null) {
      final v = json["playInfo"];
      final arr0 = <TypeInfoItemListDataPlayInfo>[];
      v.forEach((v) {
        arr0.add(TypeInfoItemListDataPlayInfo.fromJson(v));
      });
      playInfo = arr0;
    }
    ad = json["ad"];
    type = json["type"]?.toString();
    titlePgc = json["titlePgc"]?.toString();
    descriptionPgc = json["descriptionPgc"]?.toString();
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
    data["titlePgc"] = titlePgc;
    data["descriptionPgc"] = descriptionPgc;
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

class TypeInfoItemList {
/*
{
  "type": "video",
  "data": {
    "dataType": "VideoBeanForClient",
    "id": 281527,
    "title": "特朗普统治下的奥巴马医改",
    "description": "我们前往肯塔基州惠特利县，了解为什么从奥巴马医改中获益最多的人会投票给唐纳德·特朗普。一些人认为特朗普实际上不会废除奥巴马医改。其他人认为奥巴马医改负担不起。",
    "library": "NOT_RECOMMEND",
    "tags": [
      {
        "id": 44,
        "name": "5 分钟新知",
        "actionUrl": "eyepetizer://tag/44/?title=5%20%E5%88%86%E9%92%9F%E6%96%B0%E7%9F%A5",
        "desc": "大千世界，总有你不知道的",
        "bgPicture": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
        "headerImage": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
        "tagRecType": "IMPORTANT",
        "haveReward": false,
        "ifNewest": false,
        "communityIndex": 0
      }
    ],
    "consumption": {
      "collectionCount": 0,
      "shareCount": 7,
      "replyCount": 0,
      "realCollectionCount": 0
    },
    "resourceType": "video",
    "provider": {
      "name": "定制来源",
      "alias": "CustomSrc",
      "icon": ""
    },
    "category": "生活",
    "author": {
      "id": 2708,
      "icon": "http://img.kaiyanapp.com/8a8c70fa2a97408c7ba452f81a4b3eaa.jpeg?imageMogr2/quality/60/format/jpg",
      "name": "Vox",
      "description": "Vox 帮你排除其他的声音，更好的理解国际大事和民生新闻，从国家大事到国际动荡再到娱乐八卦！",
      "link": "",
      "latestReleaseTime": 1634178859000,
      "videoNum": 39,
      "follow": {
        "itemType": "author",
        "itemId": 2708,
        "followed": false
      },
      "shield": {
        "itemType": "author",
        "itemId": 2708,
        "shielded": false
      },
      "approvedNotReadyVideoCount": 0,
      "ifPgc": true,
      "recSort": 0,
      "expert": false
    },
    "cover": {
      "feed": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
      "detail": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
      "blurred": "http://img.kaiyanapp.com/6177d0d6941254a394701b7a229207e3.jpeg?imageMogr2/quality/60/format/jpg"
    },
    "playUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
    "duration": 620,
    "webUrl": {
      "raw": "http://www.eyepetizer.net/detail.html?vid=281527",
      "forWeibo": "https://m.eyepetizer.net/u1/video-detail?video_id=281527&resource_type=video&utm_campaign=routine&utm_medium=share&utm_source=weibo&uid=0"
    },
    "releaseTime": 1634011499000,
    "playInfo": [
      {
        "height": 480,
        "width": 854,
        "urlList": [
          {
            "name": "aliyun",
            "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
            "size": 54736512
          }
        ],
        "name": "标清",
        "type": "normal",
        "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04"
      }
    ],
    "ad": false,
    "type": "NORMAL",
    "titlePgc": "特朗普统治下的奥巴马医改",
    "descriptionPgc": "我们前往肯塔基州惠特利县，了解为什么从奥巴马医改中获益最多的人会投票给唐纳德·特朗普。一些人认为特朗普实际上不会废除奥巴马医改。其他人认为奥巴马医改负担不起。",
    "ifLimitVideo": false,
    "searchWeight": 0,
    "idx": 0,
    "date": 1634011499000,
    "descriptionEditor": "",
    "collected": false,
    "reallyCollected": false,
    "played": false
  },
  "id": 0,
  "adIndex": -1
} 
*/

  String? type;
  TypeInfoItemListData? data;
  int? id;
  int? adIndex;

  TypeInfoItemList({
    this.type,
    this.data,
    this.id,
    this.adIndex,
  });
  TypeInfoItemList.fromJson(Map<String, dynamic> json) {
    type = json["type"]?.toString();
    data = (json["data"] != null)
        ? TypeInfoItemListData.fromJson(json["data"])
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

class TypeInfo {
/*
{
  "itemList": [
    {
      "type": "video",
      "data": {
        "dataType": "VideoBeanForClient",
        "id": 281527,
        "title": "特朗普统治下的奥巴马医改",
        "description": "我们前往肯塔基州惠特利县，了解为什么从奥巴马医改中获益最多的人会投票给唐纳德·特朗普。一些人认为特朗普实际上不会废除奥巴马医改。其他人认为奥巴马医改负担不起。",
        "library": "NOT_RECOMMEND",
        "tags": [
          {
            "id": 44,
            "name": "5 分钟新知",
            "actionUrl": "eyepetizer://tag/44/?title=5%20%E5%88%86%E9%92%9F%E6%96%B0%E7%9F%A5",
            "desc": "大千世界，总有你不知道的",
            "bgPicture": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
            "headerImage": "http://img.kaiyanapp.com/f2e7359e81e217782f32cc3d482b3284.jpeg?imageMogr2/quality/60/format/jpg",
            "tagRecType": "IMPORTANT",
            "haveReward": false,
            "ifNewest": false,
            "communityIndex": 0
          }
        ],
        "consumption": {
          "collectionCount": 0,
          "shareCount": 7,
          "replyCount": 0,
          "realCollectionCount": 0
        },
        "resourceType": "video",
        "provider": {
          "name": "定制来源",
          "alias": "CustomSrc",
          "icon": ""
        },
        "category": "生活",
        "author": {
          "id": 2708,
          "icon": "http://img.kaiyanapp.com/8a8c70fa2a97408c7ba452f81a4b3eaa.jpeg?imageMogr2/quality/60/format/jpg",
          "name": "Vox",
          "description": "Vox 帮你排除其他的声音，更好的理解国际大事和民生新闻，从国家大事到国际动荡再到娱乐八卦！",
          "link": "",
          "latestReleaseTime": 1634178859000,
          "videoNum": 39,
          "follow": {
            "itemType": "author",
            "itemId": 2708,
            "followed": false
          },
          "shield": {
            "itemType": "author",
            "itemId": 2708,
            "shielded": false
          },
          "approvedNotReadyVideoCount": 0,
          "ifPgc": true,
          "recSort": 0,
          "expert": false
        },
        "cover": {
          "feed": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
          "detail": "http://img.kaiyanapp.com/d4ab27ccdb710cdff796d9e0f12de54b.jpeg?imageMogr2/quality/60/format/jpg",
          "blurred": "http://img.kaiyanapp.com/6177d0d6941254a394701b7a229207e3.jpeg?imageMogr2/quality/60/format/jpg"
        },
        "playUrl": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
        "duration": 620,
        "webUrl": {
          "raw": "http://www.eyepetizer.net/detail.html?vid=281527",
          "forWeibo": "https://m.eyepetizer.net/u1/video-detail?video_id=281527&resource_type=video&utm_campaign=routine&utm_medium=share&utm_source=weibo&uid=0"
        },
        "releaseTime": 1634011499000,
        "playInfo": [
          {
            "height": 480,
            "width": 854,
            "urlList": [
              {
                "name": "aliyun",
                "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04",
                "size": 54736512
              }
            ],
            "name": "标清",
            "type": "normal",
            "url": "http://baobab.kaiyanapp.com/api/v1/playUrl?vid=281527&resourceType=video&editionType=normal&source=aliyun&playUrlType=url_oss&udid=3e7ee30c6fc0004a773dc33b0597b5732b145c04"
          }
        ],
        "ad": false,
        "type": "NORMAL",
        "titlePgc": "特朗普统治下的奥巴马医改",
        "descriptionPgc": "我们前往肯塔基州惠特利县，了解为什么从奥巴马医改中获益最多的人会投票给唐纳德·特朗普。一些人认为特朗普实际上不会废除奥巴马医改。其他人认为奥巴马医改负担不起。",
        "ifLimitVideo": false,
        "searchWeight": 0,
        "idx": 0,
        "date": 1634011499000,
        "descriptionEditor": "",
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
  "nextPageUrl": "https://baobab.kaiyanapp.com/api/v4/categories/videoList?start=20&num=10&strategy=date&id=36",
  "adExist": false
} 
*/

  List<TypeInfoItemList?>? itemList;
  int? count;
  int? total;
  String? nextPageUrl;
  bool? adExist;

  TypeInfo({
    this.itemList,
    this.count,
    this.total,
    this.nextPageUrl,
    this.adExist,
  });
  TypeInfo.fromJson(Map<String, dynamic> json) {
    if (json["itemList"] != null) {
      final v = json["itemList"];
      final arr0 = <TypeInfoItemList>[];
      v.forEach((v) {
        if (v["type"] == "video") {
          arr0.add(TypeInfoItemList.fromJson(v));
        }
      });
      itemList = arr0;
    }
    count = json["count"]?.toInt();
    total = json["total"]?.toInt();
    nextPageUrl = json["nextPageUrl"]?.toString();
    adExist = json["adExist"];
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
    data["nextPageUrl"] = nextPageUrl;
    data["adExist"] = adExist;
    return data;
  }
}
