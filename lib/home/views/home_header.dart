import 'package:flutter/material.dart';
import 'package:survey_outlet_app/survey/survey.dart';
import 'package:survey_outlet_app/utils/auth/cache_manager.dart';
import 'package:survey_outlet_app/utils/auth/auth_manager.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget with CacheManager {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var _authManager = Get.put(AuthManager());
    return Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    // fit: FlexFit.tight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Text(
                            "Welcome Back, ${getUser()}",
                            style: TextStyle(
                              // color: Colors.blue[800],
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    )
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // SizedBox(
                  //   width: 15,
                  //   height: 45,
                  //   child: Container(
                  //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(35/2)),
                  //     clipBehavior: Clip.hardEdge,
                  //     child: Image.asset('assets/icons/profile_icon.png'),
                  //   )
                  //   // child: Stack(
                  //   //   children: [
                  //   //     Container(
                  //   //       child: Image.asset('assets/icons/profile_icons.png')
                  //   //     )
                  //   //   ],
                  //   // ),
                  // )
                  // CircleAvatar(
                  //   maxRadius: 15,
                  //   backgroundColor: Colors.black,
                  //   child: Icon(Icons.person, color: Colors.white, size: 15),
                  // ),

                  InkWell(
                    onTap: () => _authManager.onLogout(),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        // radius: 15.0,
                        maxRadius: 20,
                        child: Icon(
                          // controller.isIOSFaceId.value
                          //   ? Icons.face_unlock_rounded
                          //   : Icons.fingerprint,
                          Icons.logout,
                          size: 20,
                          color: Color.fromARGB(255, 248, 2, 2)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      // )
    );
  }
}
