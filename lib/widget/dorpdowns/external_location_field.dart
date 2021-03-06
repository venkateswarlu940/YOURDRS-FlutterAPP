import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_location_model.dart';

import 'package:YOURDRS_FlutterAPP/data/services/appointment_service.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

 class Locations extends StatefulWidget {
   final int PracticeIdList;
   final onTapOfLocation;
  const Locations({@required this.onTapOfLocation ,@required this.PracticeIdList});
   @override
   _LocationsState createState() => _LocationsState();
 }

 class _LocationsState extends State<Locations> {
  bool asTabs = false;
  Services apiServices = Services();
  LocationList locationsList;
  var _currentSelectedValue;
  //List<LocationList> _list=[];
  List data = List();
  int practiceId;
  void initState() {
    super.initState();
    _currentSelectedValue = widget.PracticeIdList;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
   // print('didChangeDependencies PracticeIdList ${widget.PracticeIdList}');
    // ExternalLocation externalLocation = await apiServices.getExternalLocation(widget.PracticeIdList);
    // data = externalLocation.locationList;

//_currentSelectedValue=data;
  //  setState(() {});
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
    if (practiceId == null ||
        (widget.PracticeIdList != null &&
            practiceId != widget.PracticeIdList)) {
      practiceId = widget.PracticeIdList;apiServices.getExternalLocation(practiceId).then((value) {
        data = value.locationList;
        setState(() {});
      });
    }

    //print('build PracticeIdList ${widget.PracticeIdList}');
    return Container(
      // alignment: Alignment.center,
      // padding: const EdgeInsets.all(10),
        //height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width*0.86,
      child: SearchableDropdown.single(
        displayClearIcon: false,
        items: data.map((item)
        {
          return DropdownMenuItem<LocationList>(
              child: Text(
                item.name?? "",
                //overflow: TextOverflow.ellipsis,
              ),
              value:item
          );
        }).toList(),
        isExpanded: true,
        value: locationsList,
        //searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
        onChanged: (value){
          setState(() {
            _currentSelectedValue = value;
            widget.onTapOfLocation(value);
            // locationsList=value;
            // print('locationsList $locationsList');
          });
        },
      ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
          ),
          borderRadius: BorderRadius.circular(6),
        )

    );
  }
}
// class Locations extends StatefulWidget {
//   @override
//   _LocationsState createState() => _LocationsState();
// }
//
// class _LocationsState extends State<Locations> {
//   var _currentSelectedValue2;
//   var _currencies2 = ["bangalore", "hyderabad"];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: Colors.yellow,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 280,top: 20),
//             child:Text(
//               AppStrings.locations,
//               style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
//                 color: CustomizedColors.practice_textColor,
//               ),
//             ),
//           ),
//           Padding(
//             padding:const EdgeInsets.only(top: 15),
//             child:   Container(
//                 height: 55,
//                 width: 350,
//                 child:
//                 FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
//                       isEmpty: _currentSelectedValue2 == '',
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           hint: Text("select"),
//                           value: _currentSelectedValue2,
//                           isDense: true,
//                           onChanged: (String newValue) {
//                             setState(() {
//                               _currentSelectedValue2 = newValue;
//                               state.didChange(newValue);
//                             });
//                           },
//                           items: _currencies2.map((String value) {
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
//





// class LocationDropDown extends StatefulWidget {
//   final onTapOfLocation;
//   final String selectedLocationId;
//   LocationDropDown({@required this.onTapOfLocation, this.selectedLocationId});
//   @override
//   _LocationState createState() => _LocationState();
// }
//
// class _LocationState extends State<LocationDropDown> {
//   var _currentSelectedValue;
//
//   List data = List(); //edited line
//   Services apiServices = Services();
//
//
//   @override
//   void initState() {
//     super.initState();
//     _currentSelectedValue = widget.selectedLocationId;
//   }
//
//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();
//     Location location = await apiServices.getLocation();
//     data = location.locationList;
//     setState(() {});
//   }
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
//                         hint: "Location",
//                         onChanged: (String newValue) {
//                           setState(() {
//                             _currentSelectedValue = newValue;
//                             widget.onTapOfLocation(newValue);
//                             state.didChange(newValue);
//                            // print(_currentSelectedValue);
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
// class Locations extends StatefulWidget {
//   @override
//   _LocationsState createState() => _LocationsState();
// }
//
// class _LocationsState extends State<Locations> {
//   var _currentSelectedValue2;
//   var _currencies2 = ["bangalore", "hyderabad"];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //color: Colors.yellow,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 280,top: 20),
//             child:Text(
//               AppStrings.loactions,
//               style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
//                 color: CustomizedColors.practice_textColor,
//               ),
//             ),
//           ),
//           Padding(
//             padding:const EdgeInsets.only(top: 15),
//             child:   Container(
//                 height: 55,
//                 width: 350,
//                 child:
//                 FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
//                       isEmpty: _currentSelectedValue2 == '',
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           hint: Text("select"),
//                           value: _currentSelectedValue2,
//                           isDense: true,
//                           onChanged: (String newValue) {
//                             setState(() {
//                               _currentSelectedValue2 = newValue;
//                               state.didChange(newValue);
//                             });
//                           },
//                           items: _currencies2.map((String value) {
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
