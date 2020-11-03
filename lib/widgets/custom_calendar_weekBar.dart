import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

class CustomStyleWeekBarItem extends BaseWeekBar {
  List<String> weekList = ["mo", "tu", "we", "th", "fr", "sa", "su"];

  //可以直接重写build方法，weekbar底部添加下划线
  @override
  Widget build(BuildContext context) {
    List<Widget> children = List();

    var items = getWeekDayWidget();
    children.add(Row(
      children: items,
    ));
    children.add(Divider(
      color: Colors.grey,
    ));
    return Column(
      children: children,
    );
  }

  @override
  Widget getWeekBarItem(int index) {
    return new Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: new Center(
        child: new Text(
          weekList[index],
          style:
              TextStyle(fontWeight: FontWeight.w700, color: Color(0xffC5BCDC)),
        ),
      ),
    );
  }
}
