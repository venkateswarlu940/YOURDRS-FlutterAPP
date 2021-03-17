import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:YOURDRS_FlutterAPP/common/app_colors.dart';
class DateOfBirth extends StatefulWidget {
   final dobSelect;
  DateOfBirth({@required this.dobSelect});
  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  String _birthDate = 'MM / DD /YYYY';

  Future<void> _selectDate(BuildContext ctxdob) async {
    final DateTime d = await showDatePicker(
      context: ctxdob,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (d != null)
      setState(() {
        final DateFormat formatter = DateFormat(AppStrings.dateFormat);
        _birthDate = formatter.format(d);
        widget.dobSelect(_birthDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 1.0, color: CustomizedColors.bordersColor),
              left: BorderSide(
                  width: 1.0, color: CustomizedColors.bordersColor),
              right: BorderSide(
                  width: 1.0, color: CustomizedColors.bordersColor),
              bottom: BorderSide(
                  width: 1.0, color: CustomizedColors.bordersColor),
            ),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Text(
                _birthDate,
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
              onTap: (){
                _selectDate(context);

              },
            ),
            IconButton(
              icon: Icon(
                Icons.calendar_today_sharp,
                color: CustomizedColors.dateiconColor,
              ),
              onPressed: (){
                _selectDate(context);
              },
            ),
          ],
        ),
      );
  }
}
