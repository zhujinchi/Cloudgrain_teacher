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
                padding: EdgeInsets.fromLTRB(12.w, 16.w, 0, 0),
                color: Colors.red,
              ),
              Container(
                width: 343.w,
                height: 56,
                padding: EdgeInsets.fromLTRB(12.w, 16.w, 0, 0),
                color: Colors.green,
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
              Container(),
              Container()
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
                height: 29.w,
                padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
                child: Text(
                  '正确率分布',
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
                height: 29.w,
                padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
                child: Text(
                  '错题率分布',
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
                height: 29.w,
                padding: EdgeInsets.fromLTRB(12.w, 8.w, 0, 0),
                child: Text(
                  '纠错率分布',
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
