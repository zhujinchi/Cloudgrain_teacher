import 'package:Cloudgrain_teacher/widgets/network/dio_manager.dart';
import 'package:flutter/material.dart';
import 'package:Cloudgrain_teacher/widgets/widgets.dart';
import 'package:Cloudgrain_teacher/screens/login/register_choose_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Cloudgrain_teacher/widgets/network/net_api.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();

  String _userID;
  String _password;
  bool _isChecked = true;
  bool _isLoading;
  IconData _checkIcon = Icons.check_box;

  void _changeFormToLogin() {
    _formKey.currentState.reset();
  }

  void _onLogin() {
    final form = _formKey.currentState;
    form.save();

    // FormData params = FormData.fromMap({});

    // DioManager.getInstance().get("https://www.baidu.com/", params, (result) {
    //   print(result);
    //   //请求成功需要做的事
    // }, (error) {
    //   print(error + '123');
    //   //失败后需要做的事
    // });

    // if (_userID == '') {
    //   _showMessageDialog('账号不可为空');
    //   return;
    // }
    // if (_password == '') {
    //   _showMessageDialog('密码不可为空');
    //   return;
    // }
    // if ((_formKey.currentState as FormState).validate()) {
    //   //验证通过提交数据
    GotoMainScreen(context, true);
    // }
  }

  void _showMessageDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text('提示'),
          content: new Text(message),
          actions: <Widget>[
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _showAccountInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        style: TextStyle(fontSize: 14.sp),
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.only(left: 0.w),
          border: InputBorder.none,
          hintText: '手机号/用户名',
          hintStyle: TextStyle(
              color: Color.fromRGBO(155, 157, 161, 1),
              fontFamily: 'PingFangSC-Medium',
              fontSize: 14.sp),
        ),
        validator: (v) {
          v.trim().length > 0 ? null : "用户名不能为空";
        },
        onSaved: (value) => _userID = value.trim(),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        style: TextStyle(fontSize: 14.sp),
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.only(left: 0.w),
          border: InputBorder.none,
          hintText: '请输入密码',
          hintStyle: TextStyle(
              color: Color.fromRGBO(155, 157, 161, 1),
              fontFamily: 'PingFangSC-Medium',
              fontSize: 14.sp),
        ),
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget _showUserTermAndPrivacy() {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20.w),
      child: Row(
        // //crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
              icon: Icon(_checkIcon),
              iconSize: 17.w,
              padding: EdgeInsets.fromLTRB(0.w, 0.w, 0.w, 0.w),
              color: Color.fromRGBO(30, 94, 255, 1),
              onPressed: () {
                setState(() {
                  _isChecked = !_isChecked;
                  if (_isChecked) {
                    _checkIcon = Icons.check_box;
                  } else {
                    _checkIcon = Icons.check_box_outline_blank;
                  }
                });
              }),
          Container(
            child: RichText(
                text: TextSpan(
                    text: '我已阅读并同意',
                    style: TextStyle(
                        color: Color.fromRGBO(155, 157, 161, 1),
                        fontSize: 12.w),
                    children: <TextSpan>[
                  TextSpan(
                      text: '“用户协议”',
                      style: TextStyle(
                        color: Color.fromRGBO(30, 94, 255, 1),
                        // decoration: TextDecoration.underline
                      )),
                  TextSpan(text: '和'),
                  TextSpan(
                      text: '“隐私政策”',
                      style: TextStyle(
                        color: Color.fromRGBO(30, 94, 255, 1),
                        // decoration: TextDecoration.underline
                      ))
                ])),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);
    return Scaffold(
        backgroundColor: Color.fromRGBO(30, 94, 255, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(30, 94, 255, 1),
          automaticallyImplyLeading: false,
          brightness: Brightness.dark,
          elevation: 0.0,
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(22.w, 0.w, 22.w, 60.w),
              width: 375.w,
              //height: 183.w,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 65.w,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '云豆课堂',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 46.sp,
                          fontFamily: 'PingFangSC-Medium'),
                    ),
                  ),
                  Container(
                    height: 22.w,
                    //color: Colors.white,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '学贵得师，亦贵得友',
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 16.sp,
                          fontFamily: 'PingFangSC-Medium'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 331.w,
              height: 240.w,
              padding: EdgeInsets.fromLTRB(16.w, 20.w, 16.w, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.w),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(224, 224, 224, 0.5),
                        offset: Offset(0, 2.w), //阴影xy轴偏移量
                        blurRadius: 6.w, //阴影模糊程度
                        spreadRadius: 0

                        ///阴影扩散程度
                        )
                  ]),
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Container(
                      //color: Colors.red,
                      //width: 331.w,
                      height: 82.h,
                      //padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 0),
                      child: ListView(
                        children: <Widget>[
                          _showAccountInput(),
                          Container(
                            height: 1.w,
                            color: Color.fromRGBO(228, 228, 228, 1),
                          ),
                          Container(
                            height: 10.w,
                          ),
                          _showPasswordInput(),
                          Container(
                            height: 1.w,
                            color: Color.fromRGBO(228, 228, 228, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 52.w,
                    alignment: Alignment.topLeft,
                    child: _showUserTermAndPrivacy(),
                  ),
                  Container(
                    //color: Colors.red,
                    width: 296.w,
                    height: 43.w,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: MaterialButton(
                      child: Text(
                        '登录',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'PingFangSC-Semibold',
                          fontSize: 16.sp,
                        ),
                      ),

                      color: Color.fromRGBO(201, 204, 210, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.w)),
                      //borderSide: BorderSide(color: Colors.orange, width: 1),
                      onPressed: () {
                        _onLogin();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void GotoMainScreen(BuildContext context, bool isTeacher) {
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (context) => RegisterChooseScreen()));
  }
}
