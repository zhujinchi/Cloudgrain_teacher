import 'package:Cloudgrain_teacher/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:Cloudgrain_teacher/widgets/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class TestScreen_2 extends StatefulWidget {
  TestScreen_2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  TestScreen_2_State createState() => TestScreen_2_State();
}

class TestScreen_2_State extends State<TestScreen_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: BackAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 2,
            child: getMyPatformView(),
          ),
        ],
      ),
    );
  }

  Widget getMyPatformView() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'MyUiKitView',
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'MyUiKitView',
      );
    }

    return Text('$defaultTargetPlatform is not yet supported by this plugin');
  }
}
