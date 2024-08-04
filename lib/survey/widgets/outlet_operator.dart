import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_outlet_app/survey/survey.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

/// Flutter code sample for [Radio].

class OutletOperator extends StatelessWidget {
  const OutletOperator({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OutletOperatorShow()
    );
  }
}

class OutletOp {
  final int id;
  final String name;

  OutletOp({
    this.id = 0,
    this.name = "",
  });
}

class OutletOperatorShow extends StatefulWidget {
  const OutletOperatorShow({super.key});

  @override
  State<OutletOperatorShow> createState() => _OutletOperatorState();
}

class _OutletOperatorState extends State<OutletOperatorShow> {
  static List<OutletOp> _outlets = [
    OutletOp(id: 1, name: "Smartfren"),
    OutletOp(id: 2, name: "Telkomsel"),
    OutletOp(id: 3, name: "XL"),
    OutletOp(id: 4, name: "Indosat"),
    OutletOp(id: 5, name: "3"),
    OutletOp(id: 6, name: "Axis"),
  ];
  final _items = _outlets
      .map((outlet) => MultiSelectItem<OutletOp>(outlet, outlet.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<OutletOp> _selectedOutlets2 = [];
  List<OutletOp> _selectedOutlets3 = [];
  //List<Animal> _selectedOutlets4 = [];
  List<OutletOp> _selectedOutlets5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedOutlets5 = _outlets;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SurveyController());
   return SingleChildScrollView(
    child: Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          // SizedBox(height: 40),
          //################################################################################################
          // Rounded blue MultiSelectDialogField
          //################################################################################################
          // MultiSelectDialogField(
          //   items: _items,
          //   title: Text("Outlet Operator"),
          //   selectedColor: Colors.blue,
          //   decoration: BoxDecoration(
          //     color: Colors.blue.withOpacity(0.1),
          //     borderRadius: BorderRadius.all(Radius.circular(40)),
          //     border: Border.all(
          //       color: Colors.blue,
          //       width: 2,
          //     ),
          //   ),
          //   buttonIcon: Icon(
          //     Icons.pets,
          //     color: Colors.blue,
          //   ),
          //   buttonText: Text(
          //     "Favorite Animals",
          //     style: TextStyle(
          //       color: Colors.blue[800],
          //       fontSize: 16,
          //     ),
          //   ),
          //   onConfirm: (results) {
          //     //_selectedAnimals = results;
          //   },
          // ),
          // SizedBox(height: 50),
          //################################################################################################
          // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
          // decoration applied. This allows the ChipDisplay to render inside the same Container.
          //################################################################################################
          // Container(
          //   decoration: BoxDecoration(
          //     color: Theme.of(context).primaryColor.withOpacity(.4),
          //     border: Border.all(
          //       color: Theme.of(context).primaryColor,
          //       width: 2,
          //     ),
          //   ),
          //   child: Column(
          //     children: <Widget>[
          //       MultiSelectBottomSheetField(
          //         initialChildSize: 0.4,
          //         listType: MultiSelectListType.CHIP,
          //         searchable: true,
          //         buttonText: Text("Favorite Animals"),
          //         title: Text("Animals"),
          //         items: _items,
          //         onConfirm: (values) {
          //           // _selectedOutlets2 = values;
          //           _selectedOutlets2 = [];
          //         },
          //         chipDisplay: MultiSelectChipDisplay(
          //           onTap: (value) {
          //             setState(() {
          //               _selectedOutlets2.remove(value);
          //             });
          //           },
          //         ),
          //       ),
          //       _selectedOutlets2 == null || _selectedOutlets2.isEmpty
          //           ? Container(
          //               padding: EdgeInsets.all(10),
          //               alignment: Alignment.centerLeft,
          //               child: Text(
          //                 "None selected",
          //                 style: TextStyle(color: Colors.black54),
          //               ))
          //           : Container(),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 40),
          //################################################################################################
          // MultiSelectBottomSheetField with validators
          //################################################################################################
          // MultiSelectBottomSheetField<OutletOp>(
          //   key: _multiSelectKey,
          //   initialChildSize: 0.7,
          //   maxChildSize: 0.95,
          //   title: Text("Animals"),
          //   buttonText: Text("Favorite Animals"),
          //   items: _items,
          //   searchable: true,
          //   validator: (values) {
          //     if (values == null || values.isEmpty) {
          //       return "Required";
          //     }
          //     List<String> names = values.map((e) => e.name).toList();
          //     if (names.contains("Frog")) {
          //       return "Frogs are weird!";
          //     }
          //     return null;
          //   },
          //   onConfirm: (values) {
          //     setState(() {
          //       _selectedOutlets3 = values;
          //     });
          //     _multiSelectKey.currentState?.validate();
          //   },
          //   chipDisplay: MultiSelectChipDisplay(
          //     onTap: (item) {
          //       setState(() {
          //         _selectedOutlets3.remove(item);
          //       });
          //       _multiSelectKey.currentState?.validate();
          //     },
          //   ),
          // ),
          // SizedBox(height: 40),
          //################################################################################################
          // MultiSelectChipField
          //################################################################################################
          // MultiSelectChipField(
          //   items: _items,
          //   initialValue: [_outlets[1], _outlets[3], _outlets[5]],
          //   title: Text("Animals"),
          //   headerColor: Colors.blue.withOpacity(0.5),
          //   decoration: BoxDecoration(
          //     // border: Border.all(color: Colors.blue[700], width: 1.8),
          //     border: Border.all(color: Colors.blue),
          //   ),
          //   selectedChipColor: Colors.blue.withOpacity(0.5),
          //   selectedTextStyle: TextStyle(color: Colors.blue[800]),
          //   onTap: (values) {
          //     //_selectedAnimals4 = values;
          //   },
          // ),
          // SizedBox(height: 40),
          //################################################################################################
          // MultiSelectDialogField with initial values
          //################################################################################################
          MultiSelectDialogField(
            buttonText: Text(
              "Outlet Operator",
              style: TextStyle(
                // color: Colors.blue[800],
                fontSize: 14,
              ),
            ),
            onConfirm: (val) {
              _selectedOutlets5 = val;
              // print(_selectedOutlets5[0].name);
              var ss = val.map((outlet) => outlet.name).toString();
              // var new_ss = ss.replaceAll(RegExp('\\(.*?\\)'), '');
              ss = ss.replaceAll(RegExp('[^A-Za-z0-9, ]'), '');
              controller.onSelectedOperatorOutlet(ss);
            },
            dialogWidth: MediaQuery.of(context).size.width * 0.7,
            items: _items,
            // initialValue: _selectedOutlets5, // setting the value of this in initState() to pre-select values.
          ),
        ],
      ),
    )
  );  
  }
}
