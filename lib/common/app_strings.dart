import 'package:YOURDRS_FlutterAPP/common/app_constants.dart';

class AppStrings {
  static const welcome = 'Welcome';
  static const signIn = "Signin";
  static const tryAgain = "tryAgain";
  static const notNow = "notNow";

  //Patient Dictation Screen
  static const saveforlater= "save for later";
  static const dict= "Upload this dictation for transcription?";
  static const cancel = "Cancel";
  static const upload = "Upload";
  static const startfile = "start file";
  static const dicttype = "Select dectation type";
  static const camera = "camera";
  static const photolib = "photo library";
  static const dictationtype= "Dictation type";
  static const isStatFile = "Is Stat File";
  static const superBill = "Super Bill";
  static const allDictation = "All Dictations";
  static const allImages = "All Images";
  static const patient_dob = "04-09-1995";
  static const pc_md = "PC_MD";
  static const patientFName = "abcdef";
  static const patientLName = "nnnnn";
  static const male_28 = "(Male,28)";
  static const dictationPending = "Dictation Pending";
  static const  defaultImage = "https://icon-library.com/images/person-image-icon/person-image-icon-6.jpg";
  static const  title = "Deirdre Ella";
  static const dateOfbirth="Date of Birth";
  static const caseNo="Case No";
  static const PC_MD="PC-MDS";
  static const dob="05-07-1996";
  static const caseId="Y3BGCT9812-2";
  static const status="Checked Out";
  static const submitImages="Submit Images";
  static const customPath = "/audio_recorder_";
  static const permissionMsg = "You must accept permissions";

  //External attachment screen data
  static const date = "02-12-2021";
  static const kdhsjjkc = "Kdhhjvvk, kdhskfhk";
  static const dictationpending = "Dictation Pending";
  static const  defaultimage = "assets/images/defaultUser.jpg";
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
  static const dateFormat = "yMd";//changes
  static const  documenttype = "Document Type*";
  static const  emergency_descrption = "Is emergency add on description";
  static const  yes_buttontext = "yes";
  static const no_buttontext = "No";
  static const description = "Description";
  static const addimage_text = "Add image / take picture";
  static const firstname_validator="Please enter value";
  static const lastname_validator="Please enter value";
  static const description_validator="Please enter value";
  static const submit_buttontext="submit";
  static const submiting_datatext="Submitting Data";
  static const select_documenttype="Select";
  static const selectpractice_text="select";
  static const currentdate_text="yyyyMMddHHmmss";
  static const folderName = "YourDrsImages";//changes
  static const name = "DefaultFName,DefaultLName ";//changes
  static const imageFormat = ".jpeg";//changes

  //Dictations
  static const textDictation = "Dictations";
  static const textMyDictation = "My Previous Dictations";
  static const textAllDictation = "All Previous Dictations";
  static const textUploaded = "Uploaded";

  //Database table
  static const databaseName =  'ydrslocaldb';
  static const dbTableDictation = "dictationlocal";
  static const dbTableExternalAttachment = 'externalattachmentlocal';
  static const dbTablePhotoList = 'photolistlocal';

//  Patient dictation and Manual dictation columns
  static const colId = 'id';
  // static const col_AudioFile = 'col_audioFile';
  static const col_dictationId = 'dictationid';
  static const col_AudioFileName = 'fileName';
  static const col_PatientFname = 'patientfirstname';
  static const col_PatientLname = 'patientlastname';
  static const col_CreatedDate = 'createddate';
  static const col_Patient_DOB = 'patientdob';
  static const col_DictationTypeId = 'dictationtypeid';
  static const col_EpisodeId = 'episodeid';
  static const col_AppointmentId = 'appointmentid';
  static const col_AttachmentName = 'attachmentname';
  static const col_attachmentSizeBytes = 'attachmentsizebytes';
  static const col_attachmentType = 'attachmenttype';
  static const col_MemberId = 'memberid';
  static const col_StatusId = 'statusid';
  static const col_UploadedToServer = 'uploadedtoserver';
  static const col_DisplayFileName = 'displayfilename';
  static const col_PhysicalFileName = 'physicalfilename';
  static const col_DOS = 'dos';
  static const col_PracticeId = 'practiceid';
  static const col_PracticeName = 'practicename';
  static const col_LocationId = 'locationid';
  static const col_LocationName = 'locationname';
  static const col_ProviderId = 'providerid';
  static const col_ProviderName = 'providername';
  static const col_AppointmentTypeId = 'appointmenttypeid';
  static const col_PhotoNameList = 'photoNameList';
  static const col_isEmergencyAddOn = 'isemergencyaddon';
  static const col_ExternalDocumentTypeId = 'externaldocumenttypeid';
  static const col_Description = 'description';
  static const col_AppointmentProvider = 'appointmentprovider';
  static const col_isSelected = 'isselected';

  //External attachment columns
  static const col_External_Id = 'id';
  static const col_ExternalAttachmentId = 'externalAttachmentId';
  static const col_ExternalPatientFname = 'patientFirstName';
  static const col_ExternalPatientLname = 'patientLastName';
  static const col_ExternalCreatedDate = 'createdDate';
  static const col_ExternalPatient_DOB = 'patientDOB';
  static const col_ExternalAppointmentType = 'appointmentType';
  static const col_ExternalMemberId = 'memberId';
  static const col_ExternalStatusId = 'statusId';
  static const col_ExternalUploadedToServer = 'uploadedToServer';
  static const col_ExternalDisplayFileName = 'displayFileName';
  static const col_ExternalDOS = 'DOS';
  static const col_ExternalFileName = 'fileName';
  static const col_ExternalPracticeId = 'practiceId';
  static const col_ExternalPracticeName = 'practiceName';
  static const col_ExternalLocationId = 'locationId';
  static const col_ExternalLocationName = 'locationName';
  static const col_ExternalProviderId = 'providerId';
  static const col_ExternalProviderName = 'providerName ';
  static const col_ExternalAppointmentTypeId = 'appointmentTypeId';
  static const col_ExternalDocumentType = 'externaldocumenttype';
  static const col_ExternalisEmergencyAddOn = 'isEmergencyAddOn';
  static const col_Ex_ExternalDocumentTypeId = 'externalDocumentTypeId';
  static const col_ExternalDes= 'description';


  //photo list table columns
  static const col_PhotoList_Id = 'id';
  static const col_PhotoListDictationId = 'dictationlocalid';
  static const col_PhotoListExternalAttachmentId= 'externalattachmentlocalid';
  static const col_PhotoListAttachmentName = 'attachmentname';
  static const col_PhotoListAttachmentSizeBytes = 'attachmentsizebytes';
  static const col_PhotoListAttachmentAttachmentType = 'attachmenttype';
  static const col_PhotoListAttachmentFileName = 'fileName';
  static const col_PhotoListAttachmentPhysicalFileName = 'physicalfilename';
  static const col_PhotoListAttachmentCreatedDate = 'createddate';


  //Queries
  static const deleteOlderFiles = "DELETE FROM Audio_Table WHERE date(createdDate) < date('now')";
  static const selectQuery = 'SELECT * FROM externalattachmentlocal';

  // static const deleteFiles = "DELETE Audio_Table.id, Audio_Table.createddate,"
  //     "date(Audio_Table.createddate) dt, date('now') FROM 'Audio_Table' where date(Audio_Table.createddate) < date('now')";


  //Table for Patient Dictation and Manual Dictation
  static const tableDictation = 'CREATE TABLE dictationlocal('
      'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'dictationid INT,'
  // 'col_audioFile BLOB,'
      'fileName TEXT DEFAULT NULL,'
      'patientfirstname TEXT DEFAULT NULL,'
      'patientlastname TEXT DEFAULT NULL,'
      'patientdob TEXT DEFAULT NULL,'
      'dictationtypeid INT DEFAULT NULL,'
      'createddate DATETIME DEFAULT CURRENT_TIMESTAMP,'
      'episodeid INT DEFAULT NULL,'
      'appointmentid INT DEFAULT NULL,'
      'attachmentname TEXT DEFAULT NULL,'
      'attachmentsizebytes INT DEFAULT NULL,'
      'attachmenttype TEXT DEFAULT NULL,'
      'memberid INT DEFAULT NULL,'
      'statusid INT DEFAULT NULL,'
      'uploadedtoserver NUMERIC DEFAULT 0,'
      'displayfilename TEXT DEFAULT NULL,'
      'physicalfilename TEXT DEFAULT NULL,'
      'dos DATETIME DEFAULT NULL,'
      'practiceid INT DEFAULT NULL,'
      'practicename TEXT DEFAULT NULL,'
      'locationid INT DEFAULT NULL,'
      'locationname TEXT DEFAULT NULL,'
      'providerid INT DEFAULT NULL,'
      'providername TEXT DEFAULT NULL,'
      'appointmenttypeid INT DEFAULT NULL,'
      'photoNameList DEFAULT NULL,'
      'isemergencyaddon NUMERIC DEFAULT 0,'
      'externaldocumenttypeid INT DEFAULT NULL,'
      'description TEXT DEFAULT NULL,'
      'appointmentprovider TEXT DEFAULT NULL,'
      'isselected NUMERIC DEFAULT 0'
      ')';

  //Table for External Dictation
  static const tableExternalAttachment = 'CREATE TABLE externalattachmentlocal ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
      'externalattachmentid INT DEFAULT NULL,'
      'filename TEXT DEFAULT NULL,'
      'patientfirstname TEXT DEFAULT NULL,'
      'patientlastname TEXT DEFAULT NULL,'
      'patientdob TEXT DEFAULT NULL,'//changing
      'memberid INT DEFAULT NULL,'
      'statusid INT DEFAULT NULL,'
      'uploadedtoserver NUMERIC DEFAULT 0,'
      'createddate DATETIME DEFAULT CURRENT_TIMESTAMP,'
      'displayfilename TEXT DEFAULT NULL,'
      'dos DATETIME DEFAULT NULL,'
      'practiceid INT DEFAULT NULL,'
      'practicename TEXT DEFAULT NULL,'
      'locationid INT DEFAULT NULL,'
      'locationname TEXT DEFAULT NULL,'
      'providerid INT DEFAULT NULL,'
      'providername TEXT DEFAULT NULL,'
      'appointmenttypeid INT DEFAULT NULL,'
      'appointmenttype TEXT DEFAULT NULL,'
      'col_photoNameList,'
      'externaldocumenttype TEXT DEFAULT NULL,'
      'isemergencyaddon NUMERIC DEFAULT 0,'
      'externaldocumenttypeid INTEGER DEFAULT NULL,'
      'description TEXT DEFAULT NULL'
      ')';

  static const tblPhotoList = 'CREATE TABLE photolistlocal ('
      'id INTEGER PRIMARY KEY,'
      'dictationlocalid INTEGER DEFAULT NULL,'
      'externalattachmentlocalid INTEGER DEFAULT NULL,'
      'attachmentname TEXT DEFAULT NULL,'
      'attachmentsizebytes INTEGER DEFAULT NULL,'
      'attachmenttype TEXT DEFAULT NULL,'
      'fileName TEXT DEFAULT NULL,'
      'physicalfilename TEXT DEFAULT NULL,'
      'createddate DATETIME DEFAULT NULL'
      ')';


  //Dictation type list
  static const dictationTypeList = [
    "MR",
    "NBR",
    "OPR",
  ];
}

class ApiUrlConstants {

  static const getAllPreviousDictations = AppConstants.dioBaseUrl +
      'api/Dictation/GetPreviousDictations';
  // for getting  Practices
  static const getPractices=
      AppConstants.dioBaseUrl +"api/MasterData/GetLoggedInMemberPractices";

  // for getting ExternalLocation
  static const getExternalLocation=
      AppConstants.dioBaseUrl +"api/MasterData/GetLocationsForSelectedPractices";
  // for getting ExternalProvider
  static const getExternalProvider=
      AppConstants.dioBaseUrl +"api/MasterData/GetProvidersForSelectedPracticeLocation";
  //for getting documentType//
  static const getdocumenttype =
      AppConstants.dioBaseUrl + "api/MasterData/GetExternalDocumentTypes";
}

