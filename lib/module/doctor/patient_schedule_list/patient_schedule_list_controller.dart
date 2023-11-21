// import 'dart:convert';

// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';
// import 'package:kambaii_provider/core/local_data/local_data.dart';
// import 'package:kambaii_provider/core/utils/urls.dart';
// import 'package:kambaii_provider/model/doctor/schedule_list/schedule_list.dart';
// import 'package:kambaii_provider/model/doctor/schedule_list/schedule_list_2.dart';

// class PatientScheduleListController extends GetxController{

//   var arguments = Get.arguments;
//   bool loading = false;
//   bool scrollLoading = false;
//   LocalData localData = Get.find();
//   List<SchedulePatient> schedulePatients = [];
//   List <PatientSchedule> patientSchedule = []; //by hanif
//   ScrollController scrollController = ScrollController();

//   ScheduleListResult scheduleListResult = ScheduleListResult();
//   ProviderSchedule providerSchedule = ProviderSchedule(); //by hanif

//   void scrollListener()async{

//     if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
//       try{
//        // if(scheduleListResult.data!.externalScheduleList!.nextPageUrl!=null) //cmnt by hanif
//         if(providerSchedule.data!=null)
        
//         {

//           scrollLoading = true;
//           update();
//         //  Uri url = Uri.parse("${scheduleListResult.data!.externalScheduleList!.nextPageUrl}"); //by hanif

//            Uri url = Uri.parse("${providerSchedule.data!}");

//           try{

//             var response = await get(url, headers: {
//               'Content-Type': 'application/json',
//               'Accept': 'application/json',
//               'Authorization': 'Bearer ${localData.token}',
//             });

//             if(response.statusCode==200){
//               try{
//                 print(response.body);

//                // scheduleListResult = ScheduleListResult.fromJson(jsonDecode(response.body)); //cmnt by hanif
//                providerSchedule = ProviderSchedule.fromJson(jsonDecode(response.body));
//               //  schedulePatients += scheduleListResult.data!.externalScheduleList!.data!;
//               patientSchedule += providerSchedule.data!;
//                 update();
//                 scrollLoading = false;
//                 update();


//               }catch(e){
//                 print(e);

//                 scrollLoading = false;
//                 update();
//               }
//             }else{
//               scrollLoading = false;
//               update();
//             }

//           }catch(e){
//             print(e);
//             scrollLoading = false;
//             update();

//           }

//         }
//       }catch(e){

//       }

//     }


//   }
//   fetchSchedules()async{

//     changeLoading(true);
    
//     Uri url = Uri.parse(Urls.baseUrl+Urls.schedule_list+"?schedule_type=${arguments["type"]}");

//     try{

//       var response = await get(url, headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer ${localData.token}',
//       });

//       if(response.statusCode==200){
//         try{
//           print(response.body);

//           scheduleListResult = ScheduleListResult.fromJson(jsonDecode(response.body));
//           schedulePatients = scheduleListResult.data!.externalScheduleList!.data!;
//           update();
//           changeLoading(false);


//         }catch(e){
//           print(e);
//           changeLoading(false);

//         }
//       }else{
//         changeLoading(false);
//       }

//     }catch(e){
//       print(e);
//       changeLoading(false);

//     }
//   }

//   changeLoading(bool t){
//     loading = t;
//     update();
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     fetchSchedules();
//     scrollController.addListener(scrollListener);
//   }

// }
// developed by hanif
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:kambaii_provider/core/local_data/local_data.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';
import 'package:kambaii_provider/model/doctor/schedule_list/schedule_list.dart';
import 'package:kambaii_provider/model/doctor/schedule_list/schedule_list_2.dart';

class PatientScheduleListController extends GetxController{

  var arguments = Get.arguments;
  bool loading = false;
  bool scrollLoading = false;
  LocalData localData = Get.find();
   DoctorProfile doctorProfile = Get.find();
  List<SchedulePatient> schedulePatients = [];
  List <PatientSchedule> patientSchedule = []; //by hanif
  ScrollController scrollController = ScrollController();

  ScheduleListResult scheduleListResult = ScheduleListResult();
  ProviderSchedule providerSchedule = ProviderSchedule(); //by hanif

  void scrollListener()async{

    if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
      try{
       // if(scheduleListResult.data!.externalScheduleList!.nextPageUrl!=null) //cmnt by hanif
        if(providerSchedule.data!=null)
        
        {

          scrollLoading = true;
          update();
        //  Uri url = Uri.parse("${scheduleListResult.data!.externalScheduleList!.nextPageUrl}"); //by hanif

           Uri url = Uri.parse("${providerSchedule.data!}");

          try{

            var response = await post(url,
             body: {
        'schedule_type': '${arguments['type']}',
        'user_id' : '${doctorProfile.id}',
          },
             headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${localData.token}',
            });

            if(response.statusCode==200){
              try{
                print(response.body);

               // scheduleListResult = ScheduleListResult.fromJson(jsonDecode(response.body)); //cmnt by hanif
               providerSchedule = ProviderSchedule.fromJson(jsonDecode(response.body));
              //  schedulePatients += scheduleListResult.data!.externalScheduleList!.data!;
              patientSchedule += providerSchedule.data!;
                update();
                scrollLoading = false;
                update();


              }catch(e){
                print(e);

                scrollLoading = false;
                update();
              }
            }else{
              scrollLoading = false;
              update();
            }

          }catch(e){
            print(e);
            scrollLoading = false;
            update();

          }

        }
      }catch(e){

      }

    }


  }
  fetchSchedules()async{

    changeLoading(true);
    
    Uri url = Uri.parse(Urls.baseUrl+Urls.schedule_list);

    try{

      var response = await post(url, 
       body: {
        'schedule_type': '${arguments['type']}',
        'user_id' : '${doctorProfile.id}',
          },
      headers: {
        //'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${localData.token}',
      });

      if(response.statusCode==200){
        try{
          print(response.body);

          //scheduleListResult = ScheduleListResult.fromJson(jsonDecode(response.body)); //cmnt by hanif
          providerSchedule = ProviderSchedule.fromJson(jsonDecode(response.body));
        //  schedulePatients = scheduleListResult.data!.externalScheduleList!.data!; //cmnt by hanif
          patientSchedule = providerSchedule.data!;
          update();
          changeLoading(false);


        }catch(e){
          print(e);
          changeLoading(false);

        }
      }else{
        changeLoading(false);
      }

    }catch(e){
      print(e);
      changeLoading(false);

    }
  }

  changeLoading(bool t){
    loading = t;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchSchedules();
    scrollController.addListener(scrollListener);
  }

}
//developed by hanif