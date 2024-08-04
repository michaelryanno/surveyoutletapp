import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/survey/survey.dart';
import 'package:survey_outlet_app/loading/loading.dart';

/// Flutter code sample for [Radio].

class FileUpload extends StatelessWidget {
  const FileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FileUploadShow()
    );
  }
}

class FileUploadShow extends StatefulWidget {
  const FileUploadShow({super.key});

  @override
  State<FileUploadShow> createState() => _fileUploadState();
}

class _fileUploadState extends State<FileUploadShow> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    // controller.update();
    // controller.tipeOutlet.value = "SP Only";
    return 
      // TextButton(
      //   onPressed: () => controller.pickAndUploadFile(),
      //   child: const Text('Choose Image'),
      // );
      // Obx(() => 
        Container(
          // child: Stack(
          //   children: <Widget>[
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                    child: 
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file),
                          Text('Choose Image')
                        ],
                      ),
                      onPressed: () => controller.pickAndUploadFile(),
                      // child: const Text('Choose Image'),
                      // icon: Icon(Icons.upload_file),
                      // label: Text('Choose Image'),
                      style: ElevatedButton.styleFrom(
                        // padding: EdgeInsets.all(20.0),
                        // fixedSize: Size(100, 60),
                        textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        // primary: Color(0xffb74093),
                        primary: Color.fromARGB(255, 177, 85, 150),
                        // onPrimary: Colors.black,
                        // elevation: 10,
                        shadowColor: Color.fromARGB(255, 177, 85, 150),
                        shape: StadiumBorder()
                      ),
                    )
                  ),
                  Obx(() => controller.isGetFile.value && controller.listFile.isNotEmpty ? 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(5),
                        children: [
                          ...controller.listFile.map( (u) => 
                            ListTile(
                              title: Text(u.path),
                              titleTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 23, 2)),
                            ),
                          )
                        ]
                      ),
                    )
                  : Padding(padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0))
                  )
                ]
              ),
          //   ]
          // ) 
        // )
      );
  }
}

class _listFileUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    return 
          // ListView(
          //   shrinkWrap: true,
          //   padding: EdgeInsets.all(5),
          //   children: [
          //     // ...controller.listFile.map( (u) => 
          //     ListTile(
          //     // child: new List.generate(
          //       controller.listFile.length,
          //       (index) => new ListTile(
          //         title: Text('${controller.listFile[index].path}'),
          //         titleTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 23, 2)),
          //       ),
          //     ),
          //   // )
          //   ]
          // )
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            children: [
              // Obx(() => controller.listFile.isNotEmpty ?
                ...controller.listFile.map( (u) => 
                  ListTile(
                    title: Text(u.path),
                    titleTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 23, 2)),
                  ),
                )
              //   : Padding(padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0))
              // ),
            ]
          );
      // : Padding(padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0));
  }
}
