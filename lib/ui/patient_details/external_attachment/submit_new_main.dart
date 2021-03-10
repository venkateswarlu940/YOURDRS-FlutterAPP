
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/network/models/location.dart';
import 'package:YOURDRS_FlutterAPP/network/models/practice.dart';
import 'package:YOURDRS_FlutterAPP/network/models/provider.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/cupertino_action_sheet.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/raised_buttons.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/document-field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/location_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/practice_field.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/provider.dart';
import 'package:YOURDRS_FlutterAPP/widget/dorpdowns/dateofbirth.dart';
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
  String  _selectedProvider;
  String _selectedDate;
  String _selectedPractice;
   String _selectedLocation;

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstname=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController description= TextEditingController();
  List<bool> _isSelected = [true, false];
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
                        _selectedPractice = '${value?.id}';
                        print('from UI: $value');
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
                          _selectedLocation = '${value?.id}';
                        });
                      },
                      PracticeIdList: _selectedPractice,
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
                      _selectedProvider = '${value?.providerId}';

                      print('from UI: $value');
                    },
                    PracticeLocationId: _selectedLocation,
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
                                return AppStrings.validatorfield;
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
                                return AppStrings.validatorfield;
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
                          child: DateOfBirth(
                            dobSelect: (String newValue) {
                              _selectedDate= newValue;

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
                  child:  DocumentDropDown(),
                ),
                ///-----------------------emergency Field
                Container(
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child:Text(
                      AppStrings.emergencyetext,
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
                        print('switched to: $toggleIndex');
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
                            controller: description,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppStrings.validatorfield;
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
                  CameraActionSheet(),
                ),

                ///-------------------buttons
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20,right: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                   // color: Colors.deepOrange,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              //color: Colors.grey,
                              height: 60,
                              width: 150,
                              child: Card(
                                //color: Colors.blue,
                                child: RaisedBttn(
                                  onPressed: () {
                                    firstname.clear();
                                    lastname.clear();
                                    description.clear();

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
                                    onPressed: () {
                                      if (_formKey.currentState
                                          .validate()) {
                                        //  _formKey.currentState.save();
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        // Scaffold.of(context).showSnackBar(SnackBar(
                                        //     content: Text(
                                        //         'Processing Data')));
                                        // _formKey.currentState.save();
                                      };
                                    },
                                    text: AppStrings.submit,
                                    button_color: CustomizedColors
                                        .submitbuttonColor,
                                  )
                              ),
                              //color: Colors.blue,
                            ),
                          ],
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

