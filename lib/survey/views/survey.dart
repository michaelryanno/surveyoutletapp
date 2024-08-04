import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/survey/survey.dart';
import 'package:formz/formz.dart';
import 'package:flutter/services.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        // row 1
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
          child: Container(
            width: 390,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: Text.rich(
                    TextSpan(
                      text: 'Nama Outlet',
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' *',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 23, 2)),
                        )
                      ]
                    )
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: TextField(
                    controller: controller.namaOutletController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                )
              ]
            )
          )
        ),
        // row 2
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            width: 390,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: Text.rich(
                    TextSpan(
                      text: 'Nama Pemilik Outlet',
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' *',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 23, 2)),
                        )
                      ]
                    )
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: TextField(
                    controller: controller.namaPemilikOutletController,
                    decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    ),
                  ),
                )
              ]
            )
          )
        ),
        // row 3
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            width: 390,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: Text.rich(
                    TextSpan(
                      text: 'Nomor HP Pemilik Outlet',
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' *',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 23, 2)),
                        )
                      ]
                    )
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                  child: TextField(
                    controller: controller.hpPemilikOutletController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      // labelText: 'Enter your username',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                    ], 
                  ),
                )
              ]
            )
          )
        ),
        // row 4
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: const TipeOutlet()
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: const OutletOperator()
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
          child: const FileUpload()
        ),
      ],
    );
  }
}