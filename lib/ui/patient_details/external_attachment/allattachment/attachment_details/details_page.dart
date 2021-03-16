import 'package:YOURDRS_FlutterAPP/data/models/extrenal_databse_model.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:flutter/material.dart';

import 'custome_component.dart';
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
            attachments = snapshot.data as List<ExternalAttachment>;
            print("Attachments"+attachments.toString());
            return ListView.builder(
                itemCount: attachments.length,
                itemBuilder: (BuildContext context, int index) {
                  return

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Case Detail',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),),
                        ),
                        CustomTile(text1: "Practice",text2: "${attachments[index].practicename}",),
                        Divider(color: Colors.black,height: 0,),
                        CustomTile(text1: "Location",text2: "${attachments[index].locationname}",),
                        Divider(color: Colors.black,height: 0,),
                        CustomTile(text1: "Doc Type",text2:"${attachments[index].externaldocumenttype}",),
                        Divider(color: Colors.black,height: 0,),
                        CustomTile(text1: "Provider",text2: "${attachments[index].providername}",),
                        Divider(color: Colors.black,height: 0,),
                        CustomTile(text1: "Name",text2: "${attachments[index].practicename}",),
                        Divider(color: Colors.black,height: 0,),
                        CustomTile(text1: "DOB",text2:"${attachments[index].patientdob}",),
                        Divider(color: Colors.black,height: 0,),
                        CustomTile(text1: "Is emergency \n add on \ndescription",text2:"${attachments[index].isemergencyaddon}",),
                        Divider(color: Colors.black,height: 0,),
                        CustomTile(text1: "Description",text2: "${attachments[index].description}"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Uploaded Attachments',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),),
                        ),
                        Card(child: ListTile(leading: Text('djskdjhsjhjhsd.jpg'),trailing: Icon(Icons.remove_red_eye),))
                      ],);
                  // Card(
                  //   child:
                  //   ListTile(
                  //     leading: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Padding(padding: new EdgeInsets.all(3.0)),
                  //         Text(
                  //           "Practice",
                  //          // "Location",
                  //         ),
                  //       ],
                  //     ),
                  //     title:  Text(
                  //       "${attachments[index].practicename}",
                  //     ),
                  //   ),
                  // ),
                }
            );
          }
      ),
    );
  }
}
