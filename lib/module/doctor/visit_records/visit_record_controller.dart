import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';
import 'package:kambaii_provider/model/visit_records/visit_records.dart';

import '../../../core/local_data/local_data.dart';

class VisitRecordController extends GetxController{
  bool loading = false;
  LocalData localData = Get.find();
  DoctorProfile doctorProfile = Get.find();
  List<VisitRecord> visitRecords = [];

  fetchVisits()async{

    loading = true;
    update();

    Uri url = Uri.parse(Urls.baseUrl+Urls.prescription_records);

    try{

      var response = await get(url, headers: {
        "Accept": "application/json",
        // "Content-Type": "application/json",
        "Authorization": "Bearer ${localData.token}",
      });
      var responseBody = jsonDecode(response.body);
      loading = false;
      update();

      if(response.statusCode==200){

        try{

          //VisitRecordsResult visitRecordsResult = VisitRecordsResult.fromJson(responseBody);
          
          VisitRecordsResult visitRecordsResult = VisitRecordsResult.fromJson(responseBody);


          visitRecords = visitRecordsResult.data!;
          update();

        }catch(e){

        }

      }

    }catch(e){
      loading = false;
      update();
    }

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchVisits();
  }

}