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
    return SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              // color: Colors.green,
              // child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // row 1
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(7, 50, 0, 0),
                    //   child: Container(
                    //     width: 390,
                    //     height: 100,
                    //     // decoration: BoxDecoration(
                    //     //   border: Border.all(
                    //     //     width: 8,
                    //     //   ),
                    //     //   // color: Color(0xFF14181B),
                    //     // ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: <Widget>[
                    //         const Padding(
                    //           // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    //           padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    //           // child: Text('Nama Outlet'),
                    //           child: Text.rich(
                    //             TextSpan(
                    //               text: 'Nama Outlet',
                    //               children: <InlineSpan>[
                    //                 TextSpan(
                    //                   text: ' *',
                    //                   style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 23, 2)),
                    //                 )
                    //               ]
                    //             )
                    //           )
                    //         ),
                    //         Padding(
                    //           padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    //           child: TextField(
                    //               controller: controller.namaOutletController,
                    //             decoration: const InputDecoration(
                    //               border: UnderlineInputBorder(),
                    //               // labelText: 'Enter your username',
                    //             ),
                    //           ),
                    //         )
                    //       ]
                    //     )
                    //   )
                    // ),
                    // row 2
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(7, 50, 0, 0),
                      child: Container(
                        width: 390,
                        height: 100,
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     width: 8,
                        //   ),
                        //   // color: Color(0xFF14181B),
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                              // child: Text('Nama Pemilik Outlet'),
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
                                  // labelText: 'Enter your username',
                                ),
                              ),
                            )
                          ]
                        )
                      )
                    ),
                    // row 3
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(7, 50, 0, 0),
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
                      padding: EdgeInsetsDirectional.fromSTEB(7, 50, 0, 0),
                      child: const TipeOutlet()
                    ),
                  ]
                )
              // ),
            ),
            // _SubmitButton()
          ]
        )
      
    );
  }
}


class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    // return Obx(() =>
    // return FloatingActionButton(
    //     // onPressed: state.isValid
    //     // ? () {
    //     //     context.read<SurveyBloc>().add(const SurveySubmitted());
    //     //   }
    //     // : null,
    //     // onPressed: () { controller.submitLogin();},
    //     onPressed:() => {print("test")},
    //     foregroundColor: Color.fromARGB(255, 14, 10, 241),
    //     backgroundColor: Color.fromARGB(255, 14, 10, 241),
    //     // shape: BeveledRectangleBorder(
    //     //       borderRadius: BorderRadius.circular(35/2)
    //     // ),
    //     // child: const Icon(Icons.navigation),
    //     child: Text("Submit"),
    //   ); 
    // ); 
    return Obx(() => 
      !controller.isLoading.value ?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            // const Text('Extended'),
            const SizedBox(width: 16),
            // An example of the extended floating action button.
            //
            // https://m3.material.io/components/extended-fab/specs#686cb8af-87c9-48e8-a3e1-db9da6f6c69b
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: FloatingActionButton.extended(
                onPressed: () { controller.submitSurvey();},
                label: const Text('Add'),
                icon: const Icon(Icons.add),
              ),
            )
        ],
      ) : 
      Center(child: CircularProgressIndicator()),
    );
  }
}
