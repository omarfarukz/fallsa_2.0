
import 'package:flutter/cupertino.dart';

class DialogText extends StatelessWidget {
  // const DialogText({Key? key}) : super(key: key);
  final text;
  DialogText(this.text);



  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,);
  }
}
