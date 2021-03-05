import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/widget/buttons/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:YOURDRS_FlutterAPP/network/models/provider.dart';

import 'package:YOURDRS_FlutterAPP/network/services/appointment_service.dart';

class ProviderDropDowns extends StatefulWidget {
  final onTapOfProvider;
  final String selectedProviderId;
  ProviderDropDowns({@required this. onTapOfProvider, this.selectedProviderId});
  @override
  _ProviderState createState() =>  _ProviderState();
}

class  _ProviderState extends State<ProviderDropDowns> {
  var _currentSelectedValue;
 final String url = "https://jsonplaceholder.typicode.com/users";

  List data = List(); //edited line
  // List<LocationList> data = List();
  Services apiServices = Services();


  @override
  void initState() {
    super.initState();
    _currentSelectedValue = widget.selectedProviderId;
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider provider = await apiServices.getProviders();
    data = provider.providerList;
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
                        hint: "Provider",
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            widget.onTapOfProvider(newValue);
                            state.didChange(newValue);
                           // print(_currentSelectedValue);
                          });
                        },
                        items: data.map((item) {
                          return DropdownMenuItem<String>(
                            child: new Text(item.displayname),
                            value: item.providerId.toString(),
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
// class Provider extends StatefulWidget {
//   @override
//   _ProviderState createState() => _ProviderState();
// }
// class _ProviderState extends State<Provider> {
//   var _currentSelectedValue3;
//   var _currencies3 = [
//     "provider1",
//     "provider2",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       //color: Colors.yellow,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 280,top: 20),
//             child:Text(
//               AppStrings.provider,
//               style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
//                 color: CustomizedColors.practice_textColor,
//               ),
//             ),
//           ),
//           Padding(
//             padding:const EdgeInsets.only(top: 15),
//             child:   Container(
//                 height: 59,
//                 width: 350,
//                 child:
//                 FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
//                       isEmpty: _currentSelectedValue3 == '',
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           hint: Text("select"),
//                           value: _currentSelectedValue3,
//                           isDense: true,
//                           onChanged: (String newValue) {
//                             setState(() {
//                               _currentSelectedValue3 = newValue;
//                               state.didChange(newValue);
//                             });
//                           },
//                           items: _currencies3.map((String value) {
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
