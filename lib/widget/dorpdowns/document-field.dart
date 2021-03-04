import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdown.dart';
import 'package:flutter/material.dart';
class DocumentDropDown extends StatefulWidget {
  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<DocumentDropDown> {
  var _currentSelectedValue;

  List data = List(); //edited line
  // List<LocationList> data = List();
  //Services apiServices = Services();


  @override
  void initState() {
    super.initState();
    // this.getLocation();
  }

  @override
  // void didChangeDependencies() async {
  //   super.didChangeDependencies();
  //   Location location = await apiServices.getLocation();
  //   data = location.locationList;
  //   setState(() {});
  // }

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
                        hint: "select",
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            state.didChange(newValue);
                            print(_currentSelectedValue);
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
// class DocumentType extends StatefulWidget {
//   @override
//   _DocumentTypeState createState() => _DocumentTypeState();
// }
//
// class _DocumentTypeState extends State<DocumentType> {
//   var _currentSelectedValue4;
//   var _currencies4 = [
//     "Document1",
//     "Document2",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       //color: Colors.yellow,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 220,top: 10),
//             child:Text(
//               AppStrings.documenttype,
//               style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
//                 color: CustomizedColors.practice_textColor,
//               ),
//             ),
//           ),
//           Padding(
//             padding:const EdgeInsets.only(top: 15),
//             child:Container(
//                 height: 58,
//                 width: 350,
//                 child: FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
//                       isEmpty: _currentSelectedValue4 == '',
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           hint: Text("select"),
//                           value: _currentSelectedValue4,
//                           isDense: true,
//                           onChanged: (String newValue) {
//                             setState(() {
//                               _currentSelectedValue4 = newValue;
//                               state.didChange(newValue);
//                             });
//                           },
//                           items: _currencies4.map((String value) {
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
