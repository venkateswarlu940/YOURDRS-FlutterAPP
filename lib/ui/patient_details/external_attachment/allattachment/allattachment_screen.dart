import 'package:YOURDRS_FlutterAPP/data/models/extrenal_databse_model.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'attachment_details/details_page.dart';

/// Here some set of images can be appeared
class Allattachment extends StatefulWidget {
  @override
  _AllattachmentState createState() => _AllattachmentState();
}

class _AllattachmentState extends State<Allattachment> {
  List<ExternalAttachment> attachments = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
        future: DatabaseHelper.db.getAllExtrenalAttachmentList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.hasData);
          if (!snapshot.hasData) {
            return Center(
              //child: CircularProgressIndicator(),
            );
          } else {
            // print('FutureBuilder '+snapshot.data.toList().toString());
            attachments = snapshot.data as List<ExternalAttachment>;
            return ListView.builder(
                itemCount: attachments.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DataPart(
                                  displayfilename:
                                      attachments[index].displayfilename,
                                  practicename: attachments[index].practicename,
                                  locationname: attachments[index].locationname,
                                  externaldocumenttype:
                                      attachments[index].externaldocumenttype,
                                  providername: attachments[index].providername,
                                  patientfirstname:
                                      attachments[index].patientfirstname,
                                  patientdob: attachments[index].patientdob,
                                  isemergencyaddon:
                                      attachments[index].isemergencyaddon,
                                  description: attachments[index].description,
                                )),
                      );
                    },
                    child: Container(
                      child: Card(
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(padding: new EdgeInsets.all(3.0)),
                              Text(
                                "${attachments[index].displayfilename}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.cloud_upload_rounded, size: 40),
                            onPressed: () {
                              //
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
        });
  }
}
