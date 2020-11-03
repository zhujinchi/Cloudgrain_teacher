import 'package:flutter/material.dart';
import 'package:Cloudgrain_teacher/screens/bottom_teacher_screen.dart';
import 'package:Cloudgrain_teacher/screens/bottom_guidance_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class RegisterChooseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.red,
              height: 65.w,
              padding: EdgeInsets.fromLTRB(30, 32.w, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                '请选择您的身份',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.85),
                    fontSize: 24.sp,
                    fontFamily: 'PingFangSC-Regular'),
              ),
            ),
            Container(
              //color: Colors.green,
              height: 22.w,
              padding: EdgeInsets.fromLTRB(30.w, 6.w, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                '便于我们为您提供最佳服务',
                style: TextStyle(
                    color: Color.fromRGBO(155, 157, 161, 1),
                    fontSize: 11.sp,
                    fontFamily: 'PingFangSC-Regular'),
              ),
            ),
            _showGuidanceCard(context),
            _showTeacherCard(context),
          ],
        ),
      ),
    );
  }

  Widget _showGuidanceCard(BuildContext context) {
    return Container(
      height: 140.w,
      padding: EdgeInsets.fromLTRB(30.w, 34.w, 30.w, 0),
      child: new InkWell(
          //点击事件回调
          onTap: () {
            GotoMainScreen(context, false);
          },
          //不要在这里设置背景色，for则会遮挡水波纹效果,如果设置的话尽量设置Material下面的color来实现背景色
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(249, 249, 249, 1),
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 8.w),
                  width: 188.w,
                  height: 90.w,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/registered_Identity_illustration_a@3x.png',
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '我是大学生',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.85),
                                  fontSize: 18.sp,
                                  fontFamily: 'PingFangSC-Medium'),
                            ),
                            Text(
                              '家教兼职',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(155, 157, 161, 1),
                                  fontSize: 11.sp,
                                  fontFamily: 'PingFangSC-Medium'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15.w),
                  width: 33.w,
                  height: 90.w,
                  child: Image.asset(
                    'assets/icons/registered_Identity_icon_a@3x.png',
                    // width: 18.w,
                    // height: 18.w,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _showTeacherCard(BuildContext context) {
    return Container(
      height: 140.w,
      padding: EdgeInsets.fromLTRB(30.w, 34.w, 30.w, 0),
      child: new InkWell(
          //点击事件回调
          onTap: () {
            GotoMainScreen(context, true);
          },
          //不要在这里设置背景色，for则会遮挡水波纹效果,如果设置的话尽量设置Material下面的color来实现背景色
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(249, 249, 249, 1),
              borderRadius: BorderRadius.circular(5.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 8.w),
                  width: 196.w,
                  height: 90.w,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/registered_Identity_illustration_b@3x.png',
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '我是全职老师',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.85),
                                  fontSize: 18.sp,
                                  fontFamily: 'PingFangSC-Medium'),
                            ),
                            Text(
                              '轻松直播开课',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(155, 157, 161, 1),
                                  fontSize: 11.sp,
                                  fontFamily: 'PingFangSC-Medium'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15.w),
                  width: 33.w,
                  height: 90.w,
                  child: Image.asset(
                    'assets/icons/registered_Identity_icon_a@3x.png',
                    // width: 18.w,
                    // height: 18.w,
                  ),
                )
              ],
            ),
          )),
    );
  }

  void GotoMainScreen(BuildContext context, bool isTeacher) {
    if (isTeacher) {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => BottomTeacherScreen()));
    } else {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => BottomGuidanceScreen()));
    }
  }
}
