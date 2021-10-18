import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  final String? message;
  const MyLoading({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 8),
          Text(
            message ?? "加载中",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
