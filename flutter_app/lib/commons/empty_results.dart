import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyResult extends StatelessWidget {
  final String message;

  const EmptyResult({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightGreen,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
