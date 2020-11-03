import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudyBoard extends StatelessWidget {
  final int timeSet;
  final int studyPlan;
  final int readScore;
  final int homeAccuracy;
  final int homeErrorRecovery;
  final String homeworkTime;

  const StudyBoard({
    Key key,
    this.timeSet,
    this.studyPlan,
    this.readScore,
    this.homeAccuracy,
    this.homeErrorRecovery,
    this.homeworkTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return Container(
      width: 375.w,
      height: 381.w,
      color: Colors.white,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //学习计划 & 点读跟读
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 15.w, 16.w, 0.w),
            child: Row(
              children: <Widget>[
                //学习计划
                Container(
                  width: 165.w,
                  height: 188.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.w),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(224, 224, 224, 0.5),
                            offset: Offset(0, 2.w), //阴影xy轴偏移量
                            blurRadius: 7.w, //阴影模糊程度
                            spreadRadius: 0

                            ///阴影扩散程度
                            )
                      ]),
                  child: Column(
                    children: <Widget>[
                      //学习计划标题
                      Container(
                        padding: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //学习计划文本
                            Container(
                              width: 62.w,
                              height: 21.w,
                              child: Text(
                                '学习计划',
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
                              child: Image.asset(
                                  'assets/images/home_click@2x.png'),
                              alignment: AlignmentDirectional.center,
                            )
                          ],
                        ),
                      ),
                      //比例图
                      Container(
                        width: 99.w,
                        height: 99.w,
                        //color: Colors.red,
                        padding: EdgeInsets.fromLTRB(11.w, 11.w, 0, 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 77.w,
                              height: 77.w,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Color.fromRGBO(255, 87, 95, 1)),
                                backgroundColor:
                                    Color.fromRGBO(255, 197, 66, 1),
                                value: 0.4,
                                strokeWidth: 10.w,
                              ),
                            ),
                            new Positioned(
                                left: 17.w,
                                top: 17.w,
                                child: Container(
                                  width: 45.w,
                                  height: 45.w,
                                  child: Center(
                                    child: Text(
                                      '63%',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.85),
                                          fontSize: 17.sp,
                                          fontFamily: 'PingFangSC-Semibold'),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      //已完成计划
                      Container(
                        padding: EdgeInsets.fromLTRB(15.w, 5.w, 24.w, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //黄点
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 197, 66, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.w)),
                              ),
                              width: 11.w,
                              height: 8.w,
                            ),
                            //已完成计划
                            Container(
                              // width: 102.w,
                              // height: 16.w,
                              child: Text(
                                '已完成计划（28人）',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 11.sp,
                                    fontFamily: 'PingFangSC-Regular'),
                              ),
                            )
                          ],
                        ),
                      ),
                      //未完成计划
                      Container(
                        padding: EdgeInsets.fromLTRB(15.w, 5.w, 24.w, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //红点
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 87, 95, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.w)),
                              ),
                              width: 11.w,
                              height: 8.w,
                            ),
                            //未完成计划
                            Container(
                              // width: 102.w,
                              // height: 16.w,
                              child: Text(
                                '未完成计划（15人）',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontSize: 11.sp,
                                    fontFamily: 'PingFangSC-Regular'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 13.w,
                  height: 188.w,
                ),
                //点读跟读
                Container(
                  width: 165.w,
                  height: 188.w,
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
                      //点读跟读标题
                      Container(
                        padding: EdgeInsets.fromLTRB(12.w, 10.w, 12.w, 5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //点读跟读文本
                            Container(
                              width: 62.w,
                              height: 21.w,
                              child: Text(
                                '点读跟读',
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
                              child: Image.asset(
                                  'assets/images/home_click@2x.png'),
                              alignment: AlignmentDirectional.center,
                            )
                          ],
                        ),
                      ),
                      //统计图
                      Container(
                        width: 99.w,
                        height: 99.w,
                        //color: Colors.red,
                        padding: EdgeInsets.fromLTRB(7.w, 14.w, 0, 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 83.w,
                              height: 83.w,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Color.fromRGBO(4, 129, 255, 1)),
                                backgroundColor: Color.fromRGBO(0, 0, 0, 0.1),
                                value: 0.4,
                                strokeWidth: 10.w,
                              ),
                            ),
                            new Positioned(
                                left: 19.w,
                                top: 19.w,
                                child: Container(
                                  width: 45.w,
                                  height: 45.w,
                                  child: Center(
                                    child: Text(
                                      '46分',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 145, 255, 1),
                                          fontSize: 16.sp,
                                          fontFamily: 'PingFangSC-Medium'),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //作业统计（拉出去做组件！！！）
          InkWell(
            onTap: () {
              print('object');
            },
            child: Container(
                padding: EdgeInsets.fromLTRB(16.w, 13.w, 16.w, 10.w),
                //color: Colors.red,
                //作业统计面板
                child: Container(
                  width: 343.w,
                  height: 130.w,
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
                              child: Image.asset(
                                  'assets/images/home_click@2x.png'),
                              alignment: AlignmentDirectional.center,
                            )
                          ],
                        ),
                      ),
                      //正确率 & 纠错率 & 作业平均用时
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 15.w, 0, 20.w),
                        child: Row(
                          children: <Widget>[
                            //正确率
                            Container(
                              padding: EdgeInsets.only(left: 16.w),
                              width: 121.5.w,
                              height: 51.w,
                              child: Row(
                                children: <Widget>[
                                  //比例图
                                  Container(
                                    width: 45.w,
                                    height: 45.w,
                                    //color: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(3.5.w, 3.5.w, 0, 0),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 39.w,
                                          height: 39.w,
                                          child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                                Color.fromRGBO(
                                                    38, 132, 255, 1)),
                                            backgroundColor: Color.fromRGBO(
                                                223, 237, 255, 1),
                                            value: 0.66,
                                            strokeWidth: 6.w,
                                          ),
                                        ),
                                        new Positioned(
                                            left: 9.w,
                                            top: 9.w,
                                            child: Container(
                                              width: 27.w,
                                              height: 27.w,
                                              child: Center(
                                                  // child: Text(
                                                  //   '86%',
                                                  //   textAlign: TextAlign.center,
                                                  //   style: TextStyle(
                                                  //       color: Color.fromRGBO(
                                                  //           13, 14, 16, 1),
                                                  //       fontSize: 10.sp,
                                                  //       fontFamily:
                                                  //           'PingFangSC-Medium'),
                                                  // ),
                                                  ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  //正确率标题
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 7.w),
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
                                                color: Color.fromRGBO(
                                                    52, 69, 99, 1),
                                                fontSize: 13.sp,
                                                fontFamily:
                                                    'PingFangSC-Regular'),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.w)),
                                                ),
                                                width: 8.w,
                                                height: 5.w,
                                              ),
                                              //错误题目文本
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 4.w),
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
                                                  color: Color.fromRGBO(
                                                      38, 132, 255, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.w)),
                                                ),
                                                width: 8.w,
                                                height: 5.w,
                                              ),
                                              //正确题目文本
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 4.w),
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
                              padding: EdgeInsets.only(left: 11.5.w),
                              width: 121.5.w,
                              height: 51.w,
                              child: Row(
                                children: <Widget>[
                                  //比例图
                                  Container(
                                    width: 45.w,
                                    height: 45.w,
                                    //color: Colors.black,
                                    padding:
                                        EdgeInsets.fromLTRB(3.5.w, 3.5.w, 0, 0),
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 39.w,
                                          height: 39.w,
                                          child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                                Color.fromRGBO(
                                                    104, 212, 185, 1)),
                                            backgroundColor: Color.fromRGBO(
                                                217, 244, 254, 1),
                                            value: 0.66,
                                            strokeWidth: 6.w,
                                          ),
                                        ),
                                        new Positioned(
                                            left: 9.w,
                                            top: 9.w,
                                            child: Container(
                                              width: 27.w,
                                              height: 27.w,
                                              child: Center(
                                                  // child: Text(
                                                  //   '86%',
                                                  //   textAlign: TextAlign.center,
                                                  //   style: TextStyle(
                                                  //       color: Color.fromRGBO(
                                                  //           13, 14, 16, 1),
                                                  //       fontSize: 10.sp,
                                                  //       fontFamily:
                                                  //           'PingFangSC-Medium'),
                                                  // ),
                                                  ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  //纠错率标题
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 7.w),
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
                                                color: Color.fromRGBO(
                                                    52, 69, 99, 1),
                                                fontSize: 13.sp,
                                                fontFamily:
                                                    'PingFangSC-Regular'),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.w)),
                                                ),
                                                width: 8.w,
                                                height: 5.w,
                                              ),
                                              //错误题目文本
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 4.w),
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
                                                  color: Color.fromRGBO(
                                                      0, 179, 243, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.w)),
                                                ),
                                                width: 8.w,
                                                height: 5.w,
                                              ),
                                              //正确题目文本
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 4.w),
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
                            //灰色线
                            Container(
                              width: 2.w,
                              height: 49.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(209, 213, 223, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.w)),
                              ),
                            ),
                            //平均作业用时
                            Container(
                              width: 98.w,
                              height: 49.w,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 8.w),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //作业平均用时文本
                                  Container(
                                    width: 80.w,
                                    height: 18.w,
                                    child: Text(
                                      '作业平均用时',
                                      style: TextStyle(
                                          color: Color.fromRGBO(15, 32, 67, 1),
                                          fontSize: 13.sp,
                                          fontFamily: 'PingFangSC-Regular'),
                                    ),
                                  ),
                                  //时间本文
                                  Container(
                                    width: 80.w,
                                    height: 18.w,
                                    child: Text(
                                      '1小时23分',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 145, 255, 1),
                                          fontSize: 13.sp,
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
                )),
          ),
        ],
      ),
    );
  }
}
