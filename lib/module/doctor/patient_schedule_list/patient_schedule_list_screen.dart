// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:kambaii_provider/core/utils/urls.dart';
// import 'package:kambaii_provider/model/doctor/schedule_list/schedule_list.dart';
// import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_screen.dart';
// import 'package:kambaii_provider/module/doctor/patient_schedule_list/patient_schedule_list_controller.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class PatientScheduleListScreen extends StatelessWidget {
//   PatientScheduleListScreen({Key? key, required this.title}) : super(key: key);
//   String title;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PatientScheduleListController>(
//       init: PatientScheduleListController(),
//       builder: (controller) {
//         return ModalProgressHUD(
//           inAsyncCall: controller.loading,
//           child: Scaffold(

//             appBar: AppBar(
//               title: Text("$title"),
//               elevation: 0,
//               backgroundColor: Colors.white,
//               iconTheme: IconThemeData(color: Colors.black),
//               titleTextStyle: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 fontSize: 20
//               ),
//             ),
//             body: CustomScrollView(
//               controller: controller.scrollController,

//               slivers: [
//                 SliverList(


//                     delegate: SliverChildBuilderDelegate(
//                       childCount: controller.scrollLoading? controller.schedulePatients.length+1:controller.schedulePatients.length,
//                             (context, index) {

//                         if(index<controller.schedulePatients.length){
//                           SchedulePatient sp = controller.schedulePatients[index];

//                           return Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10)
//                             ),

//                             child: ListTile(
//                               onTap: (){
//                                 Get.to(()=>PatientPrescribeScreen(), arguments: {"id":sp.id});
//                               },
//                               contentPadding: EdgeInsets.all(10),
//                               tileColor: Colors.tealAccent.withOpacity(0.2),
//                               title: Text("${sp.name}", style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18
//                               ),),
//                               leading: CircleAvatar(
//                                 radius: Get.width*.2*.5,

//                                 backgroundColor: Colors.white,
//                                 backgroundImage: sp.photo!=null?NetworkImage("${Urls.picBaseUrl}profile_pic/${sp.photo}",):NetworkImage('https://t4.ftcdn.net/jpg/03/59/58/91/360_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg') as ImageProvider,
//                                 //child: sp.photo!=null?Image.network("${Urls.picBaseUrl}profile_pic/${sp.photo}", fit: BoxFit.cover,):SvgPicture.asset('images/avatar.svg'),


//                               ),
//                               trailing: Icon(Icons.arrow_forward, color: Colors.black,),
//                               subtitle: Container(
//                                 margin: EdgeInsets.only(top: 10),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text("MRN : PAT${sp.patientId??"--"}",),
//                                         Text("${sp.gender??"--"}")
//                                       ],
//                                     ),
//                                     SizedBox(height: 5,),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text("${sp.mobile??"--"}",),
//                                         Text("Age : ${sp.age??"--"}")
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         }else{
//                           return Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }



//                 }
//                 )
//                 )
//               ],
//             ),

//           ),
//         );
//       }
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/schedule_list/schedule_list.dart';
import 'package:kambaii_provider/model/doctor/schedule_list/schedule_list_2.dart';
import 'package:kambaii_provider/module/doctor/patient_prescribe/patient_prescribe_screen.dart';
import 'package:kambaii_provider/module/doctor/patient_schedule_list/patient_schedule_list_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PatientScheduleListScreen extends StatelessWidget {
  PatientScheduleListScreen({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientScheduleListController>(
      init: PatientScheduleListController(),
      builder: (controller) {
        return ModalProgressHUD(
          inAsyncCall: controller.loading,
          child: Scaffold(

            appBar: AppBar(
              title: Text("$title"),
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20
              ),
            ),
            body: CustomScrollView(
              controller: controller.scrollController,

              slivers: [
                SliverList(


                    delegate: SliverChildBuilderDelegate(
                   //   childCount: controller.scrollLoading? controller.schedulePatients.length+1:controller.schedulePatients.length,
                                      childCount: controller.scrollLoading? controller.patientSchedule.length+1:controller.patientSchedule.length,
                            (context, index) {

                        if(index<controller.patientSchedule.length){
                          PatientSchedule sp = controller.patientSchedule[index];

                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),

                            child: ListTile(
                              onTap: (){
                                Get.to(()=>PatientPrescribeScreen(), arguments: {"id":sp.scheduleId});
                              },
                              contentPadding: EdgeInsets.all(10),
                              tileColor: Colors.tealAccent.withOpacity(0.2),
                              title: Text("${sp.patientName}", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                              leading: CircleAvatar(
                                radius: Get.width*.2*.5,

                                backgroundColor: Colors.white,
                                backgroundImage: sp.userPhoto!=null?NetworkImage("${sp.userPhoto}",):NetworkImage('https://t4.ftcdn.net/jpg/03/59/58/91/360_F_359589186_JDLl8dIWoBNf1iqEkHxhUeeOulx0wOC5.jpg') as ImageProvider,
                             //   //child: sp.photo!=null?Image.network("${Urls.picBaseUrl}profile_pic/${sp.photo}", fit: BoxFit.cover,):SvgPicture.asset('images/avatar.svg'),


                              ),
                              trailing: Icon(Icons.arrow_forward, color: Colors.black,),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("MRN : PAT${sp.patientId??"--"}",),
                                        Text("${sp.userGender??"--"}")
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${sp.userMobile??"--"}",),
                                        Text("Age : ${sp.userAge??"--"}")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }else{
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }



                }
                )
                )
              ],
            ),

          ),
        );
      }
    );
  }
}
