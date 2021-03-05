import 'package:YOURDRS_FlutterAPP/common/app_constants.dart';
class AppStrings {
  static const welcome = 'Welcome';
  static const signIn = "Signin";
  static const tryAgain = "tryAgain";
  static const notNow = "notNow";
  ///----------------------------------------added by team3
  static const date = "02-12-2021";
  static const pc_md = "PC_MD";
  static const kdhsjjkc = "Kdhhjvvk, kdhskfhk";
  static const male_28 = "(Male,28)";
  static const dictationpending = "Dictation Pending";
  static const  startfile = "is Start File";
  static const  defaultimage = "assets/images/defaultUser.jpg";
  static const  title = "Deirdre Ella";
  static const  externalattachment = "External Attachment";
  static const  submitnew = "Submit New";
  static const  allattachment = "All Attachment";
  static const  practice = "Practice";
  static const  locations = "Location";
  static const  provider = "Provider";
  static const  firstname = "First Name";
  static const  lastname = "Last Name";
  static const  hint_fisrtname = "Enter Name";
  static const  hint_lastname = "Enter Name";
  static const  dateofbirth = "Date of Birth";
  static const  hint_dateofbirth = "MM / DD / YYYY";
  static const  documenttype = "Document Type*";
  static const  emergency_descrption = "Is emergency add on description";
  static const  yes_buttontext = "yes";
  static const no_buttontext = "No";
  static const description = "Description";
  static const addimage_text = "Add image / take picture";
  static const cancel = "Cancel";
  static const submit = "Submit";
  static const validatorfield="Please enter value";

}
class ApiUrlConstants {
  // for getting Locations//
  static const getLocation =
      AppConstants.dioBaseUrl + "api/Schedule/GetMemberLocations";
  // for getting Provider
  static const getProviders =
      AppConstants.dioBaseUrl + "api/Schedule/GetAssociatedProvider";
  //for getting Schedules
  static const getSchedules =
      AppConstants.dioBaseUrl + "api/Schedule/GetSchedules";
}
