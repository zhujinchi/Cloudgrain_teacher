import 'package:Cloudgrain_teacher/screens/Test/test_screen_1.dart';
import 'package:Cloudgrain_teacher/screens/Test/test_screen_2.dart';
import 'package:Cloudgrain_teacher/screens/home_teacher/home_assignHomework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Cloudgrain_teacher/config/palette.dart';
import 'package:Cloudgrain_teacher/config/styles.dart';
import 'package:Cloudgrain_teacher/data/data.dart';
import 'package:Cloudgrain_teacher/widgets/programme.dart';
import 'package:Cloudgrain_teacher/widgets/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:ui' as ui;
import 'dart:async';

//import 'Pair.';

class HomeTeacherScreen extends StatefulWidget {
  @override
  _HomeTeacherScreenState createState() => _HomeTeacherScreenState();
}

class _HomeTeacherScreenState extends State<HomeTeacherScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          child: Container(
            width: 375.w,
            padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
            child: Text(
              '晚上好！肖老师',
              style: TextStyle(
                  color: Color.fromRGBO(66, 66, 66, 1),
                  fontSize: 20.sp,
                  fontFamily: 'PingFangSC-Medium'),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        elevation: 0.0,
      ),

      //内容区域
      body: CustomScrollView(
        //physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          //_buildGreeting(),
          _buildHomeworkerSet(context),
          _buildNotification(),
          _buildClassLabel(),
          _buildClassSelector(),
          _buildTimeSelector()
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildGreeting() {
    return SliverToBoxAdapter(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.w, 10.w, 0, 0),
          child: Text(
            '晚上好！肖老师',
            style: TextStyle(
                color: Color.fromRGBO(66, 66, 66, 1),
                fontSize: 20.sp,
                fontFamily: 'PingFangSC-Medium'),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHomeworkerSet(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => AssignHomeworkScreen()));
                },
                child: Container(
                  width: 170.w,
                  height: 134.w,
                  child: Image.asset(
                    'assets/images/home_bzzy@3x.png',
                    fit: BoxFit.fill,
                  ),
                  alignment: AlignmentDirectional.center,
                ),
              ),
              Container(
                width: 10.w,
                height: 68.w,
              ),
              Container(
                  height: 134.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 164.w,
                        height: 68.w,
                        child: Image.asset(
                          'assets/images/home_pgzy@3x.png',
                          fit: BoxFit.fitWidth,
                        ),
                        alignment: AlignmentDirectional.center,
                      ),
                      Container(
                        width: 164.w,
                        height: 60.w,
                        child: Image.asset(
                          'assets/images/home_ctj@3x.png',
                          fit: BoxFit.fitWidth,
                        ),
                        alignment: AlignmentDirectional.center,
                      )
                    ],
                  )),
            ],
          )),
    );
  }

  SliverToBoxAdapter _buildNotification() {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(16.w, 10.w, 16.w, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 33.w,
                height: 33.w,
                child: Image.asset('assets/images/home_notice@3x.png'),
                alignment: AlignmentDirectional.center,
              ),
              Container(
                width: 14.w,
                height: 33.w,
              ),
              Container(
                width: 296.w,
                height: 33.w,
                child: Container(
                  //margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: AspectRatio(
                    //设置图片宽高比为16：9
                    aspectRatio: 3 / 1,
                    child: new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                              //color: Colors.red,
                              height: 33.w,
                              padding: EdgeInsets.fromLTRB(0, 1.5.w, 0, 1.5.w),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  _showNotificationLabel('123', '456', true),
                                  _showNotificationLabel('123', '456', true),
                                ],
                              )),
                        );
                      },
                      itemCount: imageList.length,
                      //配置指示器
                      //pagination: new SwiperPagination(),
                      //配置左右箭头
                      //control: new SwiperControl(),
                      //scale: 0.96,
                      scrollDirection: Axis.vertical,
                      loop: true,
                      duration: 300,
                      //viewportFraction: 0.92,
                      autoplay: true,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _showNotificationLabel(String title, String text, bool isNew) {
    return Container(
      width: 289.w,
      height: 13.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 256.w,
            height: 13.w,
            child: Row(
              children: <Widget>[
                Text(
                  '【通知】',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.85),
                      fontSize: 9.sp,
                      fontFamily: 'PingFangSC-Medium'),
                ),
                Text(
                  //上限24字，带... 上限23个字
                  ' 三年级里班百里玄策刚刚提交数学作三年级里班里里...',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      color: Color.fromRGBO(123, 123, 123, 1),
                      fontSize: 9.sp,
                      fontFamily: 'PingFangSC-Medium'),
                ),
              ],
            ),
          ),
          Container(
              width: 28.w,
              height: 11.w,
              decoration: BoxDecoration(
                color: Color.fromRGBO(229, 0, 0, 1),
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Center(
                child: Text(
                  'New',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 6.sp,
                      fontFamily: 'PingFangSC-Regular'),
                ),
              ))
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildClassLabel() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(19.w, 19.w, 19.w, 0),
        child: Text(
          '班级统计',
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.85),
              fontSize: 15.sp,
              fontFamily: 'PingFangSC-Medium'),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildClassSelector() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(19.w, 10.w, 19.w, 0),
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
                '三年二班',
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
      ),
    );
  }

  SliverToBoxAdapter _buildTimeSelector() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        //padding: EdgeInsets.fromLTRB(0, 10.w, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              //后期代码优化
              width: 375.w,
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xFF0091FF),
                  indicatorWeight: 2.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Color(0xFF7B7B7B),
                  labelStyle:
                      TextStyle(color: Color(0xFF7B7B7B), fontSize: 15.sp),
                  labelColor: Colors.black,
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
              height: 381.w,
              child: TabBarView(
                  controller: this._tabController,
                  children: <Widget>[
                    StudyBoard(
                      timeSet: 1,
                      studyPlan: 1,
                      readScore: 1,
                      homeAccuracy: 1,
                      homeErrorRecovery: 1,
                      homeworkTime: '1223',
                    ),
                    StudyBoard(
                      timeSet: 1,
                      studyPlan: 1,
                      readScore: 1,
                      homeAccuracy: 1,
                      homeErrorRecovery: 1,
                      homeworkTime: '1223',
                    ),
                    StudyBoard(
                      timeSet: 1,
                      studyPlan: 1,
                      readScore: 1,
                      homeAccuracy: 1,
                      homeErrorRecovery: 1,
                      homeworkTime: '1223',
                    ),
                    StudyBoard(
                      timeSet: 1,
                      studyPlan: 1,
                      readScore: 1,
                      homeAccuracy: 1,
                      homeErrorRecovery: 1,
                      homeworkTime: '1223',
                    ),
                    StudyBoard(
                      timeSet: 1,
                      studyPlan: 1,
                      readScore: 1,
                      homeAccuracy: 1,
                      homeErrorRecovery: 1,
                      homeworkTime: '1223',
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
