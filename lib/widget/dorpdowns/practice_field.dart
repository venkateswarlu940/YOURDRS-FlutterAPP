import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/network/models/practice.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdown.dart';
import 'package:flutter/material.dart';

import 'package:YOURDRS_FlutterAPP/network/models/location.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';


 class PracticeDropDown extends StatefulWidget {
   final onTapOfPractice;
   final String selectedPracticeId;
   PracticeDropDown({@required this. onTapOfPractice, this.selectedPracticeId});
   @override
   _PracticeState createState() => _PracticeState();
 }

 class _PracticeState extends State<PracticeDropDown> {
   var _currentSelectedValue;
  bool asTabs = false;
  Services apiServices = Services();
  PracticeList practiceList;
  //List<LocationList> _list=[];
  List data = List();

   void initState() {
     super.initState();
     _currentSelectedValue = widget.selectedPracticeId;
   }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Practices practice = await apiServices.getPratices();
    data = practice.practiceList;

//_currentSelectedValue=data;
    setState(() {});
  }

  List<Widget> get appBarActions {
    return ([
      Center(child: Text("Tabs:")),
      Switch(
        activeColor: Colors.white,
        value: asTabs,
        onChanged: (value) {
          setState(() {
            asTabs = value;
          });
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 55,
      //color: Colors.yellow,
      //height: MediaQuery.of(context).size.height * 0.07,
      //alignment: Alignment.center,
      //padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.86,
      child: SearchableDropdown.single(
        hint: Text('Select'),
        // label: Text('Location',style: TextStyle(
        //     fontSize: 16,fontWeight: FontWeight.bold,
        //     color: Colors.black
        // ),),
        items: data.map((item) {
          return DropdownMenuItem<PracticeList>(
              child: Text(
                item.name,
                overflow: TextOverflow.ellipsis,
              ),
              value:item
          );
        }).toList(),
        isExpanded: true,
        value: practiceList,
        searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
        onChanged: (value){
          setState(() {
            _currentSelectedValue = value;
            widget.onTapOfPractice(value);
            // practiceList=value;
            // print('practiceList $practiceList');
          });
        },
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}







// class PracticeDropDown extends StatefulWidget {
//   @override
//   _PracticeState createState() => _PracticeState();
// }
//
// class _PracticeState extends State<PracticeDropDown> {
//   var _currentSelectedValue;
//
//   List data = List(); //edited line
//   // List<LocationList> data = List();
//   //Services apiServices = Services();
//
//
//   @override
//   void initState() {
//     super.initState();
//     // this.getLocation();
//   }
//
//   @override
//   // void didChangeDependencies() async {
//   //   super.didChangeDependencies();
//   //   Location location = await apiServices.getLocation();
//   //   data = location.locationList;
//   //   setState(() {});
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 5, right: 8),
//             child:
//             Container(
//                 height: 55,
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 child: FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(5.0))),
//                       isEmpty: _currentSelectedValue == '',
//                       child: DropDown(
//                         value: _currentSelectedValue,
//                         hint: "select",
//                         onChanged: (String newValue) {
//                           setState(() {
//                             _currentSelectedValue = newValue;
//                             state.didChange(newValue);
//                             print(_currentSelectedValue);
//                           });
//                         },
//                         items: data.map((item) {
//                           return DropdownMenuItem<String>(
//                             child: new Text(
//                               item.locationName,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             value: item.locationId.toString(),
//                           );
//                         }).toList(),
//                       ),
//                     );
//                   },
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class Practice extends StatefulWidget {
//   @override
//   _PracticeState createState() => _PracticeState();
// }
//
// class _PracticeState extends State<Practice> {
//
//   var _currentSelectedValue1;
//   var _currencies1 = [
//     "Doctor",
//     "Patient",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//       //color: Colors.yellow,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 290,top: 20),
//             child:Text(
//               AppStrings.practice,
//               style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
//                 color: CustomizedColors.practice_textColor,
//               ),
//             ),
//           ),
//           Padding(
//             padding:const EdgeInsets.only(top: 15),
//             child:   Container(
//                 height: 58,
//                 width: 350,
//                 child: FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
//                       isEmpty: _currentSelectedValue1 == '',
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           hint: Text("select"),
//                           value: _currentSelectedValue1,
//                           isDense: true,
//                           onChanged: (String newValue) {
//                             setState(() {
//                               _currentSelectedValue1 = newValue;
//                               state.didChange(newValue);
//                             });
//                           },
//                           items: _currencies1.map((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     );
//                   },
//                 )
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
