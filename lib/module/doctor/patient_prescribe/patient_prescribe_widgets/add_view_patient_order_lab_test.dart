import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kambaii_provider/model/doctor/lab_test/lab_test_names.dart';

import '../patient_prescribe_controller.dart';

class AddViewPatientOrderLabTest extends StatelessWidget {
  AddViewPatientOrderLabTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatientPrescribeController>(
        builder: (controller) {
          return ExpandablePanel(
            controller: controller.addViewPatientOrderExpandableController,

            collapsed: SizedBox.shrink(),
            expanded: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Text("Lab Test Name", style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 5,),

                  TypeAheadField(

                    textFieldConfiguration: TextFieldConfiguration(
                        controller: controller.labtestnameController,
                        autofocus: false,

                        style: DefaultTextStyle.of(context).style.copyWith(
                            fontStyle: FontStyle.italic
                        ),
                        decoration: InputDecoration(
                            labelText: 'Lab Test name',
                            border: OutlineInputBorder()
                        )
                    ),
                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },
                    suggestionsCallback: (pattern) async {
                      print(pattern);
                      List<LabTest> lst = [];
                      for (var element in controller.labtestsNames) {
                        if(element.testname!=null){
                          if(element.testname!.toLowerCase().contains(pattern.toLowerCase())){
                            lst.add(element);
                          }
                        }
                      }
                      return lst;
                    },
                    itemBuilder: (context, LabTest suggestion) {
                      return ListTile(
                        leading: const Icon(Icons.medical_services_outlined,size: 20,),
                        title: Text('${suggestion.testname}'),
                      );
                    },
                    onSuggestionSelected: (LabTest suggestion) {
                      //controller.medicineNameTradeController.text = suggestion;
                      controller.updateLabTests(suggestion);

                    },
                  ),
                  SizedBox(height: 10,),

                  Center(
                    child: Text("Lab Test Reason", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(height: 5,),

                  TextField(
                    controller: controller.labtestreasonController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Lab Test Reason',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 10,),

                  ElevatedButton(onPressed: (){

                    controller.addLabTest();

                  }, child: Text("Add")
                  ),

                  SizedBox(height: 20,),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.labtests.length,
                      itemBuilder: (context, index){

                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${controller.labtests[index].test_name}", style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),),
                            Text("${controller.labtests[index].reason}"),
                            Text("${DateFormat.yMd().format(DateTime.now())}"),


                          ],
                        ),
                      );

                      }
                  ),

                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.newLabTests.length,
                      itemBuilder: (context, index){

                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${controller.newLabTests[index].test_name}", style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),

                              IconButton(onPressed: (){
                                controller.deleteLabTest(index);
                              }, icon: Icon(Icons.delete_forever, color: Colors.red,))

                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text("${controller.newLabTests[index].reason}"),
                              Text("${DateFormat.yMd().format(DateTime.now())}"),

                            ],
                          ),
                        );

                      }
                  )

                ],
              ),
            ),
            theme: ExpandableThemeData(
                hasIcon: false,
                alignment: Alignment.center


            ),
            header: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add & View Patient Order Lab Test", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16
                    ),),
                    if(controller.newLabTests.isEmpty)
                      Icon(Icons.add_circle_outline_outlined, color: Colors.white,)
                    else
                      Icon(Icons.done, color: Colors.white,)
                  ],
                )
            ),
          );
        }
    );
  }
}
