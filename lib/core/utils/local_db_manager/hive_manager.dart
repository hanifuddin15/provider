
import 'package:kambaii_provider/core/utils/local_db_manager/hive_constants.dart';
import 'package:kambaii_provider/model/doctor/lab_test/lab_test_names.dart';
import 'package:kambaii_provider/model/doctor/medicine/medicine_add.dart';
import 'package:kambaii_provider/model/doctor/medicine/medicine_result.dart';
import 'package:kambaii_provider/model/doctor/patient_info/patient_prescription_info.dart';
import 'package:kambaii_provider/model/doctor/visit_id/visit_id_result.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../model/doctor/all_diagnosis/all_diagnosis_name.dart';
import '../../../model/doctor/lab/lab_element.dart';
import '../../../model/doctor/local_prescription_data/local_prescription_data.dart';
import '../../../model/doctor/medicine/medicine_list_user.dart';

class HiveManager{


  Future<void> setupHive()async{

    var directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(directory.path);

    Hive.registerAdapter(MedicineInfoAdapter());
    Hive.registerAdapter(LabTestAdapter());
    Hive.registerAdapter(AllDiagnosisNameAdapter());
    Hive.registerAdapter(PatientsInfoAdapter());
    Hive.registerAdapter(VisitSummaryAdapter());
    Hive.registerAdapter(VitalInfoAdapter());
    Hive.registerAdapter(VisitIdAdapter());
    Hive.registerAdapter(UserMedicineAdapter());
    Hive.registerAdapter(LocalPrescriptionDataAdapter());
    Hive.registerAdapter(AddLabTestAdapter());
    Hive.registerAdapter(DiagnosisAdapter());
    Hive.registerAdapter(MedicineAddedAdapter());

    await Hive.openBox<MedicineInfo>(HiveConstants.medicineClassBoxName);
    await Hive.openBox<LabTest>(HiveConstants.labTestClassBoxName);
    await Hive.openBox<String>(HiveConstants.diagnosisClassBoxName);
    await Hive.openBox<PatientsInfo>(HiveConstants.patientInfo);
    await Hive.openBox<List<VisitSummary>>(HiveConstants.visitSummary);
    await Hive.openBox<VitalInfo>(HiveConstants.vitalInfo);
    await Hive.openBox<VisitId>(HiveConstants.visitId);
    await Hive.openBox<List<UserMedicine>>(HiveConstants.medicineInfoReview);
    await Hive.openBox<LocalPrescriptionData>(HiveConstants.localPrescriptionData);
    await Hive.openBox<List<AddLabTest>>(HiveConstants.addedLabData);
    await Hive.openBox<List<Diagnosis>>(HiveConstants.addedDiagnosisData);
    await Hive.openBox<List<MedicineAdded>>(HiveConstants.addedMedicine);
    print('hive setup finished');
  }

  Future<Box<List<AddLabTest>>> getAddedLabTestBox()async{
    if(!Hive.isBoxOpen(HiveConstants.addedLabData)){
      await Hive.openBox(HiveConstants.addedLabData);
    }
    return Hive.box<List<AddLabTest>>(HiveConstants.addedLabData);
  }

  Box<List<MedicineAdded>> getAddedMedicineBox(){
    return Hive.box<List<MedicineAdded>>(HiveConstants.addedMedicine);
  }

  Box<List<Diagnosis>> getAddedDiagnosisBox(){
    return Hive.box<List<Diagnosis>>(HiveConstants.addedDiagnosisData);
  }

  Box<LocalPrescriptionData> getLocalPrescriptionBox(){
    return Hive.box<LocalPrescriptionData>(HiveConstants.localPrescriptionData);
  }

  Box<MedicineInfo> getAllMedicineBox(){
    return Hive.box<MedicineInfo>(HiveConstants.medicineClassBoxName);
  }

  Box<LabTest> getAllLabTestBox(){
    return Hive.box<LabTest>(HiveConstants.labTestClassBoxName);
  }

  Box<String> getAllDiagnosisBox(){
    return Hive.box<String>(HiveConstants.diagnosisClassBoxName);
  }

  Box<PatientsInfo> getPatientInfoBox(){
    return Hive.box<PatientsInfo>(HiveConstants.patientInfo);
  }
  Box<List<VisitSummary>> getVisitSummaryBox(){
    return Hive.box<List<VisitSummary>>(HiveConstants.visitSummary);
  }
  Box<VitalInfo> getVitalInfoBox(){
    return Hive.box<VitalInfo>(HiveConstants.vitalInfo);
  }
  Box<VisitId> getVisitIdBox(){
    return Hive.box<VisitId>(HiveConstants.visitId);
  }
  Box<List<UserMedicine>> getUserMedicineBox(){
    return Hive.box<List<UserMedicine>>(HiveConstants.medicineInfoReview);
  }


  addedLabTestOperation(PatientsInfo patientsInfo,List<AddLabTest> tests, String type)async{
    var patientInfoBox = await getAddedLabTestBox();
    if(type=="add"){
      try{
        await patientInfoBox.put(patientsInfo.patientId.toString(), tests);
        print(tests);
        print("Added data");
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await patientInfoBox.delete(patientsInfo.patientId.toString());
      }catch(e){
      }
    }
  }

  Future<List<AddLabTest>?> getAddedLabData(PatientsInfo patientsInfo)async{
    var localBox = await getAddedLabTestBox();

    var dt = localBox.get(patientsInfo.patientId.toString());
    print("lab");
    print("Lab Data $dt");
    return dt;
  }


  addedDiagnosisOperation(PatientsInfo patientsInfo,List<Diagnosis> tests, String type)async{
    var patientInfoBox = getAddedDiagnosisBox();
    if(type=="add"){
      try{
        await patientInfoBox.put(patientsInfo.patientId.toString(), tests);
        print("Added patient");
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await patientInfoBox.delete(patientsInfo.patientId.toString());
      }catch(e){
      }
    }

  }

  List<Diagnosis>? getAddedDiagnosisData(PatientsInfo patientsInfo){
    var localBox = getAddedDiagnosisBox();
    return localBox.get(patientsInfo.patientId.toString());
  }

  patientInfoOperation(String scheduleId, PatientsInfo patientsInfo, String type)async{
    var patientInfoBox = getPatientInfoBox();
    if(type=="add"){
      try{
        await patientInfoBox.put(scheduleId, patientsInfo);
        print("Added patient");
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await patientInfoBox.delete(scheduleId);
      }catch(e){
      }
    }

  }


  localPrescriptionDataOperation(PatientsInfo patientsInfo,LocalPrescriptionData localPrescriptionData, String type)async{
    var localPrescriptionBox = getLocalPrescriptionBox();
    if(type=="add"){
      try{
        await localPrescriptionBox.put(patientsInfo.patientId.toString(), localPrescriptionData);
        print("Added data");
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await localPrescriptionBox.delete(patientsInfo.patientId.toString());
        print("deleted");
      }catch(e){
      }
    }

  }

  LocalPrescriptionData? getLocalPrescriptionData(PatientsInfo patientsInfo){
    var localBox = getLocalPrescriptionBox();
    return localBox.get(patientsInfo.patientId.toString());
  }


  PatientsInfo? getPatientInfo(String scheduleId){
    var patientInfoBox = getPatientInfoBox();
    return patientInfoBox.get(scheduleId);
  }

  visitSummaryOperation(PatientsInfo patientsInfo,List<VisitSummary> visitSummary, String type)async{
    var visitSummaryBox = getVisitSummaryBox();
    if(type=="add"){
      try{
        await visitSummaryBox.put(patientsInfo.patientId.toString(), visitSummary);
      }catch(e){
      }
    }else if(type=="delete"){


      try{
        await visitSummaryBox.delete(patientsInfo.patientId.toString());

      }catch(e){
      }
    }
  }

  List<VisitSummary>? getVisitSummary(PatientsInfo patientsInfo){
    var visitSummaryBox = getVisitSummaryBox();
    return visitSummaryBox.get(patientsInfo.patientId.toString());
  }

  vitalInfoOperation(PatientsInfo patientsInfo,VitalInfo vitalInfo, String type)async{
    var vitalInfoBox = getVitalInfoBox();
    if(type=="add"){
      try{
        await vitalInfoBox.put(patientsInfo.patientId.toString(), vitalInfo);
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await vitalInfoBox.delete(patientsInfo.patientId.toString());

      }catch(e){
      }
    }else if(type=="get"){
      try{
        return vitalInfoBox.get(patientsInfo.patientId.toString());

      }catch(e){
      }
    }
  }

  VitalInfo? getVitalInfo(PatientsInfo patientsInfo){
    var vitalInfoBox = getVitalInfoBox();
    return vitalInfoBox.get(patientsInfo.patientId.toString());
  }

  visitIdOperation(PatientsInfo patientsInfo,VisitId visitId, String type)async{
    var visitIdBox = getVisitIdBox();
    if(type=="add"){
      try{
        await visitIdBox.put(patientsInfo.patientId.toString(), visitId);
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await visitIdBox.delete(patientsInfo.patientId.toString());

      }catch(e){
      }
    }else if(type=="get"){
      try{
        return visitIdBox.get(patientsInfo.patientId.toString());

      }catch(e){
      }
    }
  }


  userMedicineOperation(PatientsInfo patientsInfo,List<UserMedicine> medicines, String type, String medicineType)async{
    var medicineBox = getUserMedicineBox();
    if(type=="add"){
      try{
        await medicineBox.put(patientsInfo.patientId.toString()+medicineType, medicines);
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await medicineBox.delete(patientsInfo.patientId.toString()+medicineType);

      }catch(e){
      }
    }else if(type=='get'){
      try{
        return medicineBox.get(patientsInfo.patientId.toString()+medicineType);
      }catch(e){
      }
    }
  }


  addedMedicineOperation(PatientsInfo patientsInfo,List<MedicineAdded> medicines, String type, String medicineType)async{
    var medicineBox = getAddedMedicineBox();
    if(type=="add"){
      try{
        await medicineBox.put(patientsInfo.patientId.toString()+medicineType, medicines);
      }catch(e){
      }
    }else if(type=="delete"){
      try{
        await medicineBox.delete(patientsInfo.patientId.toString()+medicineType);

      }catch(e){
      }
    }
  }

  List<MedicineAdded>? getAllAddedMedicine(PatientsInfo patientsInfo, String type){
    var bx = getAddedMedicineBox();
    return bx.get(patientsInfo.patientId.toString()+type);
  }



  addAllMedicines(List<MedicineInfo> medicines)async{

    var medicineBox = getAllMedicineBox();

    await medicineBox.clear();

    await medicineBox.addAll(medicines);

  }

  addAllLabTest(List<LabTest> labTests)async{

    var labTestBox = getAllLabTestBox();

    await labTestBox.clear();

    await labTestBox.addAll(labTests);

  }

  addAllDiagnosis(List<String> diagnosis)async{
    var diagnosisBox = getAllDiagnosisBox();

    await diagnosisBox.clear();

    await diagnosisBox.addAll(diagnosis);
  }


}