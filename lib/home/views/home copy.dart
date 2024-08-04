import 'package:flutter/material.dart';
import 'package:survey_outlet_app/home/home.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/survey/survey.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Survey Outlet"),
        backgroundColor: Color.fromARGB(255, 255, 80, 64)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              // child: HomeData(),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: _SubmitButton(),
            // ),
          ]
        )
      )
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    return Obx(() => 
      !controller.isLoading.value ?
      Row(
        children: <Widget>[
          Expanded(
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonTheme(
                  minWidth: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () { controller.submitSurvey();},
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 236, 5, 5),
                      ),
                    ),
                  ),
                ),
              ),
            )
          )
        ]
      ) : 
      Center(child: CircularProgressIndicator()),
    );
  }
}
