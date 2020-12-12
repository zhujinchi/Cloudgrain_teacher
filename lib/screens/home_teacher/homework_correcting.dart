import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens.dart';
import 'dart:async';

class HomeworkCorrectingScreen extends StatefulWidget {
  String inforType;

  HomeworkCorrectingScreen({
    Key key,
    this.inforType,
  }) : super(key: key);

  @override
  HomeworkCorrectingScreenState createState() =>
      HomeworkCorrectingScreenState();
}

class HomeworkCorrectingScreenState extends State<HomeworkCorrectingScreen>
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
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
          this.widget.inforType,
          style: TextStyle(
              color: Color.fromRGBO(15, 32, 67, 1),
              fontSize: 18.w,
              fontFamily: 'PingFangSC-Medium'),
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
            padding: EdgeInsets.only(
              top: 16.w,
            ),
            width: 375.w,
            height: 46.w,
            child: TabBar(
                isScrollable: true,
                indicatorColor: Color.fromRGBO(0, 145, 255, 1),
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Color.fromRGBO(155, 157, 161, 1),
                labelStyle: TextStyle(
                    color: Color.fromRGBO(0, 145, 255, 1), fontSize: 15.sp),
                labelColor: Color.fromRGBO(0, 145, 255, 1),
                controller: this._tabController,
                tabs: <Widget>[
                  Tab(text: '已批改'),
                  Tab(text: '待批改'),
                ]),
          ),
          Container(
            // 导航栏高度103
            height: 667.h - 46.w - 103,
            //后期代码优化
            child:
                TabBarView(controller: this._tabController, children: <Widget>[
              _buildWaitView(),
              _buildReadyView(),
            ]),
          )
        ],
      ),
    );
  }

  Container _buildWaitView() {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.w),
            child: Container(
              width: 275.w,
              height: 26.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.w),
                  border: Border.all(
                      width: 1.w, color: Color.fromRGBO(155, 157, 161, 0.5))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 300.w, top: 12.w),
            child: Container(
              //color: Colors.red,
              width: 59.w,
              height: 26.w,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: MaterialButton(
                child: Text(
                  '搜索',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 12.sp,
                  ),
                ),
                elevation: 0.0,
                color: Color.fromRGBO(104, 212, 185, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.w)),
                //borderSide: BorderSide(color: Colors.orange, width: 1),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 97.w),
            child: Container(
              width: 343.w,
              height: 173.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.w),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(236, 236, 236, 1),
                        offset: Offset(0, 2.w), //阴影xy轴偏移量
                        blurRadius: 7.w, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                        )
                  ]),
              child: Image.asset(
                'assets/images/temp_homework_infor@2x.png',
                width: 343.w,
                height: 186.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 290.w),
            child: Container(
              width: 343.w,
              height: 173.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.w),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(236, 236, 236, 1),
                        offset: Offset(0, 2.w), //阴影xy轴偏移量
                        blurRadius: 7.w, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                        )
                  ]),
              child: Image.asset(
                'assets/images/temp_homework_infor@2x.png',
                width: 343.w,
                height: 186.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildReadyView() {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.w),
            child: Container(
              width: 275.w,
              height: 26.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.w),
                  border: Border.all(
                      width: 1.w, color: Color.fromRGBO(155, 157, 161, 0.5))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 300.w, top: 12.w),
            child: Container(
              //color: Colors.red,
              width: 59.w,
              height: 26.w,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: MaterialButton(
                child: Text(
                  '搜索',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 12.sp,
                  ),
                ),
                elevation: 0.0,
                color: Color.fromRGBO(104, 212, 185, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.w)),
                //borderSide: BorderSide(color: Colors.orange, width: 1),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 97.w),
            child: Container(
              width: 343.w,
              height: 173.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.w),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(236, 236, 236, 1),
                        offset: Offset(0, 2.w), //阴影xy轴偏移量
                        blurRadius: 7.w, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                        )
                  ]),
              child: Image.asset(
                'assets/images/temp_class_infor@2x.png',
                width: 343.w,
                height: 173.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 290.w),
            child: Container(
              width: 343.w,
              height: 173.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.w),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(236, 236, 236, 1),
                        offset: Offset(0, 2.w), //阴影xy轴偏移量
                        blurRadius: 7.w, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                        )
                  ]),
              child: Image.asset(
                'assets/images/temp_class_infor@2x.png',
                width: 343.w,
                height: 173.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildFinishedView() {
    return Container(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.w),
            child: Container(
              width: 275.w,
              height: 26.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.w),
                  border: Border.all(
                      width: 1.w, color: Color.fromRGBO(155, 157, 161, 0.5))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 300.w, top: 12.w),
            child: Container(
              //color: Colors.red,
              width: 59.w,
              height: 26.w,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: MaterialButton(
                child: Text(
                  '搜索',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'PingFangSC-Medium',
                    fontSize: 12.sp,
                  ),
                ),
                elevation: 0.0,
                color: Color.fromRGBO(104, 212, 185, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.w)),
                //borderSide: BorderSide(color: Colors.orange, width: 1),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 97.w),
            child: Container(
              width: 343.w,
              height: 173.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.w),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(236, 236, 236, 1),
                        offset: Offset(0, 2.w), //阴影xy轴偏移量
                        blurRadius: 7.w, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                        )
                  ]),
              child: Image.asset(
                'assets/images/temp_class_infor@2x.png',
                width: 343.w,
                height: 173.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 290.w),
            child: Container(
              width: 343.w,
              height: 173.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.w),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(236, 236, 236, 1),
                        offset: Offset(0, 2.w), //阴影xy轴偏移量
                        blurRadius: 7.w, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                        )
                  ]),
              child: Image.asset(
                'assets/images/temp_class_infor@2x.png',
                width: 343.w,
                height: 173.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    await Future<Null>.delayed(Duration(seconds: 3), () {
      print('刷新');
      setState(() {});
      return null;
    });
  }
}
