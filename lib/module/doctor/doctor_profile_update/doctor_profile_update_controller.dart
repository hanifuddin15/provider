import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kambaii_provider/core/local_data/local_data.dart';
import 'package:kambaii_provider/core/utils/urls.dart';
import 'package:kambaii_provider/model/doctor/doctor_profile_update/doctor_profile_update.dart';
import 'package:kambaii_provider/model/doctor/login_model/login_result_model.dart';
import 'package:kambaii_provider/module/doctor/doctor_change_password/change_password_controller.dart';
import 'package:kambaii_provider/module/doctor/doctor_home/doctor_home_screen.dart';

class DoctorProfileUpdateController extends GetxController{


  bool loading = false;
  DoctorProfile doctorProfile = Get.find();
  LocalData localData = Get.find();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emergencycontactController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController zoomIdController = TextEditingController();
  TextEditingController bmdcController = TextEditingController();
  TextEditingController zoomPasswordController = TextEditingController();
  TextEditingController dateofBirthController = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile? profileImage;

 
 String base64ProfileImage = ""; //commented by hanif

  XFile? bmdcImage;
  File? proimgfile ;
  //String bmdcbase64Image = "";  //commented by hanif

  int gender = 0;

  changeGender(int index){
    gender = index;
    update();
  }


  applyDefault(){

    firstnameController.text = doctorProfile.firstname!;
    update();
    lastnameController.text = doctorProfile.lastname!;
    update();
    phoneController.text = doctorProfile.mobile!;
    update();
    emailController.text = doctorProfile.email!;
    update();
    addressController.text = doctorProfile.address!;
    update();
    ageController.text = doctorProfile.age!.toString() ;
    update();
    emergencycontactController.text = doctorProfile.emergencyContactNumber!;
    update();
    zoomIdController.text = doctorProfile.generalInfo!.zoomId!;
    update();
    zoomPasswordController.text = doctorProfile.zoom_pass!;
    update();
    dateofBirthController.text = doctorProfile.dateOfBirth!;
    update();
    //bmdcController.text= doctorProfile.
    
    // if(doctorProfile.gender!.toLowerCase()=="male"){
    //   gender = 0;
    // }else{
    //   gender = 1;
    // }
    gender = (doctorProfile.gender?.toLowerCase() == "male") ? 0 : 1;
    update();

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    applyDefault();
  }

  void chooseImage(BuildContext context, bool profile){
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))),
        isScrollControlled: true,
        context: context,
        builder: (context){
          return Container(
            width: double.infinity,
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: ShapeDecoration(
                              color: Colors.indigo,
                              shape: const CircleBorder(),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImageFromGallery(profile);
                              },
                              icon: const Icon(
                                Icons.image_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        const Text('Gallery')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: ShapeDecoration(
                              color: Colors.indigo,
                              shape: const CircleBorder(),
                            ),
                            child: IconButton(
                              onPressed: () {
                                pickImageFromCamera(profile);
                              },
                              icon: const Icon(
                                Icons.camera,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        const Text('Camera')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  void pickImageFromCamera(bool profile) async {
    XFile? image = await picker.pickImage(source: ImageSource.camera,imageQuality: 100);
    //File imageFile = File(image!.path);
    if(profile){
      if(image != null){
        profileImage = image;
        doctorProfile.photo = image!.path; //by hanif
        base64ProfileImage = doctorProfile.photo! ;
       //  List<int> imageBytes = await profileImage!.readAsBytes(); // by hanif
        // base64ProfileImage = base64Encode(imageBytes); //by hanif
      }
    }else{
      if(image != null){
        bmdcImage = image;
       
       // List<int> imageBytes = await bmdcImage!.readAsBytes(); // by hanif
        //bmdcbase64Image = base64Encode(imageBytes); //by hanif
      }
    }

    update();
  }

  void pickImageFromGallery(bool profile) async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);

    if(profile){
      if(image != null){
         profileImage = image;
        // base64ProfileImage = profileImage!.path;
        //  doctorProfile.photo = profileImage!.path; 
        proimgfile = File(profileImage!.path);
        
       // List<int> imageBytes = await profileImage!.readAsBytes();
       // base64ProfileImage = base64Encode(imageBytes); by hanif
      }
    }else{
      if(image != null){
        bmdcImage = image;
      //  List<int> imageBytes = await bmdcImage!.readAsBytes();
      //  bmdcbase64Image = base64Encode(imageBytes); by hanif
      }
    }

    update();
  }

  deleteProfileImage(){
    profileImage = null;
   // base64ProfileImage = ""; // by hanif
    update();

  }

  deleteBmdcImage(){
    bmdcImage = null;
    //bmdcbase64Image = ""; // by hanif
    update();
  }

  updateProfile()async{

    loading = true;
    update();

    Uri url = Uri.parse(Urls.baseUrl+Urls.profile_update);

    try{
      
 var request =  MultipartRequest("POST", url);
  request.headers["Authorization"]= "Bearer ${localData.token}";
   request.headers["Accept"]= "application/json";
    request.fields['user_id'] = doctorProfile.id.toString();
    request.fields['first_name'] = firstnameController.text.trim();
    request.fields['last_name'] = lastnameController.text.trim();
    request.fields['email'] = emailController.text.trim();
    request.fields['phone'] = phoneController.text.trim();
    request.fields['date_of_birth'] = dateofBirthController.text.trim();
    request.fields['emergency_contact_number'] = emergencycontactController.text.trim();
    //request.fields['image'] = 'blah';
    request.fields['gender'] = gender==0?"Male":"Female";
    request.fields['age'] = ageController.text.trim();
    request.fields['address'] = addressController.text.trim();
    request.fields['zoom_id'] = zoomIdController.text.trim();
    request.fields['zoom_pass'] = zoomPasswordController.text.trim();
    request.fields['bmdc'] = bmdcController.text.trim();
   // request.fields['bmdc_certificate'] = bmdcImage;
    request.files.add( http.MultipartFile.fromBytes('image',  await proimgfile!.readAsBytes(), filename: "propic.jpg" ,contentType:  MediaType('image', 'jpg')));

    //request.send();

      // var response = await http.post(
      //     url,
      //     //body for live pfoile update by hanif
      //   body: {
      //       "user_id":doctorProfile.id.toString(),
      //     "first_name":firstnameController.text.trim(),
      //     "last_name":lastnameController.text.trim(),
      //     "email":emailController.text.trim(),
      //     "phone":phoneController.text.trim(),
      //     "date_of_birth" : dateofBirthController.text.trim(),
          
      //     "emergency_contact_number":emergencycontactController.text.trim(),
      //     "image":  file,//base64ProfileImage,          //profileImage,              //base64ProfileImage, // by hanif
      //     "gender":gender==0?"Male":"Female",
      //     "age":ageController.text.trim(),
      //     "address":addressController.text.trim(),
      //     "zoom_id":zoomIdController.text.trim(),
      //     "zoom_pass":zoomPasswordController.text.trim(),
      //     "bmdc":bmdcController.text.trim(),
      //     "bmdc_certificate":      bmdcImage,     //bmdcbase64Image  // by hanif
      //   },
      //   // end of live profile update by hanif
      //   // body: {
      //   //     "id":doctorProfile.id.toString(),
      //   //   "firstname":firstnameController.text.trim(),
      //   //   "lastname":lastnameController.text.trim(),
      //   //   "email":emailController.text.trim(),
      //   //   "mobile":phoneController.text.trim(),
      //   //   "emergency_contact_number":emergencycontactController.text.trim(),
      //   //   "photo":base64ProfileImage,
      //   //   "gender":gender==0?"Male":"Female",
      //   //  // "age":ageController.text.trim(),
      //   //   "address":addressController.text.trim(),
      //   // //  "zoom_id":zoomIdController.text.trim(),
      //   //   "zoom_pass":zoomPasswordController.text.trim(),
      //   //   "bmdc":bmdcController.text.trim(),
      //   //   "bmdc_certificate":bmdcbase64Image,
      //   //   "date_of_birth": dateofBirthController.text.trim(),
      //   // },
      //   headers: {
      //     "Accept":"application/json",
      //     "Authorization": "Bearer ${localData.token}",
      //   }
      // );
      var streamedResponse = await request.send();
var response = await http.Response.fromStream(streamedResponse);
      loading = false;
      update();
      var responseBody = jsonDecode(response.body);
       final Map<String, dynamic> body = await json.decode(response.body);
      var model = DoctorProfileUpdate.fromJson(body);
      if(model.data! !=null) {
        doctorProfile = model.data!;
      }
      update();
      // model.data

      if(response.statusCode==200){

        Get.offAll(()=>DoctorHomeScreen());

        Get.showSnackbar(GetSnackBar(
          title: 'Success',
          message: '${responseBody['msg']}',
          duration: Duration(seconds: 3),
        ));

      }else{
        Get.showSnackbar(GetSnackBar(
          title: 'Error',
          message: '${responseBody['msg']}',
          duration: Duration(seconds: 3),
        ));
      }

    }catch(e){
      print(e);
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: '$e',
        duration: Duration(seconds: 3),
      ));
      loading = false;
      //update();
    }
    finally {
      update();
    }

  }

}