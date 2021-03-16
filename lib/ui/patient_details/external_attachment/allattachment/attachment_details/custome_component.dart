import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget{
  var text1;
  var text2;
  CustomTile({this.text1,this.text2});
  @override
  Widget build(BuildContext context) {
// TODO: implement build
// throw UnimplementedError();
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.teal[50],
            width: 120,
            height: 60,
            child: Center(child: Text(text1,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(text2),
//Text('Test Video', style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
        ],
      ),
    );
  }

}