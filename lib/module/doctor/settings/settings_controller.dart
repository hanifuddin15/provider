

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/utils/local_db_manager/hive_manager.dart';

import '../../../core/local_data/local_data.dart';
import '../../../core/utils/urls.dart';
import '../../../model/doctor/all_diagnosis/all_diagnosis_name.dart';
import '../../../model/doctor/lab_test/lab_test_names.dart';
import '../../../model/doctor/login_model/login_result_model.dart';
import '../../../model/doctor/medicine/medicine_result.dart';

class SettingsScreenController extends GetxController{

  DoctorProfile doctorProfile = DoctorProfile();
  bool isLoading = false;

  LocalData localData = Get.find();
  HiveManager hiveManager = HiveManager();

  List<MedicineInfo> medicines = [];
  List<LabTest> labtestsNames = [];
  List<String>? allDiagnosisName = [];
  bool loadingMedicine = false;
  bool storingMedicine = false;

  bool loadingLabTest = false;
  bool storingLabTest = false;

  bool loadingDiagnosis = false;
  bool storingDiagnosis = false;


  bool startFetching = false;
  bool startStoring = false;


  bool medicineProcessed = false;
  bool labTestProcessed = false;
  bool diagnosisProcessed = false;

  fetchStart()async{

    startFetching = true;
    update();
    await fetchMedicines();
    medicineProcessed = true;
    update();
    await fetchAllLabTests();
    labTestProcessed = true;
    update();
    await fetchAllDiagnosis();
    diagnosisProcessed = true;
    update();
    startFetching = false;
    update();
  }

  startProcessing()async{

    startStoring = true;
    update();

    await cachingMedicines();
    await cachingLabTests();
    await cachingDiagnosis();

    startStoring = false;
    update();

  }

  fetchMedicines()async{
    loadingMedicine = true;
    update();

    Uri url = Uri.parse("${Urls.baseUrl}${Urls.all_medicine}");
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
      medicines = [];
      update();
    }

    loadingMedicine = false;
    update();
  }


  cachingMedicines()async{
    storingMedicine=true;
    update();
    await hiveManager.addAllMedicines(medicines);
    print(hiveManager.getAllMedicineBox().values);
    storingMedicine=false;
    update();
  }

  fetchAllLabTests()async{
    loadingLabTest = true;
    update();
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
        print("lab test length ${labtestsNames.length}");
        update();
      }
    }catch(e){

      update();
    }

    loadingLabTest=false;
    update();
  }

  cachingLabTests()async{
    storingLabTest=true;
    update();
    await hiveManager.addAllLabTest(labtestsNames);
    print(hiveManager.getAllLabTestBox().values);
    storingLabTest=false;
    update();
  }


  fetchAllDiagnosis()async{
    loadingDiagnosis=true;
    update();
    Uri url = Uri.parse("${Urls.baseUrl}${Urls.all_diagnostics}");
    try{
      var response = await get(url,
          headers: {
            "Accept":"application/json",
            "Authorization": "Bearer ${localData.token}",
          }
      );
      if(response.statusCode==200){
        AllDiagnosisName allLabTestResult = AllDiagnosisName.fromJson(jsonDecode(response.body));
        allDiagnosisName = allLabTestResult.data;
        update();
      }
    }catch(e){
      update();
    }

    loadingDiagnosis=false;
    update();
  }

  cachingDiagnosis()async{
    storingDiagnosis=true;
    update();
    await hiveManager.addAllDiagnosis(allDiagnosisName!);
    print(hiveManager.getAllDiagnosisBox().values);
    storingDiagnosis=false;
    update();
  }

  showDialogOfCaching()async{
    medicineProcessed=false;
    labTestProcessed=false;
    diagnosisProcessed=false;
    update();

    Get.defaultDialog(
        barrierDismissible: false,
        title: 'Downloading',

        content: GetBuilder<SettingsScreenController>(
            builder: (controller) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text("Medicine Database", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 10,),
                      if (controller.medicineProcessed)
                        Icon(Icons.done_all, color: Colors.green,)
                      else
                        Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      Text("Lab Test Database", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 10,),
                      if (controller.labTestProcessed)
                        Icon(Icons.done_all, color: Colors.green,)
                      else
                        Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Diagnosis Database", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(width: 10,),
                      if (controller.diagnosisProcessed)
                        Icon(Icons.done_all, color: Colors.green,)
                      else
                        Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                    ],
                  ),
                  SizedBox(height: 10,),

                  if(medicineProcessed&&labTestProcessed&&diagnosisProcessed)
                    Center(
                      child: Column(
                        children: [
                          Text("Database Updated"),
                          SizedBox(height: 10,),
                          ElevatedButton(onPressed: (){
                            Get.back();
                          }, child: Text("Back"), style: ElevatedButton.styleFrom(backgroundColor: Colors.green),)
                        ],
                      ),
                    )
                ],
              );
            }
        )

    );

    await fetchStart();
    await startProcessing();

  }



}