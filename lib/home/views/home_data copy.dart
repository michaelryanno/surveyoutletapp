import 'package:flutter/material.dart';
import 'package:survey_outlet_app/survey/survey.dart';
// import 'package:formz/formz.dart';
import 'package:survey_outlet_app/utils/auth/cache_manager.dart';

class HomeData extends StatelessWidget with CacheManager {
  const HomeData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: Container(
      //   padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 12,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       Flexible(
            //         // fit: FlexFit.tight,
            //         child: Container(
            //           padding: const EdgeInsets.all(8),
            //           child: Row(
            //             children: [
            //               Text("Welcome Back, ${getUser()}"),
            //             ],
            //           )
            //         )
            //       ),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       SizedBox(
            //         width: 15,
            //         height: 45,
            //         child: Container(
            //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(35/2)),
            //           clipBehavior: Clip.hardEdge,
            //           child: Image.asset('assets/icons/profile_icon.png'),
            //         )
            //         // child: Stack(
            //         //   children: [
            //         //     Container(
            //         //       child: Image.asset('assets/icons/profile_icons.png')
            //         //     )
            //         //   ],
            //         // ),
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 0),
            //   child: const SurveyPage()
            //   // child: SingleChildScrollView(child: SurveyPage()),
            // )
            Expanded( // wrap in Expanded
              child: ListView.separated(
                itemBuilder: (context, position) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'List Item $position',
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, position) {
                  return Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Separator $position',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              )
            )
          ],
        ),
      // )
    );
  }
}
