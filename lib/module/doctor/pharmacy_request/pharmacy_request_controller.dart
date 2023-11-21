import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../core/local_data/local_data.dart';
import '../../../core/utils/urls.dart';
import '../../../model/request_note_patient_info/request_note_patient_info.dart';
import 'doctors_note_screen.dart';

class PharmacyRequestController extends GetxController {
  bool isLoading = false;

  List<RequestNotePatient> requests = [];
  List<RequestNotePatient> allRequests = [];
  LocalData localData = Get.find();
  RequestNotePatient selectedPatient = RequestNotePatient();
  TextEditingController note_solution_controller = TextEditingController();
  List<RequestNotePatient> patient_requests = [];

  int chosen = 0;
  bool newNote = true;

  List<String> filterList = ["All", "Pending", "In-process", "Complete"];

  String filterStatus = "All";

  changeChosen(int index) {
    chosen = index;
    fetchRequests(index == 0
        ? "today"
        : index == 1
            ? "previous"
            : "served");
    update();
  }

  changeNewNote(bool b) {
    newNote = b;
    if (!newNote) {
      fetchPatientRequests();
    }
    update();
  }

  TextEditingController search = TextEditingController();

  searchSchedule() {
    fetchRequests(chosen == 0
        ? "today"
        : chosen == 1
            ? "previous"
            : "served");
    update();
  }

  showSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GetBuilder<PharmacyRequestController>(builder: (controller) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Filter Status".tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.filterList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              controller.changePatientFilter(
                                  controller.filterList[index]);
                            },
                            leading: Checkbox(
                                value: controller.filterStatus ==
                                    controller.filterList[index],
                                onChanged: (b) {
                                  controller.changePatientFilter(
                                      controller.filterList[index]);
                                }),
                            title: Text("${controller.filterList[index]}"),
                          );
                        }),
                  ),
                ],
              ),
            );
          });
        });
  }

  changePatientFilter(String lst) {
    filterStatus = lst;
    if (filterStatus == filterList[0]) {
      requests = allRequests;
    } else {
      requests = allRequests
          .where((element) => element.status == filterStatus)
          .toList();
    }
    update();
  }

  /*fetchIndividualStatus(int id) async {
    var body;
    Uri url =
        Uri.parse(Urls.baseUrl + Urls.individual_schedule_status + "/${id}");

    try {
      var response = await get(url, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${localData.token}",
      });
      body = jsonDecode(response.body);
      print(body);

      if (response.statusCode == 200) {
        try {} catch (e) {
          print(e);
        }
      } else {}
    } catch (e) {
      print(e);
    }

    return body;
  }*/

  fetchRequests(String type) async {
    isLoading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl + Urls.pharmacist_request);

    try {
      var response = await post(url, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${localData.token}",
      }, body: {
        "doctor_id": localData.userId.toString(),
        "filter": type,
        "search_keyword": search.text.isEmpty ? "" : search.text.trim()
      });
      var body = jsonDecode(response.body);
      print(body);

      if (response.statusCode == 200) {
        isLoading = false;
        update();
        try {
          RequestNotePatientInfoResult result =
              RequestNotePatientInfoResult.fromJson(body);
          allRequests = result.data!;
          requests = allRequests;
          changePatientFilter(filterStatus);
          update();
        } catch (e) {
          print(e);
        }
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchRequests("present");
    super.onInit();
  }

  toDoctorNoteScreen(RequestNotePatient requestNotePatient) {
    selectedPatient = requestNotePatient;
    try {
      note_solution_controller.text = selectedPatient.noteSolution!;
    } catch (e) {}
    update();
    Get.to(() => const DoctorsNoteScreen());
  }

  fetchPatientRequests() async {
    isLoading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl + Urls.pharmacist_request);

    try {
      var response = await post(url, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${localData.token}",
      }, body: {
        "patient_id": selectedPatient.patientId.toString(),
      });
      var body = jsonDecode(response.body);
      print(body);

      if (response.statusCode == 200) {
        isLoading = false;
        update();
        try {
          RequestNotePatientInfoResult result =
              RequestNotePatientInfoResult.fromJson(body);
          patient_requests = result.data!;

          update();
        } catch (e) {
          print(e);
        }
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  createPatientNote() async {
    if (note_solution_controller.text.isEmpty) {
      Get.snackbar('Warning', 'Please Enter something in solution',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    isLoading = true;
    update();
    Uri url = Uri.parse(Urls.baseUrl + Urls.doctor_submit_request);

    try {
      var response = await post(url, headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${localData.token}",
      }, body: {
        "note_id": selectedPatient.id.toString(),
        "note_solution": note_solution_controller.text.trim()
      });
      var body = jsonDecode(response.body);
      print(body);

      if (response.statusCode == 200) {
        isLoading = false;
        update();
        try {
          Get.snackbar('Success', '${body['msg']}',
              backgroundColor: Colors.green, colorText: Colors.white);
          changeNewNote(false);
          update();
        } catch (e) {
          print(e);
        }
      } else {
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }
}
