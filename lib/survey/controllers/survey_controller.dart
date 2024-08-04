import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_outlet_app/utils/auth/cache_manager.dart';
import 'package:survey_outlet_app/widgets/snackbar_widget.dart';
import 'package:google_repository/google_repository.dart';
import 'package:survey_outlet_app/survey/survey.dart';
import 'package:location_repository/location_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_drive/google_drive.dart';
import 'package:uploadfile_repository/uploadfile_repository.dart';
import 'package:survey_outlet_app/loading/loading.dart';

class SurveyController extends GetxController with CacheManager {
  // final _authManager = Get.put(AuthManager());
  
  var tipeOutlet = "SP Only".obs;
  RxBool isLoading = false.obs;
  var outletOperator = "".obs;
  RxBool isGetFile = false.obs;
  RxList listFile = List<File>.empty().obs; 
  // get from view
  late TextEditingController namaOutletController;
  late TextEditingController namaPemilikOutletController;
  late TextEditingController hpPemilikOutletController;

  @override
  void onInit() async {
    super.onInit();
    namaOutletController = TextEditingController();
    namaPemilikOutletController = TextEditingController();
    hpPemilikOutletController = TextEditingController();
  }

  @override
  void onClose(){
    namaOutletController.dispose();
    namaPemilikOutletController.dispose();
    hpPemilikOutletController.dispose();
    super.onClose();
  }

  void onSelectTipeOutlet(value) {
      tipeOutlet.value = value;
  }

  void onSelectedOperatorOutlet(value){
    outletOperator.value = value;
  }

  void pickAndUploadFile() async{
    // listFile = RxList<File>.empty();
    isLoading.value = true;
    // FilePickerResult? result = await FilePicker.platform.pickFiles();
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if(result != null){
      // File file = File(result.files.single.path!);
      List<File> files = result.paths.map((path) => File(path!)).toList();
      // var res = await UploadService().uploadFileToOdm(files); //old used
      // listFile = RxList<dynamic>.of(files);
      // listFile.addAll(files);
      listFile.value = files;
      // listFile.refresh();
      isLoading.value = false;
      // if(res){ //old used
      if(files.isNotEmpty){
        isGetFile.value = true;
        // SnackBarWidget(title: "Success", message: "Upload file success. Please continue to submit data", type: SnackBarType.success).show();
      }else{
        isGetFile.value = false;
        // SnackBarWidget(title: "Failed", message: "Failed to upload images", type: SnackBarType.error).show();
      }
    }else{
      isLoading.value = false;
    }
    
  }

  Future<void> submitSurvey() async {
    isLoading.value = true;
    
    if(namaOutletController.text.isEmpty){
      isLoading.value = false;
      SnackBarWidget(title: "Error", message: "Nama Outlet tidak boleh kosong", type: SnackBarType.error).show();
      return;
    }else if(namaPemilikOutletController.text.isEmpty){
      isLoading.value = false;
      SnackBarWidget(title: "Error", message: "Nama Pemilik Outlet tidak boleh kosong", type: SnackBarType.error).show();
      return;
    }else if(hpPemilikOutletController.text.isEmpty){
      isLoading.value = false;
      SnackBarWidget(title: "Error", message: "Nomor Hp Pemilik Outlet tidak boleh kosong", type: SnackBarType.error).show();
      return;
    }

    // for get link file
    List<File> tempFiles = listFile.cast<File>();
    // print(listFile);
    // temp_files = listFile.map( (u) => u).toList();
    // for(var i = 0; i < listFile.length; i++){
    //   temp_files[i]= listFile.value[i];
    // }
    // print(tempFiles);
    var res = await UploadService().uploadFileToOdm(tempFiles);
    if(!res["status"]){
      isLoading.value = false;
      SnackBarWidget(title: "Error", message: "File tidak dapat diupload. Upload service error", type: SnackBarType.error).show();
      return;
    }
    // for get link file

    CurrPosition currPosition = CurrPosition();
    var getLoc = await currPosition.getCurrentPosition();
    // print(getLoc?['latitude']);
    final postData = [
      {
        SheetDataFieldsModels.accounts: "${getUser()}",
        SheetDataFieldsModels.nama_outlet: "${namaOutletController.text}",
        SheetDataFieldsModels.nama_pemilik_outlet: "${namaPemilikOutletController.text}",
        SheetDataFieldsModels.nomor_hp_pemilik_outlet: "${hpPemilikOutletController.text}",
        SheetDataFieldsModels.tipe_outlet: "${tipeOutlet.value}",
        SheetDataFieldsModels.outlet_operator: "${outletOperator.value}",
        SheetDataFieldsModels.latitude: "${getLoc?['latitude']}",
        SheetDataFieldsModels.longitude: "${getLoc?['longitude']}",
        SheetDataFieldsModels.poto: "${res?['data']}",
      }
    ];
    // print(postData);
    var isPost = await postSurvey(postData);
    if(isPost){
      isLoading.value = false;
      SnackBarWidget(title: "Success", message: "Success Submit", type: SnackBarType.success).show();
    }else{
      isLoading.value = false;
      SnackBarWidget(title: "Error", message: "Authentication Fail", type: SnackBarType.error).show();
    }


    // ========not used =================
    // DataForm dataForm = DataForm(
    //   "${getUser()}",
    //   namaOutletController.text,
    //   namaPemilikOutletController.text,
    //   hpPemilikOutletController.text,
    //   "tipe outlet",
    //   getLoc?["latitude"],
    //   getLoc?["longitude"]
    // );

    // FormDataConnection formData = FormDataConnection();

    // // Submit 'feedbackForm' and save it in Google Sheets.
    // formData.submitForm(dataForm, (String response) {
    //   if (response == FormDataConnection.STATUS_SUCCESS) {
    //     isLoading.value = false;
    //     // Feedback is saved succesfully in Google Sheets.
    //     SnackBarWidget(title: "Success", message: "Success", type: SnackBarType.success).show();
    //   } else {
    //     isLoading.value = false;
    //     // Error Occurred while saving data in Google Sheets.
    //     SnackBarWidget(title: "Error", message: "Fail", type: SnackBarType.error).show();
    //   }
    // });
    // ========not used =================
    isLoading.value = false;
  }

  Future<dynamic> postSurvey(postData) async{
    var checkThis = false;
    // try {
      // check base of google sheets
      var alreadyPost = await AuthService.postData(postData);
      if(alreadyPost){
        checkThis = true;
      }
      return checkThis;
    // } catch (e) {
    //   return false;
    // }
  }
}