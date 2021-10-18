import 'package:flutter/material.dart';

typedef ButtonCb = void Function();

class MyButton extends StatelessWidget {
  final String? title;
  final ButtonCb? cb;
  final Color? color;
  const MyButton({
    Key? key,
    required this.title,
    required this.cb,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: cb!,
      child: Text(
        title!,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final Icon icon;
  final ButtonCb? cb;
  const MyIconButton({Key? key, required this.icon, required this.cb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: cb!,
      child: icon,
    );
  }
}
