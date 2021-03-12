import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_document_model.dart';
import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/data/services/appointment_service.dart';

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
        hint: Text(AppStrings.select_documenttype),
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

