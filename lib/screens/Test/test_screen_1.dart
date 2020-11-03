import 'package:Cloudgrain_teacher/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:Cloudgrain_teacher/widgets/widgets.dart';
import 'package:flutter/services.dart';

class TestScreen_1 extends StatelessWidget {
  static const platform = const MethodChannel("com.flutter.epic/epic");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: BackAppBar(),
      body: Center(
        child: RaisedButton(
          child: Text("Click Me"),
          onPressed: () {
            Printy();
          },
        ),
      ),
    );
  }

  void Printy() async {
    String value;

    try {
      value = await platform.invokeMethod("Printy");
    } catch (e) {
      print(e);
    }

    print(value);
  }
}
