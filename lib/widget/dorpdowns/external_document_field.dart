import 'package:YOURDRS_FlutterAPP/network/models/external_document_model.dart';
import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';


class DocumentDropDown extends StatefulWidget {
  final onTapOfDocument;
  final String selecteddocumnettype;
  DocumentDropDown({@required this. onTapOfDocument, this.selecteddocumnettype});
   @override
  _DocumentState createState() => _DocumentState();
}

 class _DocumentState extends State<DocumentDropDown> {
  bool asTabs = false;
  Services apiServices = Services();
  ExternalDocumentTypesList externalDocumentTypesList;
 //List<LocationList> _list=[];
  List data = List();
  var  _currentSelectedValue;
  void initState() {
    super.initState();
    _currentSelectedValue = widget.selecteddocumnettype;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    Documenttype document = await apiServices.getDocumenttype();
    data = document.externalDocumentTypesList;
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
      // alignment: Alignment.center,
      // padding: const EdgeInsets.all(10),
      //height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width*0.86,
      child: SearchableDropdown.single(
        displayClearIcon: false,
        hint: Text('Select documenttype'),
        // label: Text('',style: TextStyle(
        //     fontSize: 16,fontWeight: FontWeight.bold,
        //     color: Colors.black
        // ),),
        items: data.map((item) {
          return DropdownMenuItem<ExternalDocumentTypesList>(
              child: Text(
                item.externalDocumentTypeName??"",
                overflow: TextOverflow.ellipsis,
              ),
              value:item
          );
        }).toList(),
        isExpanded: true,
        value: externalDocumentTypesList,
        searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
        onChanged: (value){
          //print(value);
          setState(() {
            externalDocumentTypesList = value;
             _currentSelectedValue = value;
             widget.onTapOfDocument(value);
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
// class DocumentDropDown extends StatefulWidget {
//   @override
//   _DocumentState createState() => _DocumentState();
// }
//
// class _DocumentState extends State<DocumentDropDown> {
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
