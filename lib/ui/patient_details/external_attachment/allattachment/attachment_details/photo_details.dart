// import 'package:YOURDRS_FlutterAPP/data/models/photo_list.dart';
// import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
// import 'package:flutter/material.dart';
//
// import 'details_page.dart';
// class photo_details extends StatefulWidget {
//   @override
//   _photo_detailsState createState() => _photo_detailsState();
// }
//
// class _photo_detailsState extends State<photo_details> {
//   List<PhotoList> attachments = List();
//   @override
//   Widget build(BuildContext context) {
//     return
//       FutureBuilder(
//           future: DatabaseHelper.db.getAllImages(),
//           //:DatabaseHelper.db.getAllImages(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             print(snapshot.hasData);
//             if (!snapshot.hasData) {
//               return Center(
//                 //child: CircularProgressIndicator(),
//               );
//             } else {
//               // print('FutureBuilder '+snapshot.data.toList().toString());
//               attachments = snapshot.data as List<PhotoList>;
//
//               return ListView.builder(
//                   itemCount: attachments.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return
//                     //   Container(
//                     //   child:Text(
//                     //     "${attachments1[index].physicalfilename}",
//                     //     style: TextStyle(
//                     //     fontSize: 16, fontWeight: FontWeight.w600),
//                     // );
//                       InkWell(
//                       onTap: () async {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DataPart(
//                                 physicalfilename: attachments[index].physicalfilename,
//                                 // practicename: attachments[index].practicename,
//                                 // locationname: attachments[index].locationname,
//                                 // externaldocumenttype:
//                                 // attachments[index].externaldocumenttype,
//                                 // providername: attachments[index].providername,
//                                 // patientfirstname:
//                                 // attachments[index].patientfirstname,
//                                 // patientdob: attachments[index].patientdob,
//                                 // isemergencyaddon:
//                                 // attachments[index].isemergencyaddon,
//                                 // description: attachments[index].description,
//                                 //  physicalfilename: attachments.[index].,
//                               )
//                           ),
//                         );
//                       },
//                       //child: CircularProgressIndicator(),
//                       // Container(
//                       //   child: Card(
//                       //     child: ListTile(
//                       //       leading: Column(
//                       //         mainAxisAlignment: MainAxisAlignment.center,
//                       //         children: <Widget>[
//                       //           Padding(padding: new EdgeInsets.all(3.0)),
//                       //           Text(
//                       //             "${attachments[index].displayfilename}",
//                       //             style: TextStyle(
//                       //                 fontSize: 16, fontWeight: FontWeight.w600),
//                       //           ),
//                       //         ],
//                       //       ),
//                       //       trailing: IconButton(
//                       //         icon: Icon(Icons.cloud_upload_rounded, size: 40),
//                       //         onPressed: () {
//                       //           //
//                       //         },
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                     );
//                   }
//               );
//             }
//           }
//       );
//   }
// }
