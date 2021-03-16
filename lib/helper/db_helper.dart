import 'dart:io';
import 'package:YOURDRS_FlutterAPP/common/app_strings.dart';
import 'package:YOURDRS_FlutterAPP/data/models/extrenal_databse_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database _database;
  static final DatabaseHelper db = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the User table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, AppStrings.databaseName);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(AppStrings.tableDictation
          );

          await db.execute(AppStrings.tableExternalAttachment
          );
        });
  }

  // Insert Audio and Manual dictation
  // insertAudio(Dictation newAudio) async {
  //   // await deleteAllAudios();
  //
  //   var db = await database;
  //
  //   //Exception handling
  //   try {
  //     var res = await db.insert(AppStrings.dbTableDictation, {
  //       AppStrings.colId: newAudio.id,
  //       // AppStrings.col_AudioFile :newAudio.audioFile,
  //       AppStrings.col_dictationId: newAudio.dictationId,
  //       AppStrings.col_AudioFileName: newAudio.fileName,
  //       AppStrings.col_PatientFname: newAudio.patientFirstName,
  //       AppStrings.col_PatientLname: newAudio.patientLastName,
  //       AppStrings.col_CreatedDate: newAudio.createdDate,
  //       AppStrings.col_Patient_DOB: newAudio.patientDOB,
  //       AppStrings.col_DictationTypeId: newAudio.dictationTypeId,
  //       AppStrings.col_EpisodeId: newAudio.episodeId,
  //       AppStrings.col_attachmentSizeBytes: newAudio.attachmentSizeBytes,
  //       AppStrings.col_attachmentType: newAudio.attachmentType,
  //       AppStrings.col_MemberId: newAudio.memberId,
  //       AppStrings.col_StatusId: newAudio.statusId,
  //       AppStrings.col_UploadedToServer: newAudio.uploadedToServer,
  //       AppStrings.col_DisplayFileName: newAudio.displayFileName,
  //       AppStrings.col_PhysicalFileName: newAudio.physicalFileName,
  //       AppStrings.col_DOS: newAudio.dos,
  //       AppStrings.col_PracticeId: newAudio.practiceId,
  //       AppStrings.col_PracticeName:newAudio.practiceName,
  //       AppStrings.col_LocationId: newAudio.locationId,
  //       AppStrings.col_LocationName:newAudio.locationName,
  //       AppStrings.col_ProviderId: newAudio.providerId,
  //       AppStrings.col_ProviderName:newAudio.providerName,
  //       AppStrings.col_AppointmentTypeId: newAudio.appointmentTypeId,
  //       AppStrings.col_AppointmentId:newAudio.appointmentId,
  //       AppStrings.col_isEmergencyAddOn: newAudio.isEmergencyAddOn,
  //       AppStrings.col_ExternalDocumentTypeId: newAudio.externalDocumentTypeId,
  //       AppStrings.col_Description: newAudio.description,
  //       AppStrings.col_AppointmentProvider: newAudio.appointmentProvider,
  //       AppStrings.col_isSelected: newAudio.isSelected,
  //
  //     });
  //     print("insertAudio $res");
  //     return res;
  //   }
  //   catch (e) {
  //     print(e.toString());
  //   }
  // }

  // Insert External Dictation
  insertExternalAttachmentData(ExternalAttachment eDict) async {
    var db = await database;

    //Exception handling
    try {
      var externalDict = await db.insert(AppStrings.dbTableExternalAttachment, {
        AppStrings.col_External_Id: eDict.id,
        AppStrings.col_ExternalAttachmentId:eDict.externalattachmentid,
        AppStrings.col_ExternalPatientFname: eDict.patientfirstname,
        AppStrings.col_ExternalPatientLname: eDict.patientlastname,
        AppStrings.col_ExternalCreatedDate: eDict.createddate,
        AppStrings.col_ExternalPatient_DOB: eDict.patientdob,
        AppStrings.col_ExternalMemberId: eDict.memberid,
        AppStrings.col_ExternalStatusId: eDict.statusid,
        AppStrings.col_ExternalUploadedToServer: eDict.uploadedtoserver,
        AppStrings.col_ExternalDisplayFileName: eDict.displayfilename,
        AppStrings.col_ExternalDOS: eDict.dos,
        AppStrings.col_ExternalPracticeId: eDict.practiceid,
        AppStrings.col_ExternalPracticeName:eDict.practicename,
        AppStrings.col_ExternalLocationId: eDict.locationid,
        AppStrings.col_ExternalLocationName:eDict.locationname,
        AppStrings.col_ExternalProviderId:eDict.providerid,
        AppStrings.col_ExternalProviderName:eDict.providername,
        AppStrings.col_ExternalAppointmentTypeId: eDict.appointmenttypeid,
        AppStrings.col_ExternalAppointmentType:eDict.appointmenttype,
        AppStrings.col_ExternalisEmergencyAddOn: eDict.isemergencyaddon,
        AppStrings.col_ExternalDocumentType:eDict.externaldocumenttype,//changing
        AppStrings.col_Ex_ExternalDocumentTypeId: eDict.externaldocumenttypeid,
        AppStrings.col_ExternalDes: eDict.description
      });
      // print("insertAudio $externalDict");
      return externalDict;
    }
    catch (e) {
      print(e.toString());
    }
  }

  //insert photo list
  // insertPhotoList(PhotoList photoList) async {
  //   var db = await database;
  //
  //   //exception handling
  //   try{
  //     var externalPhoroList = await db.insert(AppStrings.dbTablePhotoList, {
  //       AppStrings.col_PhotoList_Id:photoList.id,
  //       AppStrings.col_PhotoListDictationId:photoList.dictationLocalId,
  //       AppStrings.col_PhotoListExternalAttachmentId:photoList.externalattachmentlocalid,
  //       AppStrings.col_PhotoListAttachmentName:photoList.attachmentname,
  //       AppStrings.col_PhotoListAttachmentSizeBytes:photoList.attachmentsizebytes,
  //       AppStrings.col_PhotoListAttachmentAttachmentType:photoList.attachmenttype,
  //       AppStrings.col_PhotoListAttachmentFileName:photoList.fileName,
  //       AppStrings.col_PhotoListAttachmentPhysicalFileName:photoList.physicalfilename,
  //       AppStrings.col_PhotoListAttachmentCreatedDate:photoList.createddate
  //     });
  //     return externalPhoroList;
  //
  //   }catch (e){
  //     print(e.toString());
  //   }
  // }

  // deleteAllAudios() async {
  //   var db = await database;
  //   // DateTime now = new DateTime.now();
  //   // var res = await db.rawDelete("DELETE FROM dictationlocal WHERE createdDate < date('now')");
  //   var res = await db.rawDelete("DELETE FROM dictationlocal WHERE createdDate <= date('now','-90 day')");
  //   print("Audios Deleteddddddddddddddddddd $res");
  //   return res;
  // }


  // Delete all Audios files
  // deleteAllAudios() async {
  //   var db = await database;
  //   var res = await db.rawDelete(AppStrings.deleteOlderFiles);
  //   print("Records deleted: $res");
  //   return res;
  // }

  // deleteAllAudios({int minutes = 5}) async {
  //   var db = await database;
  //   // DateTime now = new DateTime.now();
  //   var res = await db.rawDelete("DELETE FROM Audio_Table WHERE date(createdDate) < datetime('now', '-${minutes} minutes')");
  //   print("the datetime response issssssssss $res");
  //   return res;
  // }


  // //Update the records
  // Future<int> updateRecords() async {
  //   final db = await database;
  //   final updateRes = await db.rawUpdate("UPDATE dictationlocal WHERE 'id=?', whereArgs: [dictationlocal.id]");
  //   print(updateRes);
  //   return updateRes;
  // }

  //Fetch all the records
  Future<List<ExternalAttachment>> getAllExtrenalAttachmentList() async {
    var db = await database;
   // final res=await db.rawQuery("SELECT externalattachmentlocal.id,externalattachmentlocal.displayFileName");
     //final res = await db.rawQuery("SELECT * FROM ");
    //await dbClient.rawQuery("SELECT * FROM $TABLE");

    //Exception handling
    try {
      var res = await db.rawQuery(AppStrings.selectQuery);

      // print('data is saving $res');

      List<ExternalAttachment> list = res.isNotEmpty
          ? res.map((c) {
              print('res.map $c');
              var user = ExternalAttachment.fromMap(c);
              return user;
            }).toList()
          : [];

      // print(list);
      return list;
    } catch (e) {
      print(e.toString());
    }
  }
//close the db
 //db.close();
}
