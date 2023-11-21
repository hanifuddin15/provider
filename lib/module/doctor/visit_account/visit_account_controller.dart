import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/local_data/local_data.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';
import 'package:kambaii_provider/model/doctor/wallet_model/wallet_model.dart';

class VisitAccountController extends GetxController{
  bool loading = false;
  LocalData localData = Get.find();
  DoctorProfile doctorProfile = Get.find();
WalletModelResult walletmodelresult = WalletModelResult();
  WalletModel? walletModel = WalletModel();
  List<LastVisitedPatients>? lastvisitedPAtients =[];


  fetchWallet()async{

    loading = true;
    update();

    Uri url = Uri.parse(Urls.baseUrl+Urls.doctor_account_summary+"/${doctorProfile.id}");

    try{
      var response = await get(url, headers: {
        "Accept":"application/json",
        "Authorization": "Bearer ${localData.token}",
      });

      // loading = false;
      // update();
      var responseBody = jsonDecode(response.body);
      print(response.body);
      loading = false;
      update();

      if(response.statusCode==200){
      walletmodelresult = WalletModelResult.fromJson(responseBody); //by hanif
       // walletModel = WalletModel.fromJson(responseBody);
        walletModel = walletmodelresult.data; //by hanif
       // lastvisitedPAtients = walletModel.lastVisitedPatients;
        update();

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
    fetchWallet();
  }



}