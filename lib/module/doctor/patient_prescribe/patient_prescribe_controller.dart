import 'dart:convert';
import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/local_data/local_data.dart';
import 'package:kambaii_provider/core/utils/local_db_manager/hive_manager.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/all_diagnosis/all_diagnosis_name.dart';
import 'package:kambaii_provider/model/doctor/lab_report/lab_report_model.dart';
import 'package:kambaii_provider/model/doctor/lab_test/lab_test_names.dart';
import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';
import 'package:kambaii_provider/model/doctor/medicine/medicine_add.dart';
import 'package:kambaii_provider/model/doctor/medicine/medicine_list_user.dart';
import 'package:kambaii_provider/model/doctor/patient_info/patient_prescription_info.dart';
import 'package:kambaii_provider/model/doctor/prescription_model/prescription_model.dart';
import 'package:kambaii_provider/model/doctor/visit_id/visit_id_result.dart';
import 'package:kambaii_provider/model/patient_visit_summary/patient_all_visit_summary_model.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/show_prescription_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../model/doctor/lab/lab_element.dart';
import '../../../model/doctor/local_prescription_data/local_prescription_data.dart';
import '../../../model/doctor/medicine/medicine_result.dart';

class PatientPrescribeController extends GetxController with GetSingleTickerProviderStateMixin{
  var arguments = Get.arguments;
  bool loading = false;
  late TabController tabController;
  LocalData localData = Get.find();
  DoctorProfile doctorProfile = Get.find();
  int currentTab = 0;
  PatientsInfo patientsInfo = PatientsInfo();
  VitalInfo vitalInfo = VitalInfo();
  List<VisitSummary> visitSummary = [];
  ExpandableController writePatientComplaintsExpandableController = ExpandableController(initialExpanded: true);
  ExpandableController presentingChiefsComplaintsExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController patientDentalHealthExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController patientMedicalHistoryExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController patientRecentHealthDataExpandableController = ExpandableController(initialExpanded: true);
  ExpandableController patientPreviousLabReportExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController patientPreviousPrescriptionExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController patientRecentPcpSummaryExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController patientRecentPcpSummaryExpandableController2 = ExpandableController(initialExpanded: false); //developed by hanif
  ExpandableController addViewPatientOrderExpandableController = ExpandableController(initialExpanded: true);
  ExpandableController patientProvisionalExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController reviewMedicineTakenExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController patientRegularMedicinePatternExpandableController = ExpandableController(initialExpanded: false);

  ExpandableController giveMedicineForPatientRxExpandableController = ExpandableController(initialExpanded: false);
  ExpandableController giveAdviceToPatientExpandableController = ExpandableController(initialExpanded: true);
  TextEditingController writePatientComplaintsController = TextEditingController();
  //WebViewController webViewController = WebViewController();
  List<AddLabTest> labtests = [];
  List<AddLabTest> newLabTests = [];
  List<Diagnosis> diagnosis = [];
  List<Diagnosis> newDiagnosis = [];
  
  List<MedicineInfo> medicines = [];
  String writePatientComplaint = "";
  //////////////////medicine/////////////////
  TextEditingController medicineNameTradeController = TextEditingController();
  TextEditingController medicineNameGenericController = TextEditingController();
  TextEditingController typeOfMedicineController = TextEditingController();
  TextEditingController medicineStrengthController = TextEditingController();
  TextEditingController reason = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController numofdaystotakemedicineController = TextEditingController();
  TextEditingController howMuchTotakemedicineController = TextEditingController();

  TextEditingController howmuchtotakecontroller = TextEditingController();
  TextEditingController giveAdviceToPatientController = TextEditingController();
  MedicineInfo? selectedMedicine;
  List<String> indications = [];
  List<MedicineAdded> regularMedicinesAdded = [];

  HiveManager hiveManager = HiveManager();

  List<String> medicineIntakeFood = [
    "Before Meal".tr,
    "After Meal".tr
  ];
  int medicineIntakeIndex = 0;
  List<String> medicineIntakeTime = [
    "Morning".tr,
    "Afternoon".tr,
    "Night".tr
  ];
  List<int> medicineIntakeTimeIndex = [];
  bool continued = false;

  List<MedicineAdded> allTheNewMedicine = [];

  addAllTheNewMedicine(){
    allTheNewMedicine = [];
    regularMedicinesAdded.forEach((element) {
      if(element.continued){
        allTheNewMedicine.add(element);
      }
    });
    allTheNewMedicine.addAll(regularMedicinesAddedRx);
    update();
  }

  regularMedicineAdd()async{

    var lst = medicineIntakeTimeIndex;
    MedicineAdded medicineAdded = MedicineAdded(medicineInfo: selectedMedicine, medicineIntakeMeal: medicineIntakeIndex, medicineTakeTime: lst, reason: reason.text.trim(), remarks: remarks.text.trim(), morning: medicineIntakeTimeIndex.contains(0), noon: medicineIntakeTimeIndex.contains(1), night: medicineIntakeTimeIndex.contains(2), days: numofdaystotakemedicineController.text.isEmpty?"1":numofdaystotakemedicineController.text.trim(), amount: howMuchTotakemedicineController.text.isEmpty?"1":howMuchTotakemedicineController.text.trim(), continued: continued?true:false);

    regularMedicinesAdded.add(medicineAdded);
    update();
    clearRegulaMedicine();
    try{
     await hiveManager.addedMedicineOperation(patientsInfo, regularMedicinesAdded, "add", "regular");
    }catch(e){
      print(e);
    }

  }

  changeContinued(){
    continued=!continued;
    update();
  }

  clearRegulaMedicine(){
    selectedMedicine = null;
    //medicineIntakeTimeIndex.clear();
    medicineIntakeIndex = 0;
    reason.clear();
    remarks.clear();
    typeOfMedicineController.clear();
    medicineNameTradeController.clear();
    medicineNameGenericController.clear();
    medicineStrengthController.clear();
    numofdaystotakemedicineController.clear();
    howMuchTotakemedicineController.clear();
    continued = false;
    update();
  }

  void medicineIntakeTimeIndexUpdate(int index){
    if(medicineIntakeTimeIndex.contains(index)){
      medicineIntakeTimeIndex.remove(index);
    }else{
      medicineIntakeTimeIndex.add(index);
    }
    update();
  }

  void medicineIntakeFoodIndexUpdate(int index){
    medicineIntakeIndex = index;
    update();
  }

  updateSelectedMedicine(MedicineInfo medicineInfo){
    selectedMedicine = medicineInfo;
    medicineNameTradeController.text = selectedMedicine!.brandName!;
    medicineNameGenericController.text = selectedMedicine!.genericName!;
    typeOfMedicineController.text = selectedMedicine!.dosageDescription!;
    medicineStrengthController.text = selectedMedicine!.strength!;
    final indication = medicineInfo.indication;
    if(indication!=null){
      indications = indication.split(",");
    }
    update();
  }

  deleteRegularMedicine(int index)async{
    regularMedicinesAdded.removeAt(index);
    try{
      await hiveManager.addedMedicineOperation(patientsInfo, regularMedicinesAdded, "add", "regular");
    }catch(e){
      print(e);
    }
    update();
  }


  TextEditingController medicineNameTradeControllerRx = TextEditingController();
  TextEditingController medicineNameGenericControllerRx = TextEditingController();
  TextEditingController typeOfMedicineControllerRx = TextEditingController();
  TextEditingController medicineStrengthControllerRx = TextEditingController();
  TextEditingController reasonRx = TextEditingController();
  TextEditingController remarksRx = TextEditingController();
  TextEditingController numofdaystotakemedicineControllerRx = TextEditingController();
  TextEditingController howmuchtotakecontrollerRx = TextEditingController();
  TextEditingController giveAdviceToPatientControllerRx = TextEditingController();
  TextEditingController howMuchTotakemedicineRxController = TextEditingController();

  MedicineInfo? selectedMedicineRx;
  List<String> indicationsRx = [];
  List<MedicineAdded> regularMedicinesAddedRx = [];

  List<String> medicineIntakeFoodRx = [
    "Before Meal".tr,
    "After Meal".tr
  ];
  int medicineIntakeIndexRx = 0;
  List<String> medicineIntakeTimeRx = [
    "Morning".tr,
    "Afternoon".tr,
    "Night".tr
  ];
  List<int> medicineIntakeTimeIndexRx = [];

  regularMedicineAddRx()async{

    var lst = medicineIntakeTimeIndexRx;
    MedicineAdded medicineAdded = MedicineAdded(medicineInfo: selectedMedicineRx, medicineIntakeMeal: medicineIntakeIndexRx, medicineTakeTime: lst, reason: reasonRx.text.trim(), remarks: remarksRx.text.trim(), morning: medicineIntakeTimeIndexRx.contains(0), noon: medicineIntakeTimeIndexRx.contains(1), night: medicineIntakeTimeIndexRx.contains(2), days: numofdaystotakemedicineControllerRx.text.isEmpty?"1":numofdaystotakemedicineControllerRx.text.trim(),amount: howMuchTotakemedicineRxController.text.isEmpty?"1":howMuchTotakemedicineRxController.text.trim(), continued: true);
    regularMedicinesAddedRx.add(medicineAdded);
    update();
    clearRegulaMedicineRx();
    try{
      await hiveManager.addedMedicineOperation(patientsInfo, regularMedicinesAddedRx, "add", "rx");
    }catch(e){
      print(e);
    }


  }


  clearRegulaMedicineRx(){
    selectedMedicineRx = null;
    //medicineIntakeTimeIndex.clear();
    medicineIntakeIndexRx = 0;
    reasonRx.clear();
    remarksRx.clear();
    typeOfMedicineControllerRx.clear();
    medicineNameTradeControllerRx.clear();
    medicineNameGenericControllerRx.clear();
    medicineStrengthControllerRx.clear();
    numofdaystotakemedicineControllerRx.clear();
    howMuchTotakemedicineRxController.clear();
    update();
  }

  void medicineIntakeTimeIndexUpdateRx(int index){
    if(medicineIntakeTimeIndexRx.contains(index)){
      medicineIntakeTimeIndexRx.remove(index);
    }else{
      medicineIntakeTimeIndexRx.add(index);
    }
    update();
  }

  void medicineIntakeFoodIndexUpdateRx(int index){
    medicineIntakeIndexRx = index;
    update();
  }

  updateSelectedMedicineRx(MedicineInfo medicineInfo){
    selectedMedicineRx = medicineInfo;
    medicineNameTradeControllerRx.text = selectedMedicineRx!.brandName!;
    medicineNameGenericControllerRx.text = selectedMedicineRx!.genericName!;
    typeOfMedicineControllerRx.text = selectedMedicineRx!.dosageDescription!;
    medicineStrengthControllerRx.text = selectedMedicineRx!.strength!;
    final indication = medicineInfo.indication;
    if(indication!=null){
      indicationsRx = indication.split(",");
    }
    update();
  }

  deleteRegularMedicineRx(int index)async{
    regularMedicinesAddedRx.removeAt(index);
    update();
    try{
      await hiveManager.addedMedicineOperation(patientsInfo, regularMedicinesAddedRx, "add", "rx");
    }catch(e){
      print(e);
    }
  }


  updateLabTests(LabTest labtest){
    labtestnameController.text = labtest.testname!;
    update();
  }

  updateDiagnosis(String diagnosis){
    diagnosisnameController.text = diagnosis;
    update();
  }


  eraseWritePatientComplaints(){
    writePatientComplaintsController.clear();
    writePatientComplaint = "";
    update();
  }

  changeWritePatientComplaint(s){
    writePatientComplaint = s;
    update();
  }
  TextEditingController writeChiefComplaintsController = TextEditingController();
  String writeChiefComplaint = "";
  eraseChiefPatientComplaints(){
    writeChiefComplaintsController.clear();
    writeChiefComplaint = "";
    update();
  }
  changeChiefPatientComplaint(s){
    writeChiefComplaint = s;
    update();
  }

  TextEditingController patientDentalHealthController = TextEditingController();
  String patientDentalHealth = "";
  erasePatientDentalHealth(){
    patientDentalHealthController.clear();
    patientDentalHealth = "";
    update();
  }
  changePatientDentalHealth(s){
    patientDentalHealth = s;
    update();
  }
//doctors advice by hanif
TextEditingController giveAdvicetoPAtientController =TextEditingController();
 String giveAdvicetoPateint = "";
  eraseAdvicetoPatient(){
    giveAdviceToPatientController.clear();
    giveAdvicetoPateint = "";
    update();
  }
  changeAdvicetoPatient(s){
    giveAdvicetoPateint = s;
    update();
  }
//doctors advice by hanif end
  TextEditingController labtestnameController = TextEditingController();
  TextEditingController labtestreasonController = TextEditingController();


  addLabTest()async{

    newLabTests.add(AddLabTest(test_name: labtestnameController.text.trim(), reason: labtestreasonController.text.trim(), user_id: patientsInfo.patientId.toString(), visit_id: patientsInfo.visitId.toString(),specelist_id: doctorProfile.id.toString()));
    labtestnameController.clear();
    labtestreasonController.clear();

    try{
      await hiveManager.addedLabTestOperation(patientsInfo, newLabTests, 'add');
    }catch(e){
      print(e);
    }

    update();
  }
  deleteLabTest(int index)async{

    newLabTests.removeAt(index);
    try{
      await hiveManager.addedLabTestOperation(patientsInfo, newLabTests, 'add');
    }catch(e){
      print(e);
    }
    update();
  }
  TextEditingController diagnosisnameController = TextEditingController();
  TextEditingController diagnosisreasonController = TextEditingController();
  addDiagnosis() async{
    newDiagnosis.add(Diagnosis(provisinal_diagnosis: diagnosisnameController.text.trim(), provisinal_note: diagnosisreasonController.text.trim(), doctor_id: doctorProfile.id.toString(), visit_id: patientsInfo.visitId.toString(), patient_id: patientsInfo.patientId.toString()));
    diagnosisnameController.clear();
    diagnosisreasonController.clear();
    update();
    try{
      await hiveManager.addedDiagnosisOperation(patientsInfo, newDiagnosis, 'add');
    }catch(e){
      print(e);
    }
  }
  deleteDiagnosis(int index)async{
    newDiagnosis.removeAt(index);
    update();
    try{
      await hiveManager.addedDiagnosisOperation(patientsInfo, newDiagnosis, 'add');
    }catch(e){
      print(e);
    }
  }

  /*activateWebView(String url){
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))

      ..loadRequest(
          Uri.parse(url),

      );
  }*/
  _handleTab(){
    currentTab = tabController.index;
    update();
  }
  changeTabs(){
    if(currentTab!=4){
      currentTab+=1;
      tabController.index = currentTab;
      update();
    }
  }
  fetchPatientData()async{
    startLoading();
    Uri url = Uri.parse(Urls.baseUrl+Urls.patient_info_schedule);
    /*var response = await post(url,
        body: {
          'schedule_id': '${arguments['id']}'
        },
        headers: {
          //'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${localData.token}',
        });
    PatientPrescriptionProfileResult prs = PatientPrescriptionProfileResult.fromJson(jsonDecode(response.body));
*/

    try{
      var response = await post(url,
          body: {
        'schedule_id': '${arguments['id']}'
          },
          headers: {
        //'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${localData.token}',
      });
      if(response.statusCode==200){
        print(response.body);
        try{
          PatientPrescriptionProfileResult prs = PatientPrescriptionProfileResult.fromJson(jsonDecode(response.body));
          if(prs.data!.patientsInfo!=null){
            patientsInfo = prs.data!.patientsInfo!;
            await hiveManager.patientInfoOperation('${arguments['id']}',patientsInfo, 'add');
            //print("visit id ${patientsInfo.doctorId}");
          }
          if(prs.data!.visitSummery!=null){
            visitSummary = prs.data!.visitSummery!;
            await hiveManager.visitSummaryOperation(patientsInfo, visitSummary, 'add');
          }
          if(prs.data!.vitalInfo!=null){

            vitalInfo = prs.data!.vitalInfo!;
            await hiveManager.vitalInfoOperation(patientsInfo, vitalInfo, 'add');
          }
          update();
          stopLoading();
        }catch(e){
          print(e);
          stopLoading();
        }
        stopLoading();
      }else{
        stopLoading();
      }
    }catch(e){

      stopLoading();
      print(e);
    }
    try{
      patientsInfo = hiveManager.getPatientInfo('${arguments['id']}')!;
      print(patientsInfo.patientId);
    }catch(e){
      print(e);

    }
    try{
      visitSummary = hiveManager.getVisitSummary(patientsInfo)!;

    }catch(e){
      print(e);
    }
    try{
      vitalInfo = hiveManager.getVitalInfo(patientsInfo)!;
    }catch(e){

    }
    update();
  }
  void startLoading(){
    loading = true;
    update();
  }
  void stopLoading(){
    loading = false;
    update();
  }
  searchMedicine(String s)async{
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.searchMedicine}/$s");
    try{
      var response = await get(url,
          headers: {
            "Accept":"application/json",
            "Authorization": "Bearer ${localData.token}",
          }
      );
      if(response.statusCode==200){
        MedicineSearch medicineSearch = MedicineSearch.fromJson(jsonDecode(response.body));
        medicines = medicineSearch.data!;
        update();
      }
    }catch(e){
      filterMedicineFromLocal(s);
    }
  }

  filterMedicineFromLocal(String s){
    try{
      medicines = hiveManager.getAllMedicineBox().values.toList().where((element) => element.brandName!.toLowerCase().contains(s.toLowerCase())||element.genericName!.toLowerCase().contains(s.toLowerCase())).toList();
      update();
    }catch(e){
      medicines=[];
    }
  }

  List<LabTest> labtestsNames = [];
  AllDiagnosisName allDiagnosisName = AllDiagnosisName();

  filterLabTest(String s){
    labtestsNames = labtestsNames.where((element) => element.testname!.contains(s)).toList();
  }

  storeLabTestFromLocal()async{
    var labTests = hiveManager.getAllLabTestBox().values;
    labtestsNames = labTests.toList();
    update();
  }

  searchLabTests()async{
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.all_lab_tests}");
    try{
      var response = await get(url,
          headers: {
            "Accept":"application/json",
            "Authorization": "Bearer ${localData.token}",
          }
      );
      if(response.statusCode==200){
        AllLabTestResult allLabTestResult = AllLabTestResult.fromJson(jsonDecode(response.body));
        labtestsNames = allLabTestResult.data!;
        await hiveManager.addAllLabTest(labtestsNames);
        print("lab test length ${labtestsNames.length}");
        update();
      }
    }catch(e){



      update();
    }
    storeLabTestFromLocal();
  }


  storeDiagnosisFromLocal()async{
    var diagnosis = hiveManager.getAllDiagnosisBox().values;
    allDiagnosisName = AllDiagnosisName(
      error: false,
      msg: "From Local",
      data: diagnosis.toList()
    );
    update();

  }

  searchDiagnosis()async{
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.all_diagnosis_names}");
    try{
      var response = await get(url,
          headers: {
            "Accept":"application/json",
            "Authorization": "Bearer ${localData.token}",
          }
      );
      if(response.statusCode==200){
        AllDiagnosisName allLabTestResult = AllDiagnosisName.fromJson(jsonDecode(response.body));
        allDiagnosisName = allLabTestResult;
        await hiveManager.addAllDiagnosis(allDiagnosisName.data!);
        update();
      }
    }catch(e){

      update();
    }
    storeDiagnosisFromLocal();
  }

  ////////////////Lab Report/////////////////
  List<LabReport> labReportList = [];
  List<LabImages> labreportImages = [];
  void getLabReport() async {
    startLoading();
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.labReportList}/${patientsInfo.patientId}");
    print(url);
    try{
      var response = await get(url,headers: {
        "Accept":"application/json",
        "Authorization": "Bearer ${localData.token}",
      });
      if (response.statusCode == 200) {
        if(response.body.isNotEmpty){
          final Map<String, dynamic> body = await json.decode(response.body);
          LabReportModel labReportModel = LabReportModel.fromJson(body);
          labReportList = labReportModel.data!;
          for (var element in labReportList) {
            labreportImages.addAll(element.images!);
          }
          update();
        }
        stopLoading();
      }else {
        stopLoading();
        throw Exception('Failed to load post');
      }
    }on Exception catch(e){
      stopLoading();
      update();
      print(e);
    }
  }
  //////////////Prescription///////////
  PrescriptionLIstModel? prescriptionListModel = PrescriptionLIstModel();
  List <PrescriptionList> prescriptionList = [];
  void getPrescriptions() async {
    startLoading();
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.prescriptionList}/${patientsInfo.patientId}");
    print(url);
    try{
      var response = await get(url,headers: {
        "Accept":"application/json",
        "Authorization": "Bearer ${localData.token}",
      });
      if (response.statusCode == 200) {
        //stopLoading(); //by hanif
        if(response.body.isNotEmpty){
          final Map<String, dynamic> body = await json.decode(response.body);
          PrescriptionLIstModel prescriptionLIstModel = PrescriptionLIstModel.fromJson(body);
          prescriptionList = prescriptionLIstModel.data!;
         
         prescriptionList?.removeWhere((prescription) => prescription.imageurl == null);

          //  for (var element in prescriptionList!) {
          //   prescriptionList?.addAll(element.imageurl as Iterable<PrescriptionList> );
          // }
        //   for (var prescription in prescriptionList!) {
        //   // Check if imageurl is not null before adding it to the list
        //   if (prescription.imageurl != null) {
        //     (PrescriptionLIstModel( prescription.imageurl!));
        //   }
        // }
          update();
        }
       // stopLoading(); //by hanif
      }else {
        stopLoading();
        throw Exception('Failed to load post');
      }
    }on Exception catch(e){
      stopLoading();
      update(); //by hanif
      print(e);
    }
  }

 

  /////Review Medicine Taken Pattern medicine////
 List <UserMedicine> userMedicineAllList = [];
  getMedicine(int page) async {
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.userMedicineList}");
    try{
      var response = await post(url,body: {
        // "user_id": "${MySharedPreference.userId}",
        "user_id": "${patientsInfo.patientId}",
        "page": "$page"
      },headers: {
        "Accept":"application/json",
        "Authorization": "Bearer ${localData.token}",
      });
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        if(response.body.isNotEmpty){
          final Map<String, dynamic> body = await json.decode(response.body);
          print(body["data"]);
          UserMedicineModel userMedicineModel = UserMedicineModel.fromJson(body);
          // userMedicineAllList = userMedicineModel.data!;
          // hiveManager.userMedicineOperation(patientsInfo, userMedicineAllList, 'add', 'initial');
          //improved by Hanif{
          if (userMedicineModel.data != null) {
  userMedicineAllList = userMedicineModel.data!;
  hiveManager.userMedicineOperation(patientsInfo, userMedicineAllList, 'add', 'initial');
}
//improved by Hanif}
        }
      } else {
        throw Exception('Failed to load post');
      }

    }on Exception catch(e){
      try{
        userMedicineAllList = hiveManager.userMedicineOperation(patientsInfo, [], 'get', 'initial');
        update();
      }catch(e){

      }

      print(e);
    }

  }

///PAteint_ALl_Visit_summary_newly integrated by Hanif
List <PatientVisitInfo> patientsVisitInfo = [];
fetchPatientAllVisitSummary()async{
    startLoading();
   Uri url = Uri.parse("${Urls.baseUrl}${Urls.all_visit_summary}/${patientsInfo.patientId}");
 print(url);
    try{
      var response = await get(url,
         
          headers: {
        //'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${localData.token}',
      });
      if(response.statusCode==200){
        print(response.body);
        try{
          PatientVisitSummary pvs = PatientVisitSummary.fromJson(jsonDecode(response.body));
          if(pvs.data!=null){
            patientsVisitInfo = pvs.data!;
           // await hiveManager.patientInfoOperation('${arguments['id']}',patientsInfo, 'add');
            //print("visit id ${patientsInfo.doctorId}");
          }
         
          update();
          stopLoading();
        }catch(e){
          print(e);
          stopLoading();
        }
        stopLoading();
      }else{
        stopLoading();
      }
    }catch(e){

      stopLoading();
      print(e);
    }
    try{
      patientsInfo = hiveManager.getPatientInfo('${arguments['id']}')!;
      print(patientsInfo.patientId);
    }catch(e){
      print(e);

    }
    try{
      visitSummary = hiveManager.getVisitSummary(patientsInfo)!;

    }catch(e){
      print(e);
    }
    try{
      vitalInfo = hiveManager.getVitalInfo(patientsInfo)!;
    }catch(e){

    }
    update();
  }
  //Patientrescent Pcp summary 2 _end_ newly ingegrated by Hanif
  String medicalHistoryUrl = "";

  VisitId visitId = VisitId();

  getVisitId()async{
    loading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl+Urls.visit_id_result);
    try{

      var response = await post(
          url,
          body: {
            // "user_id": "${MySharedPreference.userId}",
            "schedule_id": "${patientsInfo.scheduleId}",
            "user_id": "${patientsInfo.patientId}",
            "doctor_id": "${doctorProfile.id}"
          },headers: {
        "Accept":"application/json",
        "Authorization": "Bearer ${localData.token}",
      }
      );

      loading = false;
      update();

      var bodyResult = jsonDecode(response.body);



      if(response.statusCode==200){
        VisitIdResult visitIdResult = VisitIdResult.fromJson(bodyResult);
        visitId = visitIdResult.data!;
        hiveManager.visitIdOperation(patientsInfo, visitId, 'add');
        print("visit id ${visitId.visitId}");
        update();
        Get.showSnackbar(GetSnackBar(
          title: "Success",
          message: "Visit In Progress",
          duration: Duration(seconds: 2),
        ));
      }

    }catch(e){
      try{
        visitId = hiveManager.visitIdOperation(patientsInfo, visitId, 'get');
        update();
      }catch(e){

      }
      loading = false;
      update();
      print(e);
    }
  }


  fetchMedicineHistory()async{
    Uri url = Uri.parse(Urls.baseUrl+Urls.medicical_history_for_app+"/${patientsInfo.patientId}");
    try{

      var response = await get(
          url,
          headers: {
        "Accept":"application/json",
        "Authorization": "Bearer ${localData.token}",
      }
      );
      
      var bodyResult = jsonDecode(response.body);
      
      if(response.statusCode==200){
        try{
          medicalHistoryUrl = bodyResult["data"];
          update();
          //activateWebView(bodyResult["data"]);
        }catch(e){

        }

        
      }

    }catch(e){
      loading = false;
      update();
      print(e);
    }

  }




  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(_handleTab);

    await fetchPatientData();
    if(patientsInfo.patientId==null){
      Get.back();

      Get.showSnackbar(GetSnackBar(message: "Patient is not fetched",));
    }

    processLocalData();

    await getVisitId();
    try{
      getLabReport();
    }catch(e){

    }
    try{
      getPrescriptions();
    }catch(e){

    }
     try{
      fetchPatientAllVisitSummary();
    }catch(e){

    }
    try{
      searchLabTests();
    }catch(e){

    }

    try{
      searchDiagnosis();
    }catch(e){

    }

    fetchMedicineHistory();

    try{
      getMedicine(1);
    }catch(e){

    }




  }


  showPrescriptionFormat(BuildContext context){

    Get.put(this);
    Get.to(()=>ShowPrescriptionData());

  }

  void processLocalData() async{
    try{
      LocalPrescriptionData? localPrescriptionData = hiveManager.getLocalPrescriptionData(patientsInfo);
      try{
        writePatientComplaintsController.text = localPrescriptionData!.patientComplaints??"";
        writeChiefComplaintsController.text = localPrescriptionData.chiefComplaints??"";
        patientDentalHealthController.text = localPrescriptionData.dentalHealth??"";
        update();
      }catch(e){
        print(e);
      }
    }catch(e){
      print(e);
    }

    try{
      newLabTests = (await hiveManager.getAddedLabData(patientsInfo))!;
      print(newLabTests);
      update();
    }catch(e){
      print(e);
    }

    try{
      newDiagnosis = hiveManager.getAddedDiagnosisData(patientsInfo)!;
      update();
    }catch(e){
      print(e);
    }

    try{
      regularMedicinesAdded = hiveManager.getAllAddedMedicine(patientsInfo, "regular")!;
      update();
    }catch(e){
      print(e);
    }

    try{
      regularMedicinesAddedRx = hiveManager.getAllAddedMedicine(patientsInfo, "rx")!;
      update();
    }catch(e){
      print(e);
    }
  }


}

