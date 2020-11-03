import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Cloudgrain_teacher/config/palette.dart';
import 'package:Cloudgrain_teacher/config/styles.dart';
import 'package:Cloudgrain_teacher/data/data.dart';
import 'package:Cloudgrain_teacher/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import 'package:flutter_custom_calendar/constants/constants.dart';
import 'package:flutter_custom_calendar/controller.dart';
import 'package:flutter_custom_calendar/utils/LogUtil.dart';

class CloudClassScreen extends StatefulWidget {
  @override
  _CloudClassScreenState createState() => _CloudClassScreenState();
}

class _CloudClassScreenState extends State<CloudClassScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  CalendarController controller;
  CalendarViewWidget calendar;
  HashSet<DateTime> _selectedDate = new HashSet();
  HashSet<DateModel> _selectedModels = new HashSet();

  GlobalKey<CalendarContainerState> _globalKey = new GlobalKey();
  GlobalKey<CalendarContainerState> _globalKey_done = new GlobalKey();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    _selectedDate.add(DateTime.now());
    controller = new CalendarController(
        minYear: 2019,
        minYearMonth: 1,
        maxYear: 2021,
        maxYearMonth: 12,
        showMode: CalendarConstants.MODE_SHOW_WEEK_AND_MONTH,
        selectedDateTimeList: _selectedDate,
        selectMode: CalendarSelectedMode.singleSelect)
      ..addOnCalendarSelectListener((dateModel) {
        _selectedModels.add(dateModel);
        setState(() {
          _selectDate = _selectedModels.toString();
        });
      })
      ..addOnCalendarUnSelectListener((dateModel) {
        LogUtil.log(
            TAG: '_selectedModels', message: _selectedModels.toString());
        LogUtil.log(TAG: 'dateModel', message: dateModel.toString());
        if (_selectedModels.contains(dateModel)) {
          _selectedModels.remove(dateModel);
        }
        setState(() {
          _selectDate = '';
        });
      });
    calendar = new CalendarViewWidget(
      key: _globalKey,
      calendarController: controller,
      dayWidgetBuilder: (DateModel model) {
        double wd = (MediaQuery.of(context).size.width - 20) / 7;
        //double wd = 21.w;
        bool _isSelected = model.isSelected;
        if (_isSelected &&
            CalendarSelectedMode.singleSelect ==
                controller.calendarConfiguration.selectMode) {
          _selectDate = model.toString();
        }
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(wd / 2)),
          child: Container(
            color: _isSelected ? Color.fromRGBO(0, 145, 255, 1) : Colors.white,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  model.day.toString(),
                  style: TextStyle(
                      color: model.isCurrentMonth
                          ? (_isSelected == false
                              ? (model.isWeekend
                                  ? Colors.black38
                                  : Colors.black87)
                              : Colors.white)
                          : Colors.black38),
                ),
//              Text(model.lunarDay.toString()),
              ],
            ),
          ),
        );
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addExpandChangeListener((value) {
        /// 添加改变 月视图和 周视图的监听
        _isMonthSelected = value;
        setState(() {});
      });
    });
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  bool _isMonthSelected = false;

  String _selectDate = '';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          //backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            //flexibleSpace: SafeArea(child: null),
            automaticallyImplyLeading: false,
            title: Container(
              height: 48.w,
              //color: Colors.red,
              padding: EdgeInsets.fromLTRB(80.w, 10.w, 80.w, 0),
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.85),
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(0, 145, 255, 1),
                      fontSize: 14.sp,
                      fontFamily: 'PingFangSC-Regular'),
                  labelColor: Color.fromRGBO(0, 145, 255, 1),
                  tabs: <Tab>[
                    Tab(
                      text: '待上课程',
                    ),
                    Tab(
                      text: '已上课程',
                    )
                  ]),
            ),
          ),
          //内容区域
          body: TabBarView(children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.w, 14.w, 16.w, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(7.w),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(180, 180, 180, 0.11),
                              offset: Offset(0, 2.w), //阴影xy轴偏移量
                              blurRadius: 9.w, //阴影模糊程度
                              spreadRadius: 0

                              ///阴影扩散程度
                              )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Image.asset(
                                    'assets/icons/yk_icon_left@3x.png',
                                    width: 28.0,
                                    height: 28.0,
                                  ),
                                  color: Colors.red,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    controller.previousPage();
                                  }),
                              IconButton(
                                  icon: Image.asset(
                                    'assets/icons/yk_icon_right@3x.png',
                                    width: 28.0,
                                    height: 28.0,
                                  ),
                                  color: Colors.red,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    controller.nextPage();
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          child: calendar,
                        )
                      ],
                    ),
                    //child: calendar,
                  ),
                  //child: calendar,
                ),
                _buildTimeSwitchButton(),
                _buildNoClassView(),
                // FloatingActionButton(
                //   wi
                //   onPressed: () {

                // })
                // SliverToBoxAdapter(
                //   child: Container(
                //     child: Text(
                //       ' $_selectDate ',
                //       style: TextStyle(color: Colors.red),
                //     ),
                //   ),
                // )
              ],
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.w, 14.w, 16.w, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(7.w),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(180, 180, 180, 0.11),
                              offset: Offset(0, 2.w), //阴影xy轴偏移量
                              blurRadius: 9.w, //阴影模糊程度
                              spreadRadius: 0

                              ///阴影扩散程度
                              )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Image.asset(
                                    'assets/icons/yk_icon_left@3x.png',
                                    width: 28.0,
                                    height: 28.0,
                                  ),
                                  color: Colors.red,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    controller.previousPage();
                                  }),
                              IconButton(
                                  icon: Image.asset(
                                    'assets/icons/yk_icon_right@3x.png',
                                    width: 28.0,
                                    height: 28.0,
                                  ),
                                  color: Colors.red,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    controller.nextPage();
                                  }),
                            ],
                          ),
                        ),
                        Container(
                          child: calendar,
                        )
                      ],
                    ),
                    //child: calendar,
                  ),
                  //child: calendar,
                ),
                _buildTimeSwitchButton(),
                SliverToBoxAdapter(
                  child: Container(
                    child: Text(
                      ' $_selectDate ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ));
  }

  Widget _buildSelectedTime(String selectedData) {
    var json = jsonDecode(selectedData);
    print(json);
    final String year = json['DataModel']['year'];
    final String month = json['DataModel']['month'];
    final String day = json['DataModel']['day'];
    return Container(
        //child: Text('$year' + '年' + '$month' + '月' + '$day' + '日'),
        );
  }

  Widget _buildTimeSwitchButton() {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.topCenter,
        child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(7.w),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(180, 180, 180, 0.11),
                      offset: Offset(0, 2.w), //阴影xy轴偏移量
                      blurRadius: 9.w, //阴影模糊程度
                      spreadRadius: 0

                      ///阴影扩散程度
                      )
                ]),
            width: 40.w,
            height: 25.w,
            child: IconButton(
                color: Colors.red,
                icon: Image.asset(
                  'assets/icons/yk_icon_down@3x.png',
                  width: 28.0,
                  height: 28.0,
                  fit: BoxFit.fitWidth,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  if (_isMonthSelected) {
                    setState(() {
                      controller.weekAndMonthViewChange(
                          CalendarConstants.MODE_SHOW_ONLY_MONTH);
                    });
                  } else {
                    setState(() {
                      controller.weekAndMonthViewChange(
                          CalendarConstants.MODE_SHOW_ONLY_WEEK);
                    });
                  }
                })),
      ),
    );
  }

  Widget _buildNoClassView() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 58.w,
            ),
            Image.asset(
              'assets/images/yk_illustration_a@3x.png',
              width: 53.w,
              height: 53.w,
            ),
            Container(
              height: 7.w,
            ),
            Text(
              '可点击日历上其他日期查看课程',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.59),
                  fontSize: 12.sp,
                  fontFamily: 'PingFangSC-Regular'),
            ),
            Container(
              height: 4.w,
            ),
            Text(
              '可点击日历上其他日期查看课程',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.35),
                  fontSize: 8.sp,
                  fontFamily: 'PingFangSC-Regular'),
            ),
          ],
        ),
      ),
    );
  }
}
