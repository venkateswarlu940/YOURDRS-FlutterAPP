// // // import 'dart:convert';
// // // import 'dart:io';
// // // import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
// // // import 'package:YOURDRS_FlutterAPP/common/app_log_helper.dart';
// // // import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
// // // import 'package:YOURDRS_FlutterAPP/widget/buttons/material_buttons.dart';
// // // import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:intl/intl.dart';
// // //
// // // import 'package:path/path.dart';
// // // import 'package:file_picker/file_picker.dart';
// // //
// // // class Patient_Dectation extends StatefulWidget {
// // //   @override
// // //   State<StatefulWidget> createState() {
// // // // TODO: implement createState
// // //     return Patient_Dectation_State();
// // //   }
// // // }
// // //
// // // class Patient_Dectation_State extends State<Patient_Dectation> {
// // //   bool widgetVisible = false;
// // //   bool visible = false;
// // //   Directory directory;
// // //   bool isSwitched = false;
// // //   List imageArray = [];
// // //   File image;
// // //   int gIndex;
// // //   String fileName;
// // //   String filepath;
// // //   Map<String, String> paths;
// // //   List<String> extensions;
// // //   bool isLoadingPath = false;
// // //   bool isMultiPick = false;
// // //   FileType fileType;
// // //   bool imageVisible=true;
// // //
// // // //function to open camera
// // //   Future openCamera() async {
// // //     image = await ImagePicker.pickImage(
// // //         source: ImageSource.camera, imageQuality: 50);
// // //     String path = image.path;
// // //    // createFileName(path);
// // //     setState(() {
// // //       image;
// // //       widgetVisible = true;
// // //       visible = false;
// // //     });
// // //   }
// // //
// function to open gallery
//   Future openGallery() async {
//     setState(() => isLoadingPath = true);
//     try {
//       if (!isMultiPick) {
//         filepath = null;
//         paths = await FilePicker.getMultiFilePath(
//             type: fileType != null ? fileType : FileType.image,
//             allowedExtensions: extensions);
//         print(paths);
//       } else {
//         filepath = await FilePicker.getFilePath(
//             type: fileType != null ? fileType : FileType.image,
//             allowedExtensions: extensions);
//         print(filepath);
//         paths = null;
//       }
//     } on PlatformException catch (e) {
//       print(AppStrings.filePathNotFound + e.toString());
//     }
//     try {
//       if (!mounted) return;
//       setState(() {
//         isLoadingPath = false;
//         fileName = filepath != null
//             ? filepath.split('/').last
//             : paths != null
//             ? paths.keys.toString()
//             : '...';
//         visible = true;
//         widgetVisible = false;
//       });
//     } on PlatformException catch (e) {
//       print(AppStrings.filePathNotFound + e.toString());
//     }
//   }
// // //
// // // //saving of filepicker files
// // // //   Future<String> saveFile(String fileName) async {
// // // //     String fileName1;
// // // //     final DateTime now = DateTime.now();
// // // //     final DateFormat formatter = DateFormat(AppStrings.dateFormat);
// // // //     final String formatted = formatter.format(now);
// // // //     try {
// // // //       fileName1 = AppStrings.name + basename(fileName).replaceAll(".", "");
// // // //       if (fileName1.length > AppStrings.name.length) {
// // // //         final Directory directory =
// // // //         await getExternalStorageDirectory();
// // // //         String path = '${directory.path}/${AppStrings.folderName}';
// // // //         final myImgDir =
// // // //         await Directory(path).create(recursive: true);
// // // //         final File newImage = await File(filepath).copy(
// // // //             '${myImgDir.path}/${basename(
// // // //                 File(filepath).toString() + '${formatted}' + AppStrings.imageFormat)}');
// // // //         setState(() {
// // // //           newImage;
// // // //           Log.e("", newImage);
// // // //           print(path);
// // // //         });
// // // //       }
// // // //     }
// // // //     catch (e, s) {
// // // //       fileName1 = "";
// // // // // AppLogHelper.printLogs(e, s);
// // // //     }
// // // //
// // // //     print("imsdjfd"+"${DateTime
// // // //         .now()
// // // //         .microsecond}" + fileName1 + ".jpeg");
// // // //     return "${formatted} "+ fileName1 + AppStrings.imageFormat;
// // // //   }
// // //
// // //
// // // //custom file name
// // // //   Future<String> createFileName(String mockName) async {
// // // //     String fileName1;
// // // //     final DateTime now = DateTime.now();
// // // //     final DateFormat formatter = DateFormat(AppStrings.dateFormat);
// // // //     final String formatted = formatter.format(now);
// // // //     try {
// // // //       fileName1 = AppStrings.name + basename(mockName).replaceAll(".", "");
// // // //       if (fileName1.length > AppStrings.name.length) {
// // // //         fileName1 = fileName1.substring(0, AppStrings.name.length);
// // // //         final Directory directory = await getExternalStorageDirectory();
// // // //         String path = '${directory.path}/${AppStrings.folderName}';
// // // //         final myImgDir = await Directory(path).create(recursive: true);
// // // //         final File newImage = await image.copy(
// // // //             '${myImgDir.path}/${basename(fileName1 + '${formatted}' + AppStrings.imageFormat)}');
// // // //         setState(() {
// // // //           newImage;
// // // //           print(path);
// // // //         });
// // // //       }
// // // //     } catch (e, s) {
// // // //       fileName1 = "";
// // // //       AppLogHelper.printLogs(e, s);
// // // //     }
// // // //
// // // //     print("${formatted}" + fileName1 + ".jpeg");
// // // //     return "${formatted}" + fileName1 + ".jpeg";
// // // //   }
// // //
// // // //function for switch button
// // // //   void toggleSwitch(bool value) {
// // // //     try {
// // // //       if (isSwitched == false) {
// // // //         setState(() {
// // // //           isSwitched = true;
// // // //         });
// // // //       } else {
// // // //         setState(() {
// // // //           isSwitched = false;
// // // //         });
// // // //       }
// // // //     } on PlatformException catch (e) {
// // // //       throw (e);
// // // //     }
// // // //   }
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //         body: Container(
// // //             padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
// // //             child: ListView(
// // //               children: [
// // // //                 Container(
// // // //                   child: Row(
// // // //                     children: [
// // // //                       Container(
// // // //                         child: Row(
// // // //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                           children: [
// // // //                             // Container(
// // // //                             //   width: 100,
// // // //                             //   height: 105,
// // // //                             //   child: ClipRRect(
// // // //                             //     borderRadius: BorderRadius.circular(50),
// // // //                             //     child: Container(
// // // //                             //       height: 90,
// // // //                             //       width: 90,
// // // //                             //       child: Image.asset(AppStrings.defaultImage),
// // // //                             //     ),
// // // //                             //   ),
// // // //                             //   margin: EdgeInsets.only(left: 30),
// // // //                             // ),
// // // //
// // // // //To Display patient details
// // // // //                             Container(
// // // // //                               child: Column(
// // // // //                                 mainAxisAlignment: MainAxisAlignment.start,
// // // // //                                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                                 children: [
// // // // //                                   Text(
// // // // //                                     AppStrings.date,
// // // // //                                     style: TextStyle(
// // // // //                                         fontSize: 17,
// // // // //                                         fontWeight: FontWeight.bold,
// // // // //                                         color:
// // // // //                                         CustomizedColors.addressTextColor),
// // // // //                                   ),
// // // // //                                   Text(
// // // // //                                     AppStrings.pc_md,
// // // // //                                     style: TextStyle(
// // // // //                                         fontSize: 17,
// // // // //                                         color:
// // // // //                                         CustomizedColors.addressTextColor),
// // // // //                                   ),
// // // // //                                   Text(
// // // // //                                     AppStrings.name,
// // // // //                                     style: TextStyle(
// // // // //                                         fontSize: 17,
// // // // //                                         fontWeight: FontWeight.bold,
// // // // //                                         color:
// // // // //                                         CustomizedColors.addressTextColor),
// // // // //                                   ),
// // // // //                                   Text(
// // // // //                                     AppStrings.male_28,
// // // // //                                     style: TextStyle(
// // // // //                                         fontSize: 17,
// // // // //                                         color:
// // // // //                                         CustomizedColors.addressTextColor),
// // // // //                                   ),
// // // // //                                   Text(
// // // // //                                     AppStrings.dictationPending,
// // // // //                                     style: TextStyle(
// // // // //                                         fontSize: 17,
// // // // //                                         color:
// // // // //                                         CustomizedColors.addressTextColor),
// // // // //                                   ),
// // // // //                                 ],
// // // // //                               ),
// // // // //                               margin: const EdgeInsets.only(
// // // // //                                   left: 23, top: 50, bottom: 30),
// // // // // // color: Colors.yellow,
// // // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   height: 200,
// // // //                 ),
// // //
// // // //For Switch button
// // // //                 Row(
// // // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // // //                     mainAxisAlignment: MainAxisAlignment.end,
// // // //                     children: [
// // // //                       SizedBox(
// // // //                         width: 60,
// // // //                       ),
// // // //                       Text(AppStrings.startfile,
// // // //                           style: TextStyle(fontSize: 15)),
// // // //                       SizedBox(
// // // //                         width: 20,
// // // //                       ),
// // // //                       Transform.scale(
// // // //                           scale: 1.5,
// // // //                           child: Switch(
// // // //                             onChanged: toggleSwitch,
// // // //                             value: isSwitched,
// // // //                             activeColor: CustomizedColors.switchactiveColor,
// // // //                             activeTrackColor: CustomizedColors.swicthtrackColor,
// // // //                             inactiveThumbColor:
// // // //                             CustomizedColors.swicththumbColor,
// // // //                             inactiveTrackColor:
// // // //                             CustomizedColors.inactiveTrackColor,
// // // //                           )),
// // // //                     ]),
// // // //                 SizedBox(
// // // //                   height: 15,
// // // //                 ),
// // //
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // //                   children: [
// // // // //Button for mic
// // // //                     MaterialButtons(
// // // //                       onPressed: () {},
// // // //                       iconData: Icons.mic,
// // // //                     ),
// // // // //
// // // //
// // // //                     MaterialButtons(
// // // //                         onPressed: () {
// // // // // CupertinoActionSheet for camera and gallery
// // // //                           cupertinoActionSheet(context);
// // // //                         },
// // // //                         iconData: Icons.camera_alt)
// // // //                   ],
// // // //                 ),
// // // //
// // // //                 SizedBox(
// // // //                   height: 15,
// // // //                 ),
// // //
// // // //to show camera images
// // //                 Visibility(
// // //                   visible: widgetVisible,
// // //                   child: Container(
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.center,
// // //                       children: [
// // //                         Wrap(children: [
// // //                           Container(
// // //                             decoration: BoxDecoration(
// // //                               border: Border.all(
// // //                                 color: CustomizedColors.homeSubtitleColor,
// // //                               ),
// // //                             ),
// // //                             height: 100,
// // //                             child: Center(
// // //                               child: Container(
// // //                                   height: 130,
// // //                                   width: 150,
// // // // color: CustomizedColors.homeSubtitleColor,
// // //                                   child: Stack(children: [
// // //                                     Positioned(
// // //                                       right: 2,
// // //                                       top: -1,
// // //                                       child: Visibility(
// // //                                         visible: imageVisible,
// // //                                         child: IconButton(
// // //                                           icon: new Icon(Icons.close),
// // //                                           onPressed: ()
// // //                                           {
// // //                                             setState(() {
// // //                                               image=null;
// // //                                               imageVisible=false;
// // //
// // //                                             });
// // //                                           },
// // //                                         ),
// // //                                       ),
// // //                                     ),
// // //                                     image == null
// // //                                         ? Text(AppStrings.noImageSelected)
// // //                                         : Image.file(
// // //                                       image,
// // //                                       fit: BoxFit.contain,
// // //                                     ),
// // //                                   ])),
// // //                             ),
// // //                           )
// // //                         ]),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //
// // //To show gallery images
// //                 Visibility(
// //                     visible: visible,
// //                     child: Column(children: [
// //                       Builder(
// //                         builder: (BuildContext context) => isLoadingPath
// //                             ? Padding(
// //                             padding: const EdgeInsets.only(bottom: 10.0),
// //                             child: const CircularProgressIndicator())
// //                             : filepath != null || paths != null
// //                             ? new Container(
// //
// //                           decoration: BoxDecoration(
// //                             border: Border.all(
// //                               color:
// //                               CustomizedColors.homeSubtitleColor,
// //                             ),
// //                           ),
// // // padding: const EdgeInsets.only(bottom: 30.0),
// //                           height: 100,
// //                           child: new ListView.separated(
// //                             scrollDirection: Axis.horizontal,
// //                             itemCount:
// //                             paths != null && paths.isNotEmpty
// //                                 ? paths.length
// //                                 : 1,
// //                             itemBuilder:
// //                                 (BuildContext context, index) {
// //                               final bool isMultiPath =
// //                                   paths != null && paths.isNotEmpty;
// //                               final filePath1 = isMultiPath
// //                                   ? paths.values
// //                                   .toList()[index]
// //                                   .toString()
// //                                   : filepath;
// //
// //                               return Container(
// //                                 color: CustomizedColors.homeSubtitleColor,
// //                                 margin: const EdgeInsets.all(10),
// //                                 child: Stack(children: [
// //                                   filepath==null?
// //                                   Text(AppStrings.noImageSelected):
// //                                   Image.file(
// //                                     File(filepath),
// //                                     fit: BoxFit.contain,
// //                                   ),
// //                                   Positioned(
// //                                     right: -10,
// //                                     top: -5,
// //                                     child: IconButton(
// //                                       icon: new Icon(Icons.close),
// //                                       onPressed: ()
// //                                       {
// //                                         setState(() {
// // // filepath=null;
// //                                         });
// //                                       },
// //                                     ),
// //                                   ),
// //                                 ]),
// //                               );
// //                             },
// //                             separatorBuilder:
// //                                 (BuildContext context, int index) =>
// //                             new Divider(),
// //                           ),
// //                         )
// //                             : new Container(),
// //                       ),
// //                     ]
// //                     ),
// //                 ),
// // // //Buttons for functionality
// // // //                 Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.center,
// // // //                     children: [
// // // //                       RaisedBtn(
// // // //                           text: AppStrings.superBill,
// // // //                           onPressed: () {},
// // // //                           iconData: Icons.description_outlined),
// // // //                       SizedBox(
// // // //                         height: 15,
// // // //                       ),
// // // //                       RaisedBtn(
// // // //                           text: AppStrings.allDictations,
// // // //                           onPressed: () {},
// // // //                           iconData: Icons.mic_rounded),
// // // //                       SizedBox(
// // // //                         height: 15,
// // // //                       ),
// // // //                       RaisedBtn(
// // // //                           text: AppStrings.images,
// // // //                           onPressed: () {
// // // //                             Navigator.push(
// // // //                                 context,
// // // //                                 MaterialPageRoute(
// // // //                                     builder: (context) => UploadedImages()));
// // // //                           },
// // // //                           iconData: Icons.camera_alt),
// // // //                     ]
// // // //                 ),
// // //               ],
// // //             )
// // //         )
// // //     );
// // //   }
// // //
// // // //to open camera nad gallery
// // //   Widget cupertinoActionSheet(BuildContext context) {
// // //     final action = CupertinoActionSheet(
// // //       actions: [
// // //         CupertinoActionSheetAction(
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Text("camera"),
// // //             ],
// // //           ),
// // //           onPressed: () {
// // //             openCamera();
// // //             Navigator.pop(context);
// // //           },
// // //         ),
// // //         CupertinoActionSheetAction(
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Text("PhotoGallery"),
// // //             ],
// // //           ),
// // //           onPressed: () {
// // //             openGallery();
// // //             Navigator.pop(context);
// // //           },
// // //         )
// // //       ],
// // //       cancelButton: CupertinoActionSheetAction(
// // //         child: Text(AppStrings.cancel),
// // //         isDestructiveAction: true,
// // //         onPressed: () {
// // //           Navigator.pop(context);
// // //         },
// // //       ),
// // //     );
// // //
// // //     showCupertinoModalPopup(context: context, builder: (context) => action);
// // //   }
// // //
// // //
// // // }