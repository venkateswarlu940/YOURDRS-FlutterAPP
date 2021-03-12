import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/data/models/external_provider_model.dart';
import 'package:YOURDRS_FlutterAPP/data/services/appointment_service.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
 class ExternalProviderDropDown extends StatefulWidget {
   final int PracticeLocationId;
   final onTapOfProvider;
   const ExternalProviderDropDown({@required this.onTapOfProvider ,@required this.PracticeLocationId});
   @override
   _ExternalProviderDropDownState createState() =>  _ExternalProviderDropDownState();
 }

 class  _ExternalProviderDropDownState extends State<ExternalProviderDropDown> {
  var _currentSelectedValue;
  bool asTabs = false;
  Services apiServices = Services();
  ProviderList providerList;
  //List<LocationList> _list=[];
  List data = List();
  int locationId;

  void initState() {
    super.initState();
    _currentSelectedValue = widget.PracticeLocationId;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    //print('didChangeDependencies PracticeLocationId ${widget.PracticeLocationId}');
    // ExternalProvider externalProvider = await apiServices.getExternalProvider();
    // data = externalProvider.providerList;

//_currentSelectedValue=data;
//     setState(() {});
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
    if (locationId == null ||
        (widget.PracticeLocationId != null &&
            locationId != widget.PracticeLocationId)) {
      locationId = widget.PracticeLocationId;
      apiServices.getExternalProvider(locationId).then((value) {
        data=value.providerList;
        setState(() {

        });
        // if(value!=null){
        //   setState(() {
        //     data = value.providerList;
        //   });
        // }
      });
    }
    //print('build PracticeLocationId ${widget.PracticeLocationId}');
    return Container(
      //height: 55,
      //color: Colors.yellow,
      //height: MediaQuery.of(context).size.height * 0.07,
      //alignment: Alignment.center,
      //padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.86,
      child: SearchableDropdown.single(
        displayClearIcon: false,
        //hint: Text('Select'),
        // label: Text('Location',style: TextStyle(
        //     fontSize: 16,fontWeight: FontWeight.bold,
        //     color: Colors.black
        // ),),
        items: data.map((item) {
          return DropdownMenuItem<ProviderList>(
              child: Text(
                item.displayname??"",
                overflow: TextOverflow.ellipsis,
              ),
              value:item
          );
        }).toList(),
        isExpanded: true,
        value: providerList,
        //searchHint: new Text('Select ', style: new TextStyle(fontSize: 20)),
        onChanged: (value){
          setState(() {
           _currentSelectedValue = value;
            widget.onTapOfProvider(value);
            // providerList=value;
            // print('practiceList $providerList');
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


