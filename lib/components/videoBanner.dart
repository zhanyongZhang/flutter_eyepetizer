import 'package:flutter/material.dart';

class VideoBanner extends StatelessWidget {
  final String avatarUrl;
  final String rowTitle;
  final String rowDes;
  final Widget slotChild;
  final bool isAssets;
  VideoBanner({
    Key? key,
    required this.avatarUrl,
    required this.rowTitle,
    required this.rowDes,
    required this.slotChild,
    this.isAssets = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: ClipOval(
                child: FadeInImage(
                  placeholder: AssetImage('images/movie-lazy.gif'),
                  image: isAssets
                      ? AssetImage('images/author-default.jpg')
                      : NetworkImage(avatarUrl) as ImageProvider,
                  imageErrorBuilder: (context, obj, trace) {
                    return Container(
                      child: Image.asset('images/author-default.jpg'),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    rowTitle,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    rowDes,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black54,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: slotChild,
          ),
        ],
      ),
    );
  }
}
