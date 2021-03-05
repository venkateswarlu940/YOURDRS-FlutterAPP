import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/network/models/location.dart';

import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';

class LocationDropDown extends StatefulWidget {
  final onTapOfLocation;
  final String selectedLocationId;
  LocationDropDown({@required this.onTapOfLocation, this.selectedLocationId});
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<LocationDropDown> {
  var _currentSelectedValue;

  List data = List(); //edited line
  // List<LocationList> data = List();
  Services apiServices = Services();


  @override
  void initState() {
    super.initState();
    _currentSelectedValue = widget.selectedLocationId;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Location location = await apiServices.getLocation();
    data = location.locationList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 8),
            child:
            Container(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.85,
                child: FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      isEmpty: _currentSelectedValue == '',
                      child: DropDown(
                        value: _currentSelectedValue,
                        hint: "Location",
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            widget.onTapOfLocation(newValue);
                            state.didChange(newValue);
                            //print(_currentSelectedValue);
                          });
                        },
                        items: data.map((item) {
                          return DropdownMenuItem<String>(
                            child: new Text(
                              item.locationName,
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: item.locationId.toString(),
                          );
                        }).toList(),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
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
