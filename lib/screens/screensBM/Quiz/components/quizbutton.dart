import 'package:flutter/material.dart';

class QuizButtton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  const QuizButtton({
    required this.text,
    required this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: function,
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(450, 15),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              primary: Colors.green[400],
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
