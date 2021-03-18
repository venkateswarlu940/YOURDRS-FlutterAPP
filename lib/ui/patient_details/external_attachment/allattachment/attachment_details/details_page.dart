import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/data/models/extrenal_databse_model.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:flutter/material.dart';

import 'custome_component.dart';
class DataPart extends StatefulWidget {
  var displayfilename;
  var practicename;
  var locationname;
  var externaldocumenttype;
  var providername;
  var patientfirstname;
  var patientdob;
  var isemergencyaddon;
  var description;
  var attachmenttype;
  DataPart({ this.displayfilename,this.practicename,this.locationname,this.externaldocumenttype,this.providername,this.patientfirstname,this.patientdob,this.isemergencyaddon,this.description,this.attachmenttype}) ;
  @override
  _DataPartState createState() => _DataPartState();
}

class _DataPartState extends State<DataPart> {
  List<ExternalAttachment>attachments =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomizedColors.AppBarColor,
        toolbarHeight: 70,
        title: Text(widget.displayfilename),
        centerTitle: true,
      ),
      body:ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Case Detail',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),),
              ),
              CustomTile(text1: "Practice",text2: widget.practicename),
              Divider(color: Colors.blue,height: 0,),
              CustomTile(text1: "Location",text2: widget.locationname),
              Divider(color: Colors.blue,height: 0,),
              CustomTile(text1: "Doc Type",text2:widget.externaldocumenttype),
              Divider(color: Colors.blue,height: 0,),
              CustomTile(text1: "Provider",text2: widget.providername),
              Divider(color: Colors.blue,height: 0,thickness: 0.60,),
              CustomTile(text1: "Name",text2: widget.patientfirstname),
              Divider(color: Colors.blue,height: 0,thickness: 0.60,),
              CustomTile(text1: "DOB",text2:widget.patientdob),
              Divider(color: Colors.blue,height: 0,),
              CustomTile(text1: "Is emergency add on description",text2:widget.isemergencyaddon.toString()),
              Divider(color: Colors.blue,height: 0,),
              CustomTile(text1: "Description",text2: widget.description),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Uploaded Attachments',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),),
              ),
              Card(
                child: ListTile(
                  //leading: Text('djskdjhsjhjhsd.jpg'),
                  trailing: Container(
                    child: InkWell(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => Dialog(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.7,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: ExactAssetImage(
                                          widget.attachmenttype),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        );
                      },
                      child: Icon(Icons.remove_red_eye),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

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
               // }
            );
          //}
    //   ),
    // );
  }
}
