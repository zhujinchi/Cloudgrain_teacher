import 'package:Cloudgrain_teacher/screens/home_teacher/home_publishHomework.dart';
import 'package:Cloudgrain_teacher/widgets/RoundCheckBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class AssignHomeworkScreen extends StatefulWidget {
  @override
  _AssignHomeworkScreenState createState() => _AssignHomeworkScreenState();
}

class _AssignHomeworkScreenState extends State<AssignHomeworkScreen> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.8,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(155, 157, 161, 1),
          iconSize: 28.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '选择班级',
          style: TextStyle(
              color: Color.fromRGBO(59, 61, 79, 1),
              fontSize: 18.sp,
              fontFamily: 'PingFangSC-Medium'),
        ),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: 9,
          itemBuilder: (BuildContext context, int a) {
            return getRow(a);
          },
          separatorBuilder: (BuildContext context, int index) => new Divider(
            indent: 15.w,
            endIndent: 15.w,
            height: 1.w,
          ),
        ),
      ),
    );
  }

  Widget getRow(int a) {
    if (a == 8) {
      return Container(
        //padding: EdgeInsets.fromLTRB(
        //31.w, a > 8 ? 480.h - 512.w : 480.h - a * 64.w, 31.w, 0),
        padding: EdgeInsets.fromLTRB(31.w, 480.h - (a - 1) * 64.w, 31.w, 0),
        child: Container(
          //color: Colors.red,
          width: 313.w,
          height: 45.w,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: MaterialButton(
            child: Text(
              '确定',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'PingFangSC-Semibold',
                fontSize: 16.sp,
              ),
            ),

            color: Color.fromRGBO(0, 145, 255, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w)),
            //borderSide: BorderSide(color: Colors.orange, width: 1),
            onPressed: () {
              GotoPublishHomeworkScreen(context);
            },
          ),
        ),
      );
    } else {
      return InkWell(
          onTap: () {
            setState(() {
              this.check = !this.check;
            });
          },
          child: Container(
            width: 375.w,
            height: 64.w,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16.w, 0, 15.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '三年级2班',
                  style: TextStyle(
                    color: Color.fromRGBO(38, 38, 38, 1),
                    fontFamily: 'PingFangSC-Regular',
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: this.check
                          ? Color.fromRGBO(82, 157, 255, 1)
                          : Color.fromRGBO(238, 238, 238, 1)),
                  //child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: this.check
                      ? Icon(
                          Icons.check,
                          size: 15.w,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.brightness_1,
                          size: 15.w,
                          color: Color.fromRGBO(238, 238, 238, 1),
                        ),
                  //),
                ),
              ],
            ),
          ));
    }
  }

  void GotoPublishHomeworkScreen(BuildContext context) {
    Navigator.of(context).push(
        CupertinoPageRoute(builder: (context) => PublishHomeworkScreen()));
  }
}
