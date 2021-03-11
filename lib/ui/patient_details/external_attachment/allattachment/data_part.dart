import 'package:flutter/material.dart';
class DataPart extends StatefulWidget {
  var filename;

  DataPart({ this.filename}) ;
  @override
  _DataPartState createState() => _DataPartState();
}

class _DataPartState extends State<DataPart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.filename),
        centerTitle: true,
      ),
    );
  }
}
