import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//
import 'package:flutter_eyepetizer/router/index.dart';
import 'package:flutter_eyepetizer/utils/config.dart';
import 'package:get/get.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarTabUser extends StatefulWidget {
  AppBarTabUser({Key? key}) : super(key: key);

  @override
  _AppBarTabUserState createState() => _AppBarTabUserState();
}

class _AppBarTabUserState extends State<AppBarTabUser>
    with AutomaticKeepAliveClientMixin {
  List<Map<String, dynamic>> items = [
    {
      "type": "data",
      "name": "本项目GitHub",
      "icon": Icons.public,
      "icoColor": Colors.red[800],
      "cb": () async {
        if (await canLaunch(myGithub)) {
          await launch(myGithub);
        }
      },
    },
    {
      "type": "divider",
    },
    {
      "type": "data",
      "name": "历史记录",
      "icon": Icons.history,
      "icoColor": Colors.amber[800],
      "cb": () {
        Get.toNamed(PageName.VIDEO_HISTORY);
      },
    },
    {
      "type": "divider",
    },
    {
      "type": "data",
      "name": "分享APP",
      "icon": Icons.share,
      "icoColor": Colors.green[800],
      "cb": () {
        ShareExtend.share(AppName, "text");
      },
    },
    {
      "type": "divider",
    },
    {
      "type": "data",
      "name": "免责申明",
      "icon": Icons.feedback,
      "icoColor": Colors.blue[800],
      "cb": () {
        Get.toNamed(PageName.USER_DECLARE);
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("我的"),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CartStatic(
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.black12,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Image.asset("images/user-logo.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        "开不开眼？",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CartStatic(
              Column(
                children: items.map((e) {
                  if (e["type"]! == "data") {
                    return MenuRow(
                      cb: e["cb"]!,
                      icoColor: e["icoColor"]!,
                      name: e["name"]!,
                      icon: e["icon"]!,
                    );
                  }
                  return Divider(height: 1);
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CartStatic extends StatelessWidget {
  Widget child;
  CartStatic(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // border: Border(bottom: BorderSide(color: Colors.black12)),
          borderRadius: BorderRadius.circular(8),
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
          padding: EdgeInsets.all(10),
          child: child,
        ),
      ),
    );
  }
}

class MenuRow extends StatelessWidget {
  final Function cb;
  final String name;
  final Color icoColor;
  final IconData icon;
  MenuRow({
    Key? key,
    required this.cb,
    required this.icon,
    required this.name,
    required this.icoColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          cb();
        },
        child: Container(
          height: 54,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: icoColor,
                  size: 28,
                ),
                SizedBox(width: 15),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
