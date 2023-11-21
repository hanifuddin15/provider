import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kambaii_provider/model/request_note_patient_info/request_note_patient_info.dart';
import 'package:kambaii_provider/module/doctor/pharmacy_request/pharmacy_request_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/utils/date_format.dart';

class DoctorsNoteScreen extends StatelessWidget {
  const DoctorsNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PharmacyRequestController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "Doctor’s Note".tr,
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
              controller.fetchPatientRequests();
            },
            child: ModalProgressHUD(
              inAsyncCall: controller.isLoading,
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
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'Name: ',
                                    style: GoogleFonts.mukta(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                    children: [
                                  TextSpan(
                                      text:
                                          '${controller.selectedPatient.pname}',
                                      style: GoogleFonts.mukta(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))
                                ])),
                            RichText(
                                text: TextSpan(
                                    text: 'ID: ',
                                    style: GoogleFonts.mukta(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                    children: [
                                  TextSpan(
                                      text:
                                          '${controller.selectedPatient.patientId}',
                                      style: GoogleFonts.mukta(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))
                                ])),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        const Divider(
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: controller.newNote
                        ? SizedBox(
                            height: 20,
                          )
                        : SizedBox.shrink(),
                  ),
                  SliverToBoxAdapter(
                      child: controller.newNote
                          ? Container(
                              padding: EdgeInsets.all(10),
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Color(0xff465771).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Color(0xff465771))),
                              child: RichText(
                                  text: TextSpan(
                                      text: 'Patient Complaint: ',
                                      style: GoogleFonts.mukta(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800),
                                      children: [
                                    TextSpan(
                                      text:
                                          '${controller.selectedPatient.requestNote}',
                                      style: GoogleFonts.mukta(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ])),
                            )
                          : const SizedBox.shrink()),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.changeNewNote(true);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: controller.newNote
                                    ? Color(0xff035978)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: controller.newNote
                                        ? Colors.white
                                        : Colors.black)),
                            child: Center(
                                child: Text(
                              "New".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: controller.newNote
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeNewNote(false);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: !controller.newNote
                                    ? Color(0xff035978)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: !controller.newNote
                                        ? Colors.white
                                        : Colors.black)),
                            child: Center(
                                child: Text(
                              "Previous".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: !controller.newNote
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  controller.newNote
                      ? SliverToBoxAdapter(
                          child: Column(
                            children: [
                              TextField(
                                controller: controller.note_solution_controller,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    hintText: 'write down....',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  // controller.changeChosen(0);
                                  controller.createPatientNote();
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
                                    "Create".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: controller.chosen == 0
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                              childCount: controller.patient_requests.length,
                              (context, index) {
                          RequestNotePatient result =
                              controller.patient_requests[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              children: [
                                Container(
                                  width: Get.width,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: 'Patient Complaint : ',
                                              style: GoogleFonts.mukta(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              children: [
                                            TextSpan(
                                              text: '${result.requestNote}',
                                              style: GoogleFonts.mukta(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            )
                                          ])),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Note : ',
                                              style: GoogleFonts.mukta(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              children: [
                                            TextSpan(
                                              text: '${result.noteSolution}',
                                              style: GoogleFonts.mukta(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            )
                                          ])),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              text: 'Doctor : ',
                                              style: GoogleFonts.mukta(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                              children: [
                                            TextSpan(
                                              text: '${result.dname}',
                                              style: GoogleFonts.mukta(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
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
                          );
                        }))
                ],
              ),
            ),
          ),
        )),
      );
    });
  }
}
