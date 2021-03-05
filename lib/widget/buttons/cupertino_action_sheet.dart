import 'dart:io';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/material_buttons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CameraActionSheet extends StatefulWidget {
  @override
  _CameraActionSheetState createState() => _CameraActionSheetState();
}

class _CameraActionSheetState extends State<CameraActionSheet> {
  bool widgetVisible = false;
  bool visible = false;
  Directory directory;
  bool isSwitched = false;
  List imageArray = [];
  //File image;
  int gIndex;
  String fileName;
  String filepath;
  Map<String, String> paths;
  List<String> extensions;
  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType fileType;
  bool imageVisible=true;
  File image;
  void _show(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (ctctc) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed: openCamera, child: Text('Camera')),
            CupertinoActionSheetAction(
                onPressed: openGallery, child: Text('Open Gallery')),
          ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel'),
              //isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(ctctc);
              },
            )),
        );
  }

  Future openCamera() async {
    image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    String path = image.path;
    // createFileName(path);
    setState(() {
      image;
      widgetVisible = true;
      visible = false;
    });
  }

  Future openGallery() async {
    setState(() => isLoadingPath = true);
    try {
      if (!isMultiPick) {
        filepath = null;
        paths = await FilePicker.g(
            type: fileType != null ? fileType : FileType.image,
            allowedExtensions: extensions);
        print(paths);
      } else {
        filepath = await FilePicker.getFilePath(
            type: fileType != null ? fileType : FileType.image,
            allowedExtensions: extensions);
        print(filepath);
        paths = null;
      }
    } on PlatformException catch (e) {
      print("file not fund" + e.toString());
    }
    try {
      if (!mounted) return;
      setState(() {
        isLoadingPath = false;
        fileName = filepath != null
            ? filepath.split('/').last
            : paths != null
            ? paths.keys.toString()
            : '...';
        visible = true;
        widgetVisible = false;
      });
    } on PlatformException catch (e) {
      print(AppStrings.filePathNotFound + e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _close(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ///-----------------------display the camera images to the ui
          Visibility(
            visible: widgetVisible,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomizedColors.homeSubtitleColor,
                        ),
                      ),
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Center(
                        child: Container(
                            height: 130,
                            width: 150,
// color: CustomizedColors.homeSubtitleColor,
                            child: Stack(children: [
                              Positioned(
                                right: 2,
                                top: -1,
                                child: Visibility(
                                  visible: imageVisible,
                                  child: IconButton(
                                    icon: new Icon(Icons.close),
                                    onPressed: ()
                                    {
                                      setState(() {
                                        image=null;
                                        imageVisible=false;

                                      });
                                    },
                                  ),
                                ),
                              ),
                              image == null
                                  ? Text("no image selected")
                                  : Image.file(
                                image,
                                fit: BoxFit.contain,
                              ),
                            ])),
                      ),
                    )
                  ]),
                ],
              ),
            ),
          ),
          Visibility(
            visible: visible,
            child: Column(children: [
              Builder(
                builder: (BuildContext context) => isLoadingPath
                    ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: const CircularProgressIndicator())
                    : filepath != null || paths != null
                    ? new Container(

                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                      CustomizedColors.homeSubtitleColor,
                    ),
                  ),
// padding: const EdgeInsets.only(bottom: 30.0),
                  height: 100,
                  child: new ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                    paths != null && paths.isNotEmpty
                        ? paths.length
                        : 1,
                    itemBuilder:
                        (BuildContext context, index) {
                      final bool isMultiPath =
                          paths != null && paths.isNotEmpty;
                      final filePath1 = isMultiPath
                          ? paths.values
                          .toList()[index]
                          .toString()
                          : filepath;

                      return Container(
                        color: CustomizedColors.homeSubtitleColor,
                        margin: const EdgeInsets.all(10),
                        child: Stack(children: [
                          filepath==null?
                          Text("no image selected"):
                          Image.file(
                            File(filepath),
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            right: -10,
                            top: -5,
                            child: IconButton(
                              icon: new Icon(Icons.close),
                              onPressed: ()
                              {
                                setState(() {
// filepath=null;
                                });
                              },
                            ),
                          ),
                        ]),
                      );
                    },
                    separatorBuilder:
                        (BuildContext context, int index) =>
                    new Divider(),
                  ),
                )
                    : new Container(),
              ),
            ]
            ),
          ),
          SizedBox(height: 15),
          CupertinoPageScaffold(
              child: Center(
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: CustomizedColors.addressTextColor,
                            size: 45,
                          ),
                          Text(
                            'Add Image/Take Picture',
                            style: TextStyle(color:CustomizedColors.addimage_textColor),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => _show(context),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}