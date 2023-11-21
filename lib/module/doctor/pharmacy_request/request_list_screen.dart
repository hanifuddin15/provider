import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kambaii_provider/module/doctor/pharmacy_request/doctors_note_screen.dart';
import 'package:kambaii_provider/module/doctor/pharmacy_request/pharmacy_request_controller.dart';

import '../../../core/utils/date_format.dart';
import '../../../model/request_note_patient_info/request_note_patient_info.dart';

class PharmacyRequestListScreen extends StatelessWidget {
  const PharmacyRequestListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PharmacyRequestController>(
        init: PharmacyRequestController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                "Request List".tr,
                style: GoogleFonts.mukta(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff115771),
              elevation: 0,
              actions: [],
            ),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchRequests(controller.chosen == 0
                      ? "today"
                      : controller.chosen == 1
                          ? "previous"
                          : "served");
                },
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 62,
                        width: 83.7,
                        child: Image.asset('images/kambaiilogo.png'),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changeChosen(0);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: controller.chosen == 0
                                        ? Color(0xff035978)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: controller.chosen == 0
                                            ? Colors.white
                                            : Colors.black)),
                                child: Center(
                                    child: Text(
                                  "Today".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.chosen == 0
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeChosen(1);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: controller.chosen == 1
                                        ? Color(0xff035978)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: controller.chosen == 1
                                            ? Colors.white
                                            : Colors.black)),
                                child: Center(
                                    child: Text(
                                  "Previous".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.chosen == 1
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeChosen(2);
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: controller.chosen == 2
                                        ? Color(0xff035978)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: controller.chosen == 2
                                            ? Colors.white
                                            : Colors.black)),
                                child: Center(
                                    child: Text(
                                  "Served".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.chosen == 2
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Center(
                        child: Container(
                          //width: Get.width*.7,
                          padding: EdgeInsets.symmetric(horizontal: 10),

                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller.search,
                                  onChanged: (s) {
                                    controller.searchSchedule();
                                  },
                                  decoration: InputDecoration(
                                      hintText: "${'Search'.tr}.....",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.showSheet(context);
                                  },
                                  icon: Icon(Icons.filter_list_outlined))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          "${controller.chosen == 0 ? "Today" : controller.chosen == 1 ? "Previous" : "Upcoming"} Requests",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    controller.isLoading
                        ? SliverToBoxAdapter(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                            RequestNotePatient result =
                                controller.requests[index];
                            return InkWell(
                              onTap: () {
                                controller.toDoctorNoteScreen(result);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      width: Get.width,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Doctor Name : ',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                TextSpan(
                                                  text: '${result.dname}',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              ])),
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Patient Name : ',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                TextSpan(
                                                  text: '${result.pname}',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              ])),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Patient Complaint : ',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                TextSpan(
                                                  text: '${result.requestNote}',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              ])),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                                  text: 'Solution : ',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  children: [
                                                TextSpan(
                                                  text:
                                                      '${result.noteSolution}',
                                                  style: GoogleFonts.mukta(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                )
                                              ])),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                              text: TextSpan(
                                            text:
                                                '${formatDate(DateTime.parse(result.createdAt!))}',
                                            style: GoogleFonts.mukta(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }, childCount: controller.requests.length)),
                  ],
                ),
              ),
            )),
          );
        });
  }
}
