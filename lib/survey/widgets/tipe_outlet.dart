import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_outlet_app/survey/survey.dart';

/// Flutter code sample for [Radio].

class TipeOutlet extends StatelessWidget {
  const TipeOutlet({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: Scaffold(
    //     body: const Center(
    //       child: TipeOutletShow(),
    //     ),
    //   ),
    // );
    return SafeArea(
      child: TipeOutletShow()
    );
  }
}

enum TipeOutletChoose { sp_only, voucher_only, sp_plus_voucher }

extension TipeOutletChooseExtension on TipeOutletChoose {
  static const Map<TipeOutletChoose, dynamic> _map = {
    TipeOutletChoose.sp_only: "SP Only",
    TipeOutletChoose.voucher_only: "Voucher only (VD/E-Load)",
    TipeOutletChoose.sp_plus_voucher: "SP + VD/E-Load",
  };

  String get getTipeOutletName {
    switch (_map[this]) {
      case TipeOutletChoose.sp_only:
        return "SP Only";
      case TipeOutletChoose.voucher_only:
        return "Voucher only (VD/E-Load)";
      case TipeOutletChoose.sp_plus_voucher:
        return "SP + VD/E-Load";
    }
    return "SP Only";
  }
}

class TipeOutletShow extends StatefulWidget {
  const TipeOutletShow({super.key});

  @override
  State<TipeOutletShow> createState() => _TipeOutletState();
}

class _TipeOutletState extends State<TipeOutletShow> {
  TipeOutletChoose? _tipeoutlet = TipeOutletChoose.sp_only;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
    // controller.tipeOutlet.value = "SP Only";
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // row 1
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Container(
              width: 390,
              height: 200,
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
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Text.rich(
                      TextSpan(
                        text: 'Tipe Outlet',
                      )
                    )
                  ),
                  ListTile(
                    // dense: true,
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                    title: const Text('SP Only'),
                    leading: Radio<TipeOutletChoose>(
                      value: TipeOutletChoose.sp_only,
                      groupValue: _tipeoutlet,
                      onChanged: (TipeOutletChoose? value) {
                        // controller.tipeOutlet.value = "SP Only";
                        controller.onSelectTipeOutlet("SP Only");
                        setState(() {
                          _tipeoutlet = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    // dense: true,
                    // minLeadingWidth : 10,
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                    // contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                    title: const Text('Voucher only (VD/E-Load)'),
                    leading: Radio<TipeOutletChoose>(
                      value: TipeOutletChoose.voucher_only,
                      groupValue: _tipeoutlet,
                      onChanged: (TipeOutletChoose? value) {
                        // controller.tipeOutlet.value = "Voucher only (VD/E-Load)";
                        controller.onSelectTipeOutlet("Voucher only (VD/E-Load)");
                        setState(() {
                          _tipeoutlet = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    // dense: true,
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                    title: const Text('SP + VD/E-Load'),
                    leading: Radio<TipeOutletChoose>(
                      value: TipeOutletChoose.sp_plus_voucher,
                      groupValue: _tipeoutlet,
                      onChanged: (TipeOutletChoose? value) {
                        // controller.tipeOutlet.value = "SP + VD/E-Load";
                        controller.onSelectTipeOutlet("SP + VD/E-Load");
                        setState(() {
                          _tipeoutlet = value;
                        });
                      },
                    ),
                  ),
                ],
              )
            )
          )
        ]
      
    );
  }

  // void onChanged(TipeOutletChoose? value) {
  //   setState((){
  //     _tipeoutlet = value;
  //   });

  //   print('Value = $value');
  // }
}
