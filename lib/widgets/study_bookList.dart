import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewBookPage extends StatefulWidget {
  ListViewBookPage({Key key}) : super(key: key);

  @override
  _ListViewBookPageState createState() {
    return _ListViewBookPageState();
  }
}

class _ListViewBookPageState extends State<ListViewBookPage> {
  List list = [];

  @override
  void initState() {
    for (int i = 0; i <= 5; i++) {
      list.add(Text("我是第$i个列表"));
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int a) {
            return getRow(a);
          }),
    );
  }

  Widget getRow(int a) {
    return GestureDetector(
      child: Padding(
          padding:
              EdgeInsets.fromLTRB(25.w, a == 0 ? 22.w : 7.5.w, 25.w, 7.5.w),
          child: Container(
            width: 325.w,
            height: 140.w,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(6.w),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(236, 236, 236, 1),
                      offset: Offset(0, 2.w), //阴影xy轴偏移量
                      blurRadius: 7.w, //阴影模糊程度
                      spreadRadius: 0

                      ///阴影扩散程度
                      )
                ]),
            child: Column(
              children: <Widget>[
                Container(
                  height: 17.w,
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/icons/yiqixue_icon_read@3x.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 325.w,
                  height: 103.w,
                  padding: EdgeInsets.fromLTRB(20.w, 3.w, 15.w, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 217.w,
                        height: 100.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 100.w,
                              height: 100.w,
                              color: Colors.amber,
                            ),
                            Container(
                              width: 106.w,
                              height: 100.w,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '佳树生兮山致幽',
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.85),
                                        fontSize: 15.sp,
                                        fontFamily: 'PingFangSC-Regular'),
                                  ),
                                  Container(
                                    width: 106.w,
                                    height: 34.w,
                                    padding: EdgeInsets.only(top: 7.w),
                                    color: Colors.amber,
                                  ),
                                  Container(
                                    width: 106.w,
                                    height: 25.w,
                                    padding: EdgeInsets.only(top: 11.w),
                                    // child: OutlineButton(
                                    //   borderSide: BorderSide,
                                    // ),
                                  ),
                                  Container(
                                    width: 106.w,
                                    height: 19.w,
                                    child: Text(
                                      '876人参加与打卡',
                                      style: TextStyle(
                                          color: Color.fromRGBO(92, 92, 92, 1),
                                          fontSize: 10.sp,
                                          fontFamily: 'PingFangSC-Regular'),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 50.w,
                        height: 100.w,
                        padding: EdgeInsets.only(top: 80.w),
                        child: Container(
                          width: 50.w,
                          height: 20.w,
                          child: MaterialButton(
                            child: Text(
                              '去练习',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'PingFangSC-Medium',
                                fontSize: 12.sp,
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            color: Color.fromRGBO(74, 144, 226, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.w)),
                            //borderSide: BorderSide(color: Colors.orange, width: 1),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
      //tap事件触发
      onTap: _addList(a),
    );
  }

  _addList(int a) {
    //list.add(Text("我是第${a + 1}个列表"));
    print('我是第${a}个列表');
  }
}
