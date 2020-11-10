import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Cloudgrain_teacher/config/palette.dart';
import 'package:Cloudgrain_teacher/config/styles.dart';
import 'package:Cloudgrain_teacher/data/data.dart';
import 'package:Cloudgrain_teacher/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 248, 252, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 0.8,
        automaticallyImplyLeading: false,
      ),
      //内容区域
      body: CustomScrollView(
        //physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildProfileCard(),
          _buildSetLabels(),
          _buildLogOutButton(),
          _buildCurrentEditionLabel(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildProfileCard() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 117.w,
        color: Color.fromRGBO(255, 255, 255, 1),
        padding: EdgeInsets.fromLTRB(25.w, 0.w, 25.w, 0),
        child: Row(
          children: [
            //用户头像
            Image.asset(
              'assets/avatars/my_avatar_a_pre@3x.png',
              width: 61.w,
              height: 61.w,
            ),

            Container(
              width: 256.w,
              height: 61.w,
              //padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(29.w, 12.w, 0.w, 0.w),

              child: Column(
                //crossAxisAlignment: ,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 140.w,
                    height: 20.w,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '诸葛亮',
                          style: TextStyle(
                              color: Color.fromRGBO(59, 61, 79, 1),
                              fontSize: 14.sp,
                              fontFamily: 'PingFangSC-Medium'),
                        ),
                        Container(
                          height: 20.w,
                          width: 20.w,
                          child: IconButton(
                              icon: Image.asset(
                                'assets/images/home_click@2x.png',
                                fit: BoxFit.fitHeight,
                              ),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 140.w,
                    height: 20.w,
                    child: Text(
                      '武汉市汉阳区翠微路小学',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.59),
                          fontSize: 12.sp,
                          fontFamily: 'PingFangSC-Regular'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSetLabels() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: 375.w,
              height: 15.w,
              color: Color.fromRGBO(247, 248, 252, 1),
            ),
            //我的班级
            setLabelsWithPath('assets/icons/icon_profile_class@3x.png', '我的班级'),
            Container(
              width: 375.w,
              height: 2.w,
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
            //我的通知
            setLabelsWithPath(
                'assets/icons/icon_profile_notification@3x.png', '我的通知'),
            Container(
              width: 375.w,
              height: 2.w,
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
            //我的积分
            setLabelsWithPath(
                'assets/icons/icon_profile_integration@3x.png', '我的积分'),
            Container(
              width: 375.w,
              height: 2.w,
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
            //设置
            setLabelsWithPath('assets/icons/icon_profile_setting@3x.png', '设置'),
            Container(
              width: 375.w,
              height: 2.w,
              color: Color.fromRGBO(239, 239, 239, 1),
            ),
            //消息通知
            Container(
              width: 375.w,
              height: 62.w,
              padding: EdgeInsets.fromLTRB(25.w, 18.w, 0.w, 18.w),
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/icon_profile_allownoti@3x.png',
                          width: 26.w,
                          height: 26.w,
                        ),
                        Container(
                          width: 14.w,
                          height: 62.w,
                        ),
                        Text(
                          '消息通知',
                          style: TextStyle(
                              color: Color.fromRGBO(26, 59, 52, 1),
                              fontSize: 14.sp,
                              fontFamily: 'PingFangSC-Regular'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 63.w,
                    height: 26.w,
                    padding: EdgeInsets.only(right: 19.w),
                    child: CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (bool value) {
                          setState(() {
                            _switchValue = value;
                          });
                        }),
                  )
                ],
              ),
            ),
            Container(
              width: 375.w,
              height: 15.w,
              color: Color.fromRGBO(247, 248, 252, 1),
            ),
          ],
        ),
      ),
    );
  }

  Container setLabelsWithPath(String path, String title) {
    return Container(
      width: 375.w,
      height: 62.w,
      padding: EdgeInsets.fromLTRB(25.w, 18.w, 0.w, 18.w),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Image.asset(
                  path,
                  width: 26.w,
                  height: 26.w,
                ),
                Container(
                  width: 14.w,
                  height: 62.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Color.fromRGBO(26, 59, 52, 1),
                      fontSize: 14.sp,
                      fontFamily: 'PingFangSC-Regular'),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/icons/yk_icon_right@3x.png',
            width: 53.w,
            height: 53.w,
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildLogOutButton() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 50.w,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Center(
          child: Text(
            '退出登录',
            style: TextStyle(
                color: Color.fromRGBO(224, 32, 32, 1),
                fontSize: 15.sp,
                fontFamily: 'PingFangSC-Regular'),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildCurrentEditionLabel() {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          Container(
            width: 375.w,
            height: 20.w,
          ),
          Container(
            child: Center(
              // width: 68.w,
              // height: 20.w,
              //padding: EdgeInsets.only(top: 7.w),
              child: Text(
                '当前版本1.01',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 10.sp,
                    fontFamily: 'PingFangSC-Regular'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
