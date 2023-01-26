import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  // const dialogButton({Key? key}) : super(key: key);
  final text;
  DialogButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,backgroundColor: Colors.green[300]),),
    );
  }
}
