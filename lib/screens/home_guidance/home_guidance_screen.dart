import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Cloudgrain_teacher/screens/home_guidance/guidance_lineChart.dart';

class HomeGuidanceScreen extends StatefulWidget {
  @override
  _HomeGuidanceScreenState createState() => _HomeGuidanceScreenState();
}

class _HomeGuidanceScreenState extends State<HomeGuidanceScreen>
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
              '晚上好！张老师',
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
          _buildHomeworkerSet(),
          _buildNotification(),
          _buildClassLabel(),
          _buildClassSelector(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHomeworkerSet() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 138.w,
        padding: EdgeInsets.fromLTRB(16.w, 5.w, 16.w, 0),
        color: Colors.white,
        child: Image.asset(
          'assets/images/home_people_illustration@3x.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildNotification() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 80.w,
        padding: EdgeInsets.fromLTRB(16.w, 3.w, 16.w, 0),
        color: Colors.white,
        child: Image.asset(
          'assets/images/home_pgzy_entrance@3x.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildClassLabel() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 131.w,
        padding: EdgeInsets.fromLTRB(16.w, 1.w, 16.w, 0),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            print('object');
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.w),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(224, 224, 224, 0.5),
                      offset: Offset(0, 2.w), //阴影xy轴偏移量
                      blurRadius: 7.w, //阴影模糊程度
                      spreadRadius: 0 //阴影扩散程度
                      )
                ]),
            child: Column(
              children: <Widget>[
                //作业统计标题
                Container(
                  padding: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //作业统计标题
                      Container(
                        width: 62.w,
                        height: 21.w,
                        child: Text(
                          '作业统计',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.85),
                              fontSize: 15.sp,
                              fontFamily: 'PingFangSC-Medium'),
                        ),
                      ),
                      //点击按钮
                      Container(
                        width: 15.w,
                        height: 15.w,
                        child: Image.asset('assets/images/home_click@2x.png'),
                        alignment: AlignmentDirectional.center,
                      )
                    ],
                  ),
                ),
                //正确率 & 纠错率
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15.w, 0, 20.w),
                  child: Row(
                    children: <Widget>[
                      //正确率
                      Container(
                        padding: EdgeInsets.only(left: 35.w),
                        width: 171.5.w,
                        height: 51.w,
                        child: Row(
                          children: <Widget>[
                            //比例图
                            Container(
                              // width: 45.w,
                              // height: 45.w,

                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 43.w,
                                    height: 43.w,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Color.fromRGBO(38, 132, 255, 1)),
                                      backgroundColor:
                                          Color.fromRGBO(233, 237, 255, 1),
                                      value: 0.67,
                                      strokeWidth: 7.w,
                                    ),
                                  ),
                                  new Positioned(
                                      left: 8.w,
                                      top: 8.w,
                                      child: Container(
                                        width: 27.w,
                                        height: 27.w,
                                        child: Center(
                                          child: Text(
                                            '86%',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    13, 14, 16, 1),
                                                fontSize: 10.sp,
                                                fontFamily:
                                                    'PingFangSC-Medium'),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              //child:
                            ),
                            //正确率标题
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                children: <Widget>[
                                  //正确率文本
                                  Container(
                                    width: 48.w,
                                    height: 18.w,
                                    //padding: EdgeInsets.only(left: 0.w),
                                    child: Text(
                                      '正确率',
                                      style: TextStyle(
                                          color: Color.fromRGBO(52, 69, 99, 1),
                                          fontSize: 14.sp,
                                          fontFamily: 'PingFangSC-Regular'),
                                    ),
                                  ),
                                  Container(
                                    width: 48.w,
                                    height: 5.w,
                                  ),
                                  //错误题目
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //青点
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                223, 237, 255, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.w)),
                                          ),
                                          width: 8.w,
                                          height: 5.w,
                                        ),
                                        //错误题目文本
                                        Container(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: Text(
                                            '错误题目',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    193, 199, 208, 1),
                                                fontSize: 9.sp,
                                                fontFamily:
                                                    'PingFangSC-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //正确题目
                                  Container(
                                    padding: EdgeInsets.only(top: 1.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //蓝点
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(38, 132, 255, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.w)),
                                          ),
                                          width: 8.w,
                                          height: 5.w,
                                        ),
                                        //正确题目文本
                                        Container(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: Text(
                                            '正确题目',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    193, 199, 208, 1),
                                                fontSize: 9.sp,
                                                fontFamily:
                                                    'PingFangSC-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      //纠错率
                      Container(
                        padding: EdgeInsets.only(left: 35.w),
                        width: 171.5.w,
                        height: 51.w,
                        child: Row(
                          children: <Widget>[
                            //比例图
                            Container(
                              // width: 45.w,
                              // height: 45.w,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 43.w,
                                    height: 43.w,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Color.fromRGBO(104, 212, 185, 1)),
                                      backgroundColor:
                                          Color.fromRGBO(217, 244, 254, 1),
                                      value: 0.44,
                                      strokeWidth: 7.w,
                                    ),
                                  ),
                                  new Positioned(
                                      left: 8.w,
                                      top: 8.w,
                                      child: Container(
                                        width: 27.w,
                                        height: 27.w,
                                        child: Center(
                                          child: Text(
                                            '69%',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    13, 14, 16, 1),
                                                fontSize: 10.sp,
                                                fontFamily:
                                                    'PingFangSC-Medium'),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            //纠错率标题
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                children: <Widget>[
                                  //纠错率文本
                                  Container(
                                    width: 48.w,
                                    height: 18.w,
                                    //padding: EdgeInsets.only(left: 0.w),
                                    child: Text(
                                      '纠错率',
                                      style: TextStyle(
                                          color: Color.fromRGBO(52, 69, 99, 1),
                                          fontSize: 13.sp,
                                          fontFamily: 'PingFangSC-Regular'),
                                    ),
                                  ),
                                  Container(
                                    width: 48.w,
                                    height: 5.w,
                                  ),
                                  //错误题目
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //青点
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                223, 237, 255, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.w)),
                                          ),
                                          width: 8.w,
                                          height: 5.w,
                                        ),
                                        //错误题目文本
                                        Container(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: Text(
                                            '错误题目',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    193, 199, 208, 1),
                                                fontSize: 9.sp,
                                                fontFamily:
                                                    'PingFangSC-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //正确题目
                                  Container(
                                    padding: EdgeInsets.only(top: 1.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        //绿点
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(0, 179, 243, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.w)),
                                          ),
                                          width: 8.w,
                                          height: 5.w,
                                        ),
                                        //正确题目文本
                                        Container(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: Text(
                                            '正确题目',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    193, 199, 208, 1),
                                                fontSize: 9.sp,
                                                fontFamily:
                                                    'PingFangSC-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildClassSelector() {
    return SliverToBoxAdapter(
      child: Container(
          width: 375.w,
          height: 225.w,
          padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.w),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(224, 224, 224, 0.5),
                      offset: Offset(0, 2.w), //阴影xy轴偏移量
                      blurRadius: 7.w, //阴影模糊程度
                      spreadRadius: 0 //阴影扩散程度
                      )
                ]),
            child: Container(
              // width: 300.w,
              // height: 200.w,
              child: GuidanceLineChart(),
            ),
          )),
    );
  }
}
