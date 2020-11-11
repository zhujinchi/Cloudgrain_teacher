import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartsBoard extends StatefulWidget {
  @override
  _ChartsBoardState createState() => _ChartsBoardState();
}

class _ChartsBoardState extends State<ChartsBoard> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);

    return CustomScrollView(
      slivers: <Widget>[
        _buildAccuracyStatistic(),
        _buildFinishedStatistic(),
        _buildAccuracyDistribution(),
        _buildMistakesDistribution(),
        _buildRecoveryDistribution(),
        _buildProgressTrend(),
        _buildProgressTrends(),
        _buildClassesComparision()
      ],
    );
  }

  //正确率统计
  SliverToBoxAdapter _buildAccuracyStatistic() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 288.w,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.w, 18.w, 16.w, 0),
        child: Container(
          width: 343.w,
          height: 270.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.w),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(227, 227, 227, 0.5),
                    offset: Offset(0, 2.w), //阴影xy轴偏移量
                    blurRadius: 7.w, //阴影模糊程度
                    spreadRadius: 0 //阴影扩散程度
                    )
              ]),
          child: Column(
            children: <Widget>[
              Container(
                width: 343.w,
                height: 29.w,
                padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
                child: Text(
                  '正确率统计',
                  style: TextStyle(
                      color: Color.fromRGBO(13, 14, 16, 1),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PingFangSC-Medium'),
                ),
              ),
              Container(
                width: 343.w,
                height: 167.w,
                padding: EdgeInsets.fromLTRB(12.w, 16.w, 12.w, 0),
                child: Container(
                  width: 319.w,
                  height: 151.w,
                  color: Colors.red,
                ),
              ),
              Container(
                width: 343.w,
                height: 56.w,
                padding: EdgeInsets.fromLTRB(12.w, 16.w, 12.w, 0),
                //color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 98.w,
                      height: 40.w,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 95.w,
                            height: 20.w,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(4, 129, 255, 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1.5.w)),
                                  ),
                                  width: 3.w,
                                  height: 10.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7.w),
                                  child: Text(
                                    '最高正确率',
                                    style: TextStyle(
                                        color: Color.fromRGBO(47, 58, 79, 0.9),
                                        fontSize: 14.sp,
                                        fontFamily: 'PingFangSC-Medium'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 95.w,
                            height: 20.w,
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              '100%',
                              style: TextStyle(
                                  color: Color.fromRGBO(47, 58, 79, 1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PingFangSC-Medium'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 98.w,
                      height: 40.w,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 95.w,
                            height: 20.w,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 197, 66, 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1.5.w)),
                                  ),
                                  width: 3.w,
                                  height: 10.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7.w),
                                  child: Text(
                                    '最低正确率',
                                    style: TextStyle(
                                        color: Color.fromRGBO(47, 58, 79, 0.9),
                                        fontSize: 14.sp,
                                        fontFamily: 'PingFangSC-Medium'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 95.w,
                            height: 20.w,
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              '53%',
                              style: TextStyle(
                                  color: Color.fromRGBO(47, 58, 79, 1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PingFangSC-Medium'),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 98.w,
                      height: 40.w,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 95.w,
                            height: 20.w,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(253, 102, 109, 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(1.5.w)),
                                  ),
                                  width: 3.w,
                                  height: 10.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7.w),
                                  child: Text(
                                    '平均正确率',
                                    style: TextStyle(
                                        color: Color.fromRGBO(47, 58, 79, 0.9),
                                        fontSize: 14.sp,
                                        fontFamily: 'PingFangSC-Medium'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 95.w,
                            height: 20.w,
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              '50%',
                              style: TextStyle(
                                  color: Color.fromRGBO(47, 58, 79, 1),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'PingFangSC-Medium'),
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
      ),
    );
  }

  //完成率统计
  SliverToBoxAdapter _buildFinishedStatistic() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 168.w,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.w, 14.w, 16.w, 0),
        child: Container(
          width: 343.w,
          height: 154.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.w),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(227, 227, 227, 0.5),
                    offset: Offset(0, 2.w), //阴影xy轴偏移量
                    blurRadius: 7.w, //阴影模糊程度
                    spreadRadius: 0 //阴影扩散程度
                    )
              ]),
          child: Column(
            children: <Widget>[
              Container(
                width: 343.w,
                height: 29.w,
                padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
                child: Text(
                  '完成率统计',
                  style: TextStyle(
                      color: Color.fromRGBO(13, 14, 16, 1),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PingFangSC-Medium'),
                ),
              ),
              Container(
                width: 343.w,
                height: 100.w,
                padding: EdgeInsets.fromLTRB(42.w, 9.w, 77.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 100.w,
                      height: 100.w,
                      color: Colors.red,
                    ),
                    Container(
                      width: 96.w,
                      height: 100.w,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 17.w,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //黄点
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(44, 189, 156, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.w)),
                                  ),
                                  width: 13.w,
                                  height: 8.w,
                                ),
                                //已完成计划
                                Container(
                                  // width: 102.w,
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(
                                    '已完成:  ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(155, 157, 161, 1),
                                        fontSize: 12.sp,
                                        fontFamily: 'PingFangSC-Regular'),
                                  ),
                                ),
                                Text(
                                  '28人',
                                  style: TextStyle(
                                      color: Color.fromRGBO(15, 32, 67, 1),
                                      fontSize: 12.sp,
                                      fontFamily: 'PingFangSC-Regular'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 19.w,
                            padding: EdgeInsets.only(top: 2.w),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //黄点
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 189, 56, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.w)),
                                  ),
                                  width: 13.w,
                                  height: 8.w,
                                ),
                                //已完成计划
                                Container(
                                  // width: 102.w,
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(
                                    '未完成:  ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(155, 157, 161, 1),
                                        fontSize: 12.sp,
                                        fontFamily: 'PingFangSC-Regular'),
                                  ),
                                ),
                                Text(
                                  '15人',
                                  style: TextStyle(
                                      color: Color.fromRGBO(15, 32, 67, 1),
                                      fontSize: 12.sp,
                                      fontFamily: 'PingFangSC-Regular'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 27.w,
                            padding: EdgeInsets.only(top: 9.w),
                            child: Container(
                              width: 96.w,
                              height: 18.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 145, 255, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.w)),
                              ),
                              child: Center(
                                child: Text(
                                  '作业平均用时',
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 8.sp,
                                      fontFamily: 'PingFangSC-Medium'),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 28.w,
                            padding: EdgeInsets.only(top: 6.w),
                            child: Text(
                              '1小时23分',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(15, 32, 67, 1),
                                  fontSize: 16.sp,
                                  fontFamily: 'PingFangSC-Regular'),
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
      ),
    );
  }

  //正确率分布
  SliverToBoxAdapter _buildAccuracyDistribution() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 325.w,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.w, 14.w, 16.w, 0),
        child: Container(
          width: 343.w,
          height: 311.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.w),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(227, 227, 227, 0.5),
                    offset: Offset(0, 2.w), //阴影xy轴偏移量
                    blurRadius: 7.w, //阴影模糊程度
                    spreadRadius: 0 //阴影扩散程度
                    )
              ]),
          child: Column(
            children: <Widget>[
              Container(
                width: 343.w,
                height: 27.w,
                padding: EdgeInsets.fromLTRB(17.w, 6.w, 0, 0),
                child: Text(
                  '正确率分布',
                  style: TextStyle(
                      color: Color.fromRGBO(13, 14, 16, 1),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PingFangSC-Medium'),
                ),
              ),
              Container(
                width: 343.w,
                height: 284.w,
                padding: EdgeInsets.fromLTRB(21.w, 20.w, 21.w, 16.w),
                child: Container(
                  width: 301.w,
                  height: 264.w,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //错题率分布
  SliverToBoxAdapter _buildMistakesDistribution() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 302.w,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.w, 47.w, 16.w, 0),
        child: Container(
          width: 343.w,
          height: 255.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.w),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(227, 227, 227, 0.5),
                    offset: Offset(0, 2.w), //阴影xy轴偏移量
                    blurRadius: 7.w, //阴影模糊程度
                    spreadRadius: 0 //阴影扩散程度
                    )
              ]),
          child: Column(
            children: <Widget>[
              Container(
                width: 343.w,
                height: 28.w,
                padding: EdgeInsets.fromLTRB(12.w, 7.w, 0, 0),
                child: Text(
                  '错题率分布',
                  style: TextStyle(
                      color: Color.fromRGBO(13, 14, 16, 1),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PingFangSC-Medium'),
                ),
              ),
              Container(
                width: 343.w,
                height: 19.w,
                padding: EdgeInsets.fromLTRB(12.w, 6.w, 12.w, 0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 3.w),
                      child: Container(
                        width: 13.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(30, 94, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        '正确率',
                        style: TextStyle(
                            color: Color.fromRGBO(13, 14, 16, 0.7),
                            fontSize: 9.sp,
                            fontFamily: 'PingFangSC-Regular'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 3.w, 0, 0),
                      child: Container(
                        width: 13.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(230, 233, 244, 1),
                          borderRadius: BorderRadius.all(Radius.circular(3.w)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text(
                        '错误率',
                        style: TextStyle(
                            color: Color.fromRGBO(13, 14, 16, 0.7),
                            fontSize: 9.sp,
                            fontFamily: 'PingFangSC-Regular'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 15.w),
                child: Container(
                  width: 311.w,
                  height: 185.w,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //纠错率分布
  SliverToBoxAdapter _buildRecoveryDistribution() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 327.w,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 0),
        child: Container(
          width: 343.w,
          height: 311.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.w),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(227, 227, 227, 0.5),
                    offset: Offset(0, 2.w), //阴影xy轴偏移量
                    blurRadius: 7.w, //阴影模糊程度
                    spreadRadius: 0 //阴影扩散程度
                    )
              ]),
          child: Column(
            children: <Widget>[
              Container(
                width: 343.w,
                height: 27.w,
                padding: EdgeInsets.fromLTRB(17.w, 6.w, 0, 0),
                child: Text(
                  '纠错率分布',
                  style: TextStyle(
                      color: Color.fromRGBO(13, 14, 16, 1),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PingFangSC-Medium'),
                ),
              ),
              Container(
                width: 343.w,
                height: 284.w,
                padding: EdgeInsets.fromLTRB(21.w, 20.w, 21.w, 16.w),
                child: Container(
                  width: 301.w,
                  height: 264.w,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//学生进步趋势
SliverToBoxAdapter _buildProgressTrend() {
  return SliverToBoxAdapter(
    child: Container(
      width: 375.w,
      height: 261.w,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 45.w, 16.w, 0),
      child: Container(
        width: 343.w,
        height: 216.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.w),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(227, 227, 227, 0.5),
                  offset: Offset(0, 2.w), //阴影xy轴偏移量
                  blurRadius: 7.w, //阴影模糊程度
                  spreadRadius: 0 //阴影扩散程度
                  )
            ]),
        child: Column(
          children: <Widget>[
            Container(
              width: 343.w,
              height: 29.w,
              padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
              child: Text(
                '学生进步趋势',
                style: TextStyle(
                    color: Color.fromRGBO(13, 14, 16, 1),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PingFangSC-Medium'),
              ),
            ),
            Container(),
            Container()
          ],
        ),
      ),
    ),
  );
}

//学生进步趋势
SliverToBoxAdapter _buildProgressTrends() {
  return SliverToBoxAdapter(
    child: Container(
      width: 375.w,
      height: 247.w,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 25.w, 16.w, 0),
      child: Container(
        width: 343.w,
        height: 222.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.w),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(227, 227, 227, 0.5),
                  offset: Offset(0, 2.w), //阴影xy轴偏移量
                  blurRadius: 7.w, //阴影模糊程度
                  spreadRadius: 0 //阴影扩散程度
                  )
            ]),
        child: Column(
          children: <Widget>[
            Container(
              width: 343.w,
              height: 29.w,
              padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
              child: Text(
                '学生进步趋势',
                style: TextStyle(
                    color: Color.fromRGBO(13, 14, 16, 1),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PingFangSC-Medium'),
              ),
            ),
            Container(),
            Container()
          ],
        ),
      ),
    ),
  );
}

//班级对比
SliverToBoxAdapter _buildClassesComparision() {
  return SliverToBoxAdapter(
    child: Container(
      width: 375.w,
      height: 235.w,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 78.w),
      child: Container(
        width: 343.w,
        height: 219.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.w),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(227, 227, 227, 0.5),
                  offset: Offset(0, 2.w), //阴影xy轴偏移量
                  blurRadius: 7.w, //阴影模糊程度
                  spreadRadius: 0 //阴影扩散程度
                  )
            ]),
        child: Column(
          children: <Widget>[
            Container(
              width: 343.w,
              height: 29.w,
              padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
              child: Text(
                '班级对比',
                style: TextStyle(
                    color: Color.fromRGBO(13, 14, 16, 1),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PingFangSC-Medium'),
              ),
            ),
            Container(),
            Container()
          ],
        ),
      ),
    ),
  );
}
