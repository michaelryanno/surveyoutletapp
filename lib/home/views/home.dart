import 'package:flutter/material.dart';
import 'package:survey_outlet_app/home/home.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/survey/survey.dart';
import 'package:survey_outlet_app/loading/loading.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    return Obx(() => 
      Scaffold(
        appBar: AppBar(
          title:Text("Survey Outlet"),
          backgroundColor: Color.fromARGB(255, 255, 80, 64)
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    HomeHeader(),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        // child: HomeData(),
                        child: SurveyPage(),
                      )
                    ),
                    _submitButton(),
                    const SizedBox(
                      height: 18,
                    ),
                ]
              ),
              controller.isLoading.value ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: LoadingPage())
                  ]
                )
              : Padding(padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0))
            ]
          )
        )
      )
    );
  }
}

class _submitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    return 
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height / 2,
        height: 50,
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
                color: Color.fromARGB(255, 247, 246, 246),
              ),
            ),
          ),
        ),
      );
  }
}
