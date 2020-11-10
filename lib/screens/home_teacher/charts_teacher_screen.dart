import 'dart:ui';

import 'package:Cloudgrain_teacher/screens/home_teacher/charts_brief_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherChartsScreen extends StatefulWidget {
  @override
  _TeacherChartsScreenState createState() => _TeacherChartsScreenState();
}

class _TeacherChartsScreenState extends State<TeacherChartsScreen>
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
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '作业统计',
          style: TextStyle(
              color: Color.fromRGBO(59, 61, 79, 1),
              fontSize: 18.sp,
              fontFamily: 'PingFangSC-Medium'),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.8,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey,
          iconSize: 28.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: _buildCheckSelector(),
      ),
    );
  }

  Container _buildCheckSelector() {
    return Container(
      color: Colors.white,
      //padding: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            //后期代码优化
            padding: EdgeInsets.only(top: 16.w),
            width: 375.w,
            height: 46.w,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Color(0xFF0091FF),
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Color.fromRGBO(13, 14, 16, 1),
                labelStyle: TextStyle(
                    color: Color.fromRGBO(0, 145, 255, 1), fontSize: 15.sp),
                labelColor: Color.fromRGBO(0, 145, 255, 1),
                controller: this._tabController,
                tabs: <Widget>[
                  Tab(text: '整体分析'),
                  Tab(text: '详情查看'),
                ]),
          ),
          Container(
            // 导航栏高度103
            height: 667.h - 46.w - 103,
            //后期代码优化
            child: TabBarView(
                controller: this._tabController,
                children: <Widget>[TeacherBriefCharts(), Container()]),
          )
        ],
      ),
    );
  }
}
