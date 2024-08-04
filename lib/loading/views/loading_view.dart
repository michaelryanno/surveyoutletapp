import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoadingPage());
  }

  @override
  Widget build(BuildContext context) {
    //  final mediaQuery = MediaQuery.of(context);
    //  final PreferredSizeWidget appBar = AppBar(
      // title: Text('Home'),
      // );
    return Container(
      // width: mediaQuery.size.width,
      // height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top),
      // height: MediaQuery.of(context).size.height - 88,
      // decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
      color: Colors.black.withOpacity(0.2),
      child: Stack(
        children: <Widget>[
          Center(
            child: CircularProgressIndicator()
          )
        ]
      )
    );
  }
}
