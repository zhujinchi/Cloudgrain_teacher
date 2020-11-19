import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Cloudgrain_teacher/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class PublishHomeworkScreen extends StatefulWidget {
  @override
  _PublishHomeworkScreenState createState() => _PublishHomeworkScreenState();
}

class _PublishHomeworkScreenState extends State<PublishHomeworkScreen> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 667), allowFontScaling: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          '发布作业',
          style: TextStyle(
              color: Color.fromRGBO(59, 61, 79, 1),
              fontSize: 18.sp,
              fontFamily: 'PingFangSC-Medium'),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildLabelWithText('班级名称'),
          _buildHomeWorkTitle(),
          _buildLabelWithText('作业内容'),
          _buildHomeWorkContent(),
          _buildLabelWithText('添加照片（最多9张）'),
          _buildHomeWorkPicture(context),
          _buildPublichButton(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHomeWorkTitle() {
    return SliverToBoxAdapter(
        child: Container(
      width: 375.w,
      height: 60.w,
      child: new TextFormField(
        maxLines: 1,
        keyboardAppearance: Brightness.light,
        keyboardType: TextInputType.text,
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
        //color: Colors.black,
      ),
    ));
  }

  SliverToBoxAdapter _buildHomeWorkContent() {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 180.w,
        //color: Colors.black,
      ),
    );
  }

  SliverToBoxAdapter _buildHomeWorkPicture(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: 375.w,
        height: 112.w,
        //color: Colors.grey,
        padding: EdgeInsets.fromLTRB(37.w, 12.w, 0, 24.w),
        child: Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  this._imageFile = null;
                });
              },
              child: Container(
                width: 76.w,
                height: 76.w,
                child: this._imageFile == null
                    ? Placeholder(
                        color: Colors.grey,
                      )
                    : Image.file(
                        this._imageFile,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: InkWell(
                  onTap: () {
                    showDialog(
                        barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
                        context: context,
                        builder: (BuildContext context) {
                          var list = List();
                          list.add('拍照'); //显示的选择list
                          list.add('从相册中选择');
                          return CommonBottomSheet(
                            list: list,
                            onItemClickListener: (index) async {
                              //回调方法
                              Navigator.of(context).pop(1);
                              if (index == 0) {
                                await _pickImageFromCamera();
                              } else {
                                await _pickImageFromGallery();
                              }
                            },
                          );
                        });
                  },
                  child: Container(
                    width: 76.w,
                    height: 76.w,
                    child: Image.asset(
                      'assets/icons/hong_fbzy_icon_b@3x.png',
                      fit: BoxFit.fill,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _pickImageFromCamera() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() => this._imageFile = imageFile);
  }

  Future<Null> _pickImageFromGallery() async {
    final File imageFile =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => this._imageFile = imageFile);
  }

  SliverToBoxAdapter _buildPublichButton() {
    return SliverToBoxAdapter(
      child: Container(
        //color: Colors.red,
        width: 313.w,
        height: 45.w,
        padding: EdgeInsets.fromLTRB(31.w, 0, 31.w, 0),
        child: MaterialButton(
          child: Text(
            '立即发布',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'PingFangSC-Semibold',
              fontSize: 16.sp,
            ),
          ),

          color: Color.fromRGBO(0, 145, 255, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
          //borderSide: BorderSide(color: Colors.orange, width: 1),
          onPressed: () {
            //_onLogin();
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildLabelWithText(String text) {
    return SliverToBoxAdapter(
      child: Row(
        children: <Widget>[
          Container(
            width: 375.w,
            height: 47.w,
            padding: EdgeInsets.fromLTRB(15.w, 22.w, 0, 0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 6.w,
                  height: 12.w,
                  color: Color.fromRGBO(104, 212, 185, 1),
                ),
                Container(
                  height: 25.w,
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Color.fromRGBO(15, 32, 67, 1),
                        fontSize: 18.sp,
                        fontFamily: 'PingFangSC-Regular'),
                  ),
                )
              ],
            ),
          ),
          //Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom))
        ],
      ),
    );
  }
}
