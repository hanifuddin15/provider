import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/utils/local_db_manager/hive_manager.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_controller.dart';

import '../../../model/doctor/local_prescription_data/local_prescription_data.dart';

class ShowPrescribeDataController extends GetxController{

  HiveManager hiveManager = HiveManager();
  bool loading = false;
  LocalPrescriptionData localPrescriptionData = LocalPrescriptionData();


  bool uploadStarted = false;

  bool complaintsUpload = false;
  bool labtestUpload = false;
  bool diagnosisUpload = false;
  bool regularMedicineUpload = false;
  bool regularMedicineFxUpload = false;
  bool adviceUpload = false;

  PatientPrescribeController patientPrescribeController = Get.find();

  submitData()async{

    complaintsUpload = false;
    labtestUpload = false;
    diagnosisUpload = false;
    regularMedicineUpload = false;
    regularMedicineFxUpload = false;
    adviceUpload = false;
    uploadStarted = true;

    localPrescriptionData.patientComplaints = patientPrescribeController.writePatientComplaintsController.text.trim();
    localPrescriptionData.chiefComplaints = patientPrescribeController.writeChiefComplaintsController.text.trim();
    localPrescriptionData.dentalHealth  =patientPrescribeController.patientDentalHealthController.text.trim();
    localPrescriptionData.giveAdvicetoPateint = patientPrescribeController.giveAdviceToPatientController.text.trim();
    await hiveManager.localPrescriptionDataOperation(patientPrescribeController.patientsInfo, localPrescriptionData, 'add');
    update();
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Updating',

      content: GetBuilder<ShowPrescribeDataController>(
        builder: (controller) {
          return Column(
            children: [
              Row(
                children: [
                  Text("Complaints", style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 10,),
                  if (controller.complaintsUpload)
                    Icon(Icons.done_all, color: Colors.green,)
                  else
                    Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                ],
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Text("Lab Reports", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 10,),
                  if (controller.labtestUpload)
                    Icon(Icons.done_all, color: Colors.green,)
                  else
                    Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Diagnosis", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 10,),
                  if (controller.diagnosisUpload)
                    Icon(Icons.done_all, color: Colors.green,)
                  else
                    Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Regular Medicines", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 10,),
                  if (controller.regularMedicineUpload)
                    Icon(Icons.done_all, color: Colors.green,)
                  else
                    Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("RX", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 10,),
                  if (controller.regularMedicineFxUpload)
                    Icon(Icons.done_all, color: Colors.green,)
                  else
                    Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                ],
              ),
              SizedBox(height: 10,),
               Row(
                children: [
                  Text("Doctor's Advice", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(width: 10,),
                  if (controller.diagnosisUpload)
                    Icon(Icons.done_all, color: Colors.green,)
                  else
                    Expanded(child: LinearProgressIndicator(color: Colors.teal,))

                ],
              ),
              SizedBox(height: 10,),
              if(!uploadStarted)
                Center(
                  child: Column(
                    children: [
                      Text("Update Completed"),
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

    /*loading = true;
    update();*/
    try{
      await submitComplaints();
      complaintsUpload = true;
      update();
    }catch(e){

    }
//developed by hanif submitGivePAtientAdvice
 try{
      await submitGivePatientAdvice();
      adviceUpload = true;
      update();
    }catch(e){

    }

//end developed by hanif
    try{
      await submitLabReporst();
      labtestUpload = true;
      update();
    }catch(e){

    }
    try{
      await submitDiagnosis();
      diagnosisUpload = true;
      update();
    }catch(e){

    }

    try{
      await submitMedicines();
      regularMedicineUpload = true;
      update();
    }catch(e){

    }

    try{
      await submitMedicinesRx();
      regularMedicineFxUpload = true;
      update();
    }catch(e){

    }
    uploadStarted = false;
    update();


    /*loading = false;
    update();*/

    /*if(complaintsUpload||labtestUpload||diagnosisUpload||regularMedicineUpload||regularMedicineFxUpload){
      Get.defaultDialog(
        title: 'Success',
        content: Center(
          child: Text("Data uploaded successfully"),
        )
      );
    }
    */

  }

  submitComplaints()async{


    Uri url = Uri.parse(Urls.baseUrl+Urls.add_chief_complaint);
    try{

      var response = await post(
        url,
          body: {
            "patient_complain":patientPrescribeController.writePatientComplaintsController.text.trim(),
            "chief_complain":patientPrescribeController.writeChiefComplaintsController.text.trim(),
            "dental_health":patientPrescribeController.patientDentalHealthController.text.trim(),
            "visit_id":patientPrescribeController.visitId.visitId.toString()
          },
          headers: {
            //'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${patientPrescribeController.localData.token}',
          }
      );


      if(response.statusCode==200){
        await hiveManager.localPrescriptionDataOperation(patientPrescribeController.patientsInfo, localPrescriptionData, 'delete');
        print(response.body);

      }

    }catch(e){

      print(e);

    }

  }

  submitLabReporst()async{
    Uri url = Uri.parse(Urls.baseUrl+Urls.store_lab_report);
    try{
      for (var element in patientPrescribeController.newLabTests) {
        var response = await post(
            url,
            body: {
              "user_id":patientPrescribeController.patientsInfo.patientId.toString(),
              "specelist_id":patientPrescribeController.doctorProfile.id.toString(),
              "test_name":element.test_name,
              "reason":element.reason,
              "visit_id":patientPrescribeController.visitId.visitId.toString(),
            },
            headers: {
              //'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${patientPrescribeController.localData.token}',
            }
        );

        if(response.statusCode==200){
          await hiveManager.addedLabTestOperation(patientPrescribeController.patientsInfo, [], 'delete');

          print(response.body);

        }
      }

    }catch(e){

      print(e);

    }
  }

  submitDiagnosis()async{
    Uri url = Uri.parse(Urls.baseUrl+Urls.store_diagnosis);
    try{
      for (var element in patientPrescribeController.newDiagnosis) {
        var response = await post(
            url,
            body: {
              "patient_id":patientPrescribeController.patientsInfo.patientId.toString(),
              "doctor_id":patientPrescribeController.doctorProfile.id.toString(),
              "provisinal_diagnosis":element.provisinal_diagnosis,
              "provisinal_note":element.provisinal_note,
              "visit_id":patientPrescribeController.visitId.visitId.toString(),
            },
            headers: {
              //'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${patientPrescribeController.localData.token}',
            }
        );

        if(response.statusCode==200){

          await hiveManager.addedDiagnosisOperation(patientPrescribeController.patientsInfo, [], 'delete');

          print(response.body);

        }
      }

    }catch(e){

      print(e);

    }
  }

  submitMedicines()async{
    Uri url = Uri.parse(Urls.baseUrl+Urls.medicine_entry);
    try{
      for (var element in patientPrescribeController.regularMedicinesAdded.where((element) => !element.continued)) {
        var response = await post(
            url,
            body: {
              "user_id":patientPrescribeController.patientsInfo.patientId.toString(),
              "prescribed_by":patientPrescribeController.doctorProfile.id.toString(),
              //"visit_id":patientPrescribeController.visitId.visitId.toString(),
              "type": element.medicineInfo!.category,
              "medicine_name": element.medicineInfo!.brandName,
              "measurement": element.medicineInfo!.strength,
              "generic_name":element.medicineInfo!.genericName,
              "measurement_unit": "mg",
              "morning": element.morning ? "yes" : "no",
              "afternoon": element.noon ? "yes" : "no",
              "night": element.night ? "yes" : "no",
              "before_or_after_meal": element.medicineIntakeMeal==0?"before":"after",
              "how_many_days": element.days,
              "how_much":element.amount,
              "medicine_status": "continue"
            },
            headers: {
              //'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${patientPrescribeController.localData.token}',
            }
        );

        if(response.statusCode==200){
          await hiveManager.addedMedicineOperation(patientPrescribeController.patientsInfo, [], 'delete', "regular");

          print(response.body);
        }
      }
    }catch(e){
      print(e);
    }
  }


  submitMedicinesRx()async{
    Uri url = Uri.parse(Urls.baseUrl+Urls.medicine_entry);
    try{
      for (var element in patientPrescribeController.allTheNewMedicine) {
        var response = await post(
            url,
            body: {
              "user_id":patientPrescribeController.patientsInfo.patientId.toString(),
              "prescribed_by":patientPrescribeController.doctorProfile.id.toString(),
              "visit_id":patientPrescribeController.visitId.visitId.toString(),
              "type": element.medicineInfo!.category,
              "medicine_name": element.medicineInfo!.brandName,
              "measurement": element.medicineInfo!.strength,
              "generic_name":element.medicineInfo!.genericName,
              "measurement_unit": "mg",
              "morning": element.morning ? "yes" : "no",
              "afternoon": element.noon ? "yes" : "no",
              "night": element.night ? "yes" : "no",
              "before_or_after_meal": element.medicineIntakeMeal==0?"before":"after",
              "how_many_days": element.days,
              "how_much":element.amount,
              "medicine_status": "continue"
            },
            headers: {
              //'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${patientPrescribeController.localData.token}',
            }
        );

        if(response.statusCode==200){
          await hiveManager.addedMedicineOperation(patientPrescribeController.patientsInfo, [], 'delete', "rx");
          print(response.body);
        }
      }
    }catch(e){
      print(e);
    }
  }
  //developed by hanif
     submitGivePatientAdvice()async{


    Uri url = Uri.parse(Urls.baseUrl+Urls.give_advice_patient);
    try{

      var response = await post(
        url,
          body: {
            "patient_id":patientPrescribeController.patientsInfo.patientId.toString(),
            "advice":patientPrescribeController.giveAdviceToPatientController.text.trim(),
           // "dental_health":patientPrescribeController.patientDentalHealthController.text.trim(),
           "doctor_id": patientPrescribeController.doctorProfile.id.toString(),
            "visit_id":patientPrescribeController.visitId.visitId.toString()
          },
          headers: {
            //'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${patientPrescribeController.localData.token}',
          }
      );


      if(response.statusCode==200){
        await hiveManager.localPrescriptionDataOperation(patientPrescribeController.patientsInfo, localPrescriptionData, 'delete');
        print(response.body);

      }

    }catch(e){

      print(e);

    }

  }


}