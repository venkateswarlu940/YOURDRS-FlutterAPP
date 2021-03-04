import 'dart:io';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/material_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraActionSheet extends StatefulWidget {
  @override
  _CameraActionSheetState createState() => _CameraActionSheetState();
}

class _CameraActionSheetState extends State<CameraActionSheet> {
  File _image;
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
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }

  void _close(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
        ));
  }
}