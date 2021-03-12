
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_document_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_location_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_practice_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_provider_model.dart';
import 'package:YOURDRS_FlutterAPP/data/models/extrenal_databse_model.dart';
import 'package:YOURDRS_FlutterAPP/helper/db_helper.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/cupertino_action_sheet.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_document_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_location_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_practice_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_provider_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/external_dateofbirth_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';




///------------------------------This is the SubmitNew class and this class contains all the fields for ExternalAttachment screen
class SubmitNew extends StatefulWidget {
  @override
  _SubmitNewState createState() => _SubmitNewState();
}

class _SubmitNewState extends State<SubmitNew> {
  //String _selectedLocation;
  String  selectedProvidername;
  String selectedDate;
  int practiceId;
  String selectedPractice2;
   String selectedLocation;
   String selecteddocumnettype;
   int LocationId;
  int providerId1;
  int documenttypeId;
   bool toggleVal;

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController Description= TextEditingController();
  @override
  Widget build(BuildContext context) {
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

                              print('from UI:' + newValue);
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
                      setState(() {
                        selecteddocumnettype='${value.externalDocumentTypeName}';
                        documenttypeId=value.id;
                      });
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
                            toggleVal = true;
                          } else if (toggleIndex == 1) {
                            toggleVal = false;
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
                  CameraActionSheet(

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
                                                 practiceId:practiceId,
                                                practiceName:selectedPractice2,
                                                locationId: LocationId,
                                                locationName: selectedLocation ,
                                               providerId: providerId1,
                                              providerName: selectedProvidername,
                                              externalDocumentType: selecteddocumnettype,
                                              externalDocumentTypeId: documenttypeId,
                                              patientFirstName: firstname.text,
                                              patientLastName: lastname.text,
                                              patientDOB:selectedDate,
                                               isEmergencyAddOn:toggleVal?? 'NA',
                                              description:Description.text,
                                            )
                                        );
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
                                      };
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

