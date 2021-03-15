import 'package:YOURDRS_FlutterAPP/data/models/extrenal_databse_model.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:flutter/material.dart';
class DataPart extends StatefulWidget {
  var displayfilename;

  DataPart({ this.displayfilename}) ;
  @override
  _DataPartState createState() => _DataPartState();
}

class _DataPartState extends State<DataPart> {
  List<ExternalAttachment>attachments =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(widget.displayfilename),
        centerTitle: true,
      ),
       body: FutureBuilder(
            future: DatabaseHelper.db.getAllExtrenalAttachmentList(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              print(snapshot.hasData);
              // if(!snapshot.hasData){
              //   return Center(
              //     // child: CircularProgressIndicator(),
              //   );
              // }
              //else {
                // print('FutureBuilder '+snapshot.data.toList().toString());
                attachments = snapshot.data as List<ExternalAttachment>;
                return ListView.builder(
                    itemCount: attachments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: Card(
                            child:
                            ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(padding: new EdgeInsets.all(3.0)),
                                  Text(
                                    "Practice",
                                   // "Location",
                                  ),
                                ],
                              ),
                              title:  Text(
                                "${attachments[index].practicename}",
                                //"${attachments[index].locationname}",
                              ),
                            ),
                          ),
                        );
                    }
                );
              }
        ),
    );
  }
}
