import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/ui/patient_details/external_attachment/submit_new_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'allattachment_screen.dart';
///-----------------------This is ExternalAttachment home page
class ExternalAttachment extends StatefulWidget {
  @override
  _ExternalAttachmentStat createState() => _ExternalAttachmentStat();
}

class _ExternalAttachmentStat extends State<ExternalAttachment > {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
      child:Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: CustomizedColors.appbarColor,
          title: Text(AppStrings.externalattachment),
          actions: [
            IconButton(
                icon: Icon(Icons.cloud_upload_outlined,size: 35) ,
                onPressed:(){
                  //
                }
            ),
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 65,
                child: Container(
                  //elevation: 5,
                  //color: CustomizedColors.tabColor,
                  child: TabBar(
                    tabs: [
                      Tab(
                          child: Text(
                            AppStrings.submitnew,//here we called the text for SubmitNew
                            style: TextStyle(
                              fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: CustomizedColors.submitnew_textColor,
                            ),
                          )),
                      Tab(
                          child: Text(
                            AppStrings.allattachment,//here we called the text for AllAttachment
                            style: TextStyle(
                              fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: CustomizedColors.allattachment_textColor,
                                ),
                          ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [new BoxShadow(
                        color: Colors.white,

                      ),]
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // BlocProvider(
                    //     create:(BuildContext,context)
                    // ),
                    SubmitNew(),//This for SubmitNew class where we write the data
                    Allattachment(),//This for AllAttachment class where we write the data
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}