import 'dart:ui';
import 'package:Cloudgrain_teacher/screens/home_teacher/charts_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherBriefCharts extends StatefulWidget {
  @override
  _TeacherBriefChartsState createState() => _TeacherBriefChartsState();
}

class _TeacherBriefChartsState extends State<TeacherBriefCharts>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return Scaffold(
      // body: Column(
      //   children: <Widget>[_buildClassSelector(), _buildTimeSelector()],
      // ),
      body: Column(
        children: <Widget>[_buildClassSelector(), _buildTimeSelector()],
      ),
    );
  }

  Container _buildClassSelector() {
    return Container(
      height: 39.w,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              '当前班级',
              style: TextStyle(
                  color: Color.fromRGBO(88, 88, 88, 0.85),
                  fontSize: 15.sp,
                  fontFamily: 'PingFangSC-Regular'),
            ),
          ),
          Container(
            child: Text(
              '：',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.85),
                  fontSize: 15.sp,
                  fontFamily: 'PingFangSC-Regular'),
            ),
          ),
          Container(
            child: Text(
              '三年2班',
              style: TextStyle(
                  color: Color.fromRGBO(0, 145, 255, 1),
                  fontSize: 15.sp,
                  fontFamily: 'PingFangSC-Regular'),
            ),
          ),
          //选择器
          Container()
        ],
      ),
    );
  }

  Container _buildTimeSelector() {
    return Container(
      //height: 41.w,
      color: Colors.white,
      //padding: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            //后期代码优化
            width: 375.w,
            height: 41.w,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Color.fromRGBO(104, 212, 185, 1),
                indicatorWeight: 2.0,
                //indicatorPadding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 10.w),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Color.fromRGBO(123, 123, 123, 1),
                labelStyle: TextStyle(
                    color: Color.fromRGBO(104, 212, 185, 1), fontSize: 15.sp),
                labelColor: Color.fromRGBO(104, 212, 185, 1),
                controller: this._tabController,
                tabs: <Widget>[
                  Tab(text: ' 当日 '),
                  Tab(text: ' 本周 '),
                  Tab(text: ' 本月 '),
                  Tab(text: '本学期 '),
                  Tab(text: ' 本年 '),
                ]),
          ),
          Container(
            //后期代码优化
            height: 667.h - 126.w - 103,
            child: TabBarView(
                controller: this._tabController,
                children: <Widget>[
                  ChartsBoard(),
                  ChartsBoard(),
                  ChartsBoard(),
                  ChartsBoard(),
                  ChartsBoard()
                ]),
          )
        ],
      ),
    );
  }
}
