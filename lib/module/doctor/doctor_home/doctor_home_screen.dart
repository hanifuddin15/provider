import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen_controller.dart';
import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen_widget.dart';
import 'package:kambaii_provider/module/doctor/doctor_profile/doctor_profile_screen.dart';
import 'package:kambaii_provider/module/doctor/patient_schedule_list/patient_schedule_list_screen.dart';
import 'package:kambaii_provider/module/doctor/pharmacy_request/request_list_screen.dart';
import 'package:kambaii_provider/module/doctor/visit_records/visit_record_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../settings/settings_screen.dart';
import '../visit_account/visit_account_screen.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoctorHomeScreenController>(
        init: DoctorHomeScreenController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Image.asset(
                "images/kambaiilogo.png",
                width: kToolbarHeight,
                height: kToolbarHeight,
              ),
              actions: [
                /*IconButton(onPressed: (){}, icon: Badge(
                badgeContent: Text("3"),
                child: SvgPicture.asset('images/notification.svg'),
              )),*/
                SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {
                      controller.logout();
                    },
                    icon: SvgPicture.asset('images/logout.svg'))
              ],
            ),
            body: ModalProgressHUD(
              inAsyncCall: controller.isLoading,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: controller.doctorProfile.photo == null ||
                                    controller.doctorProfile.photo!.isEmpty
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50,
                                    child: SvgPicture.asset(
                                      'images/avatar.svg',
                                      fit: BoxFit.cover,
                                    ))
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        '${controller.doctorProfile.photo}'),
                                  ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.doctorProfile.name ?? "--"}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text("${controller.doctorProfile.type ?? "--"}")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(
                                        () => PatientScheduleListScreen(
                                              title: "Today's Schedule",
                                            ),
                                        arguments: {"type": "present"});
                                  },
                                  child: DoctorHomeScreenCard(
                                    title: "Today's Schedule",
                                    assetPath: 'images/cal.svg',
                                    backgroundColor:
                                        Colors.greenAccent.withOpacity(0.1),
                                    circleBackgroundColor:
                                        Colors.greenAccent.withOpacity(0.4),
                                    number: "40",
                                    numberColor: Colors.green,
                                    shadowColor:
                                        Colors.greenAccent.withOpacity(0.8),
                                  )),
                              InkWell(
                                  onTap: () {
                                    Get.to(
                                        () => PatientScheduleListScreen(
                                              title: "Upcoming Schedule",
                                            ),
                                        arguments: {"type": "upcoming"});
                                  },
                                  child: DoctorHomeScreenCard(
                                    title: "Upcoming Schedule",
                                    assetPath: 'images/cal.svg',
                                    backgroundColor:
                                        Colors.white.withOpacity(0.1),
                                    circleBackgroundColor:
                                        Colors.white.withOpacity(0.4),
                                    number: "60",
                                    numberColor: Colors.deepPurple,
                                    shadowColor:
                                        Colors.greenAccent.withOpacity(0.8),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(
                                        () => PatientScheduleListScreen(
                                              title: "Previous Schedule",
                                            ),
                                        arguments: {"type": "previous"});
                                  },
                                  child: DoctorHomeScreenCard(
                                    title: "Previous Schedule",
                                    assetPath: 'images/cal.svg',
                                    backgroundColor:
                                        Colors.deepOrange.withOpacity(0.1),
                                    circleBackgroundColor:
                                        Colors.deepOrange.withOpacity(0.4),
                                    number: "40",
                                    numberColor: Colors.deepOrange,
                                    shadowColor:
                                        Colors.deepOrange.withOpacity(0.8),
                                  )),
                              InkWell(
                                  onTap: () {
                                    Get.to(() => PharmacyRequestListScreen());
                                  },
                                  child: DoctorHomeScreenCard(
                                    title: "Pharmacist Request",
                                    assetPath: 'images/cal.svg',
                                    backgroundColor: const Color(0xffC4A2E7)
                                        .withOpacity(0.1),
                                    circleBackgroundColor:
                                        Colors.deepOrange.withOpacity(0.4),
                                    number: "40",
                                    numberColor: const Color(0xffC4A2E7),
                                    shadowColor: const Color(0xffC4A2E7)
                                        .withOpacity(0.8),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => VisitRecordScreen());
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: Get.width * .3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: Get.width * .2 * .3,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset('images/vr.svg'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Visit Records",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => VisitAccountScreen());
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: Get.width * .3,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: Get.width * .2 * .3,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset('images/ac.svg'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Account",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => DoctorProfileScreen());
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: Get.width * .3,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: Get.width * .2 * .3,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset('images/pr.svg'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "My Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(()=>SettingsScreen());
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: Get.width * .3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: Get.width * .2 * .3,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset('images/gearGreen.svg'),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Settings",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
