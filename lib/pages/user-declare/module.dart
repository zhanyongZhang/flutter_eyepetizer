import 'package:flutter/material.dart';

class UserDeclare extends StatelessWidget {
  const UserDeclare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('免责申明'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 0),
            child: Text(
              '1：本软件是第三方自定义搜索工具，仅供学习参考。本软件不存储视频，请在下载后24小时内删除。',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 0),
            child: Text(
              '2：软件以非人工的方式索引内容，任何通过软件搜索链接到第三方网页均系他人制作或提供，您可以从第三方网页上获得相关服务，我们对于您搜索到的网页及其内容不承担任何法律责任。',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 0),
            child: Text(
              '3：本软件所有可搜索到的内容均来自各网站提供的公开引用资源，所有图片及视频版权归原作者及网站所有，本软件不存储、不制作、不上传。',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 0),
            child: Text(
              '4：任何单位或个人通过搜索链接到的第三方网页内容可能涉嫌侵权，请向本APP发送邮件告知，在收到邮件后将会尽快断开相关搜索链接内容。',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
