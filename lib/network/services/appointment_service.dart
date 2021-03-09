import 'dart:convert';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/network/models/document.dart';
import 'package:YOURDRS_FlutterAPP/network/models/practice.dart';
import 'package:http/http.dart' as http;
import 'package:YOURDRS_FlutterAPP/network/models/location.dart';
import 'package:YOURDRS_FlutterAPP/network/models/provider.dart';


class Services {

  //static const String url = 'https://jsonplaceholder.typicode.com/users';

//getUsers service method
//   static Future<List<Patient>> getUsers() async {
//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<Patient> list = parseUsers(response.body);
//         return list;
//       } else {
//         throw Exception("Error");
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }

  // static List<Patient> parseUsers(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<Patient>((json) => Patient.fromJson(json)).toList();
  // }

  ///------------getPractice service method

  Future<Practices> getPratices() async {
    try {
      var endpointUrl = ApiUrlConstants.getPractices;
      Map<String, String> queryParams = {
        'LoggedInMemberId': '1',
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        Practices practice= parsePractices(response.body);
       // print(data);
        return practice;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Practices parsePractices(String responseBody) {
    final Practices practice = Practices.fromJson(json.decode(responseBody));
    return practice;
  }
  ///-------------ExternalLocation service method
  Future<ExternalLocation> getExternalLocation() async {
    try {
      var endpointUrl = ApiUrlConstants.getExternalLocation;
      Map<String, String> queryParams = {
        'LoggedInMemberId': '1',
      };
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl + '?' + queryString;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        ExternalLocation externalLocation= parseExternalLocation(response.body);
        // print(data);
        return externalLocation;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static ExternalLocation parseExternalLocation(String responseBody) {
    final ExternalLocation externalLocation = ExternalLocation.fromJson(json.decode(responseBody));
    return externalLocation;
  }
///---------DocumentType service file method
  Future<Documenttype> getDocumenttype() async {
    try {
      var endpointUrl = ApiUrlConstants.getdocumenttype;
      // Map<String, String> queryParams = {
      //   'LoggedInMemberId': '1','PracticeIdList': '1',
      // };
      //String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = endpointUrl;
      final response = await http.get(Uri.encodeFull(requestUrl),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        Documenttype document = parseDocumentype(response.body);
        // print(data);
        return document;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Documenttype parseDocumentype(String responseBody) {
    final Documenttype document = Documenttype.fromJson(json.decode(responseBody));
    return document;
  }
  }

  // postApiMethod() async {
  //   String apiUrl = ApiUrlConstants.getSchedules;
  //
  //   final json = {
  //     "memberId": 1,
  //     "appointmentStartDate": "2021-03-02T10:53:13.748Z",
  //     "appointmentEndDate": "2021-03-02T10:53:13.748Z",
  //     "locationId": 0,
  //     "patientSearchString": null,
  //     "dictationStatusId": 0,
  //     "providerId": 0,
  //     "page": 0
  //   };
  //
  //   http.Response response = await http.post(apiUrl, body: json);
  //
  //   var jsonResponse = jsonDecode(response.body);
  //   print(jsonResponse);
  // }
