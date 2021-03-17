
import 'dart:io';

import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_log_helper.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_document_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_location_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_practice_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_provider_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/extrenal_databse_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/photo_list.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_document_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_location_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_practice_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_provider_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_dateofbirth_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';




///------------------------------This is the SubmitNew class and this class contains all the fields for ExternalAttachment screen
class SubmitNew extends StatefulWidget {
  @override
  _SubmitNewState createState() => _SubmitNewState();
}

class _SubmitNewState extends State<SubmitNew> {
  ///------------------- images variables upadtes
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat(AppStrings.dateFormat);
  bool widgetVisible = false;
  bool visible = false;
  Directory directory;
  bool isSwitched = false;
  //PatientDetailsBloc bloc;
  File image;
  int gIndex;
  String fileName;
  String filepath;
  Map<String, String> paths;
  List<String> extensions;
  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType fileType;
  bool imageVisible=true;
  ///----------------------------
  String  selectedProvidername;
  String selectedDate;
  int practiceId;
  String selectedPractice2;
   String selectedLocation;
   String selecteddocumnettype;
   int LocationId;
  int providerId1;
  int documenttypeId;
   int toggleVal;
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController Description= TextEditingController();
  ///---------------function to open camera
  Future openCamera() async {
    image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    String path = image.path;
    createFileName(path);
    setState(() {
      image;
      widgetVisible = true;
      visible = false;
    });
  }
  ///-------------------------function to open gallery
  Future openGallery() async {
    setState(() => isLoadingPath = true);
    try {
      if (!isMultiPick) {
        filepath = null;
        paths = await FilePicker.getMultiFilePath(
            type: fileType != null ? fileType : FileType.image,
            allowedExtensions: extensions);
        print(paths.toString());
      } else {
        filepath = await FilePicker.getFilePath(
            type: fileType != null ? fileType : FileType.image,
            allowedExtensions: extensions);
        print(filepath);
        paths = null;
      }
    } on PlatformException catch (e) {
      print("File not found"+ e.toString());
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
      print("file not found"+ e.toString());
    }
  }
  ///----------------------cupertino
  void _show(BuildContext ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (ctctc) => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
                onPressed:() {openCamera();
                Navigator.pop(ctctc);}, child: Text('Camera')),
            CupertinoActionSheetAction(
                onPressed: (){openGallery();
                Navigator.pop(ctctc);}, child: Text('Open Gallery')),
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
  ///----------------------------custom file name
  Future<String> createFileName(String mockName) async {
    String fileName1;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(AppStrings.dateFormat);
    final String formatted = formatter.format(now);
    try {
      fileName1 = AppStrings.name + basename(mockName).replaceAll(".", "");
      if (fileName1.length > AppStrings.name.length) {
        fileName1 = fileName1.substring(0, AppStrings.name.length);
        final Directory directory = await getExternalStorageDirectory();
        String path = '${directory.path}/${AppStrings.folderName}';
        final myImgDir = await Directory(path).create(recursive: true);
        final File newImage = await image.copy(
            '${myImgDir.path}/${basename(fileName1 + '${formatted}' + AppStrings.imageFormat)}');
        setState(() {
          newImage;
          print(path);
        });
      }
    } catch (e, s) {
      fileName1 = "";
      AppLogHelper.printLogs(e, s);
    }

    print("${formatted}" + fileName1 + ".jpeg");
    return "${formatted}" + fileName1 + ".jpeg";
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat(AppStrings.currentdate_text).format(now);
    //final ScheduleList item = ModalRoute.of(context).settings.arguments;
    return ListView(
      children: [
        Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [

                ///--------------------Practice Field
                Container(
                  child:  Padding(
                    padding: const EdgeInsets.only(top:20),
                    child: Text(
                      AppStrings.practice,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                        color: CustomizedColors.practice_textColor,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.87,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: PracticeDropDown(
                    onTapOfPractice: (PracticeList value) {
                      setState(() {
                        practiceId= value.id;
                        selectedPractice2='${value.name}';
                      });
                    },
                  ),
                ),

                ///--------------------Location Field
                Container(
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:Text(
                      AppStrings.locations,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                        color: CustomizedColors.practice_textColor,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.87,
                ),
                  Padding(
                   padding: const EdgeInsets.only(top:7),
                    child:  Locations(
                      onTapOfLocation: (LocationList value) {
                        print('from UI: $value');
                       setState(() {
                         LocationId=value.id;
                         selectedLocation = '${value?.name}';
                       });
                      },
                      PracticeIdList: practiceId,
                    ),
                ),
                ///---------------------Provider Field
                Container(
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child:Text(
                      AppStrings.provider,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                        color: CustomizedColors.practice_textColor,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.87,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  child:
                  ExternalProviderDropDown(
                    onTapOfProvider: (ProviderList value) {
                     setState(() {
                       providerId1=value.providerId;
                       selectedProvidername = '${value?.displayname}';
                     });

                      print('from UI: $value');
                    },
                   PracticeLocationId: LocationId,
                  ),
                ),
                ///--------------------First Name Field
                Container(
                  child: Column(
                    children: [
                      Container(
                        child:  Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child:Text(
                            AppStrings.firstname,
                            style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              color: CustomizedColors.practice_textColor,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.87,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,right: 8),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.85,
                          //color: Colors.yellow,
                          child: TextFormField(
                            controller: firstname,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppStrings.firstname_validator;
                              }
                              return null;
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              hintText: AppStrings.hint_fisrtname,
                              //errorText: validationService.firstName.error,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            ),
                            // onChanged: (String value) {
                            //   validationService.changeFirstName(value);
                            // },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///------------------------Last Name Field
                Container(
                  child: Column(
                    children: [
                      Container(
                        child:  Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child:Text(
                            AppStrings.lastname,
                            style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              color: CustomizedColors.practice_textColor,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.87,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,right: 8),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.85,
                          //color: Colors.yellow,
                          child: TextFormField(
                            controller: lastname,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppStrings.lastname_validator;
                              }
                              return null;
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                            //  errorText: validationService.lastName.error,
                              contentPadding: EdgeInsets.all(20),
                              hintText: AppStrings.hint_lastname,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            ),
                            // onChanged: (String value) {
                            //   validationService.changeLastName(value);
                            // },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///------------------------Date of birth Field
                Container(
                  child: Column(
                    children: [
                      Container(
                        child:  Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child:
                          Text(
                            AppStrings.dateofbirth,
                            style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              color: CustomizedColors.practice_textColor,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.87,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,right: 8),
                        child:
                        Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.85,
                          //color: Colors.yellow,
                          //color: Colors.yellow,
                          child:
                          DateOfBirth(
                            dobSelect: (String newValue) {
                              selectedDate= newValue;

                              //print('from UI:' + newValue);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///------------------Document type Field
                Container(
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child:Text(
                      AppStrings.documenttype,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                        color: CustomizedColors.practice_textColor,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.87,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child:  DocumentDropDown(
                    onTapOfDocument: (ExternalDocumentTypesList value){
                      selecteddocumnettype=value.externalDocumentTypeName;
                      documenttypeId=value.id;
                      // setState(() {
                      //  selecteddocumnettype='${value.externalDocumentTypeName}';
                      //   documenttypeId=value.id;
                      // });
                     // print('from UI:' + value);
                    },
                  ),
                ),
                ///-----------------------emergency Field
                Container(
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child:Text(
                      AppStrings.emergency_descrption,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                        color: CustomizedColors.practice_textColor,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * 0.87,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: ToggleSwitch(
                      minWidth: 130.0,
                      minHeight: 45,
                      cornerRadius: 10.0,
                      activeBgColor: CustomizedColors.accentColor,
                      activeFgColor: CustomizedColors.whitetoggleTextColor,
                      inactiveBgColor: Colors.grey[300],
                      inactiveFgColor: Colors.grey[700],
                      labels: ['YES', 'NO'],
                      icons: [Icons.check_circle, Icons.cancel_rounded],
                        onToggle: (toggleIndex) {
                          if (toggleIndex == 0) {
                            toggleVal = 1;
                          } else if (toggleIndex == 1) {
                            toggleVal = 0;
                          } else {
                            return null;
                          }
                          print(toggleVal);
                        },
                    ),
                  ),
                ),
                ///------------------Description Field
                Container(
                  child: Column(
                    children: [
                      Container(
                        child:  Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child:Text(
                            AppStrings.description,
                            style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                              color: CustomizedColors.practice_textColor,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.85,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          // height:200,
                          width: MediaQuery.of(context).size.width * 0.85,
                          //color: Colors.yellow,
                          child: TextFormField(
                            controller: Description,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppStrings.description_validator;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            minLines: 10,
                            maxLines: null,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///----------------add image/take image
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:
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
                ),
                SizedBox(height: 10),
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
                            // color: Colors.green,

                            child: Center(

                              // color: CustomizedColors.homeSubtitleColor,
                                child: Stack(children: [

                                  image == null
                                      ? Text("no image selected")
                                      : Image.file(
                                    image,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    right: -10,
                                    top: -5,
                                    child: Visibility(
                                      visible: imageVisible,
                                      child: IconButton(
                                        icon: new Icon(Icons.close,),
                                        onPressed: ()
                                        {
                                          setState(() {
                                            image=null;
                                            imageVisible=false;

                                          }
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                ])),
                          ),

                        ]),
                      ],
                    ),
                  ),
                ),
                ///------------------display the gallery for selecting the images
                Visibility(
                  visible: visible,
                  child: Column(children: [
                    Builder(
                      builder: (BuildContext context) => isLoadingPath
                          ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator())
                          : filepath != null || (paths != null && paths.values!=null && paths.values.isNotEmpty)
                          ? new Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                            CustomizedColors.homeSubtitleColor,
                          ),
                        ),
                        //   padding: const EdgeInsets.only(bottom: 30.0),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.85,
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
                            print(filePath1);
                            return Container(
                              color: CustomizedColors.homeSubtitleColor,
                              margin: const EdgeInsets.all(8),
                              child: Stack(children: [

                                filePath1 != null
                                    ? Image.file(
                                  File(filePath1),
                                  fit: BoxFit.contain,
                                )
                                    : Container(),

                                Positioned(
                                  right: -10,
                                  top: -5,
                                  child:  IconButton(
                                    icon: new Icon(Icons.close,
                                      //color: CustomizedColors.signInButtonTextColor,
                                    ),
                                    onPressed: ()
                                    {
                                      setState(() {
                                        // paths.values.toList().removeAt(index);
                                        var filename= basename(paths.values.toList()[index]);
                                        print('remove filename $fileName');
                                        paths.remove(filename);
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
                          : new Container(

                      ),
                    ),
                  ],
                  ),
                ),
                ///-------------------buttons
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20,right: 20),
                  child: Container(
                    child:
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 150,
                              child: Card(
                                //color: Colors.blue,
                                child: RaisedBttn(
                                  onPressed: ()
                                  {
                                    _formKey.currentState.reset();
                                  },
                                  text: AppStrings.cancel,
                                  button_color: CustomizedColors
                                      .cancelbuttonColor, //------we have take variable name clr to represents the color
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                //color: Colors.yellow
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 60,
                              width: 150,
                              child: Card(
                                // color: Colors.blue,
                                  child: RaisedBttn(
                                    onPressed: () async{
                                      if (_formKey.currentState.validate())
                                      {

                                        DatabaseHelper.db.insertExternalAttachmentData(
                                            ExternalAttachment(
                                                 practiceid:practiceId,
                                                practicename:selectedPractice2,
                                                locationid: LocationId,
                                                locationname: selectedLocation,
                                               providerid: providerId1,
                                              providername: selectedProvidername,
                                              externaldocumenttype: selecteddocumnettype,
                                              externaldocumenttypeid: documenttypeId,
                                              patientfirstname: firstname.text,
                                              patientlastname: lastname.text,
                                              patientdob:selectedDate,
                                               isemergencyaddon:toggleVal?? false,
                                              description:Description.text,
                                              displayfilename: selecteddocumnettype + "_10_"+ formattedDate,
                                            )
                                        );
                                        final String formatted = formatter.format(now);
                                        // DatabaseHelper.db.insertAudio(Dictation(
                                        //   photoList: DatabaseHelper.db.insertPhotoList(PhotoList( physicalfilename: '${image.path}'))
                                        //
                                        // ));
                                        //print(attachmentname);
                                        DatabaseHelper.db.insertPhotoList(PhotoList(
                                            attachmentname: '${firstname.text?? ''}' + "_" + '${formatted}'+'_'+ basename('${image}') + "_" ,
                                            createddate: '${DateTime.now()}',
                                            attachmenttype: AppStrings.imageFormat,
                                            physicalfilename: '${image.path}'
                                        ));
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CircularProgressIndicator(
                                                  backgroundColor:Colors.blue,
                                                  valueColor: AlwaysStoppedAnimation(
                                                      CustomizedColors.accentColor),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(AppStrings.submiting_datatext),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                      // else{
                                      //   Navigator.pop(context);
                                      // }
                                    },
                                    text: AppStrings.submit_buttontext,
                                    button_color: CustomizedColors
                                        .submitbuttonColor,
                                  )
                              ),
                              //color: Colors.blue,
                            ),
                          ],
                        ),
                    height: 100,
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
  }

