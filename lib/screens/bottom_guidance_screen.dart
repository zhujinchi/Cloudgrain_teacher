import 'package:Cloudgrain_teacher/screens/study/study_screen.dart';
import 'package:flutter/material.dart';
import 'package:Cloudgrain_teacher/screens/class/class_screen.dart';
import 'package:Cloudgrain_teacher/screens/profile/profile_screen.dart';
import 'package:Cloudgrain_teacher/screens/screens.dart';

class BottomGuidanceScreen extends StatefulWidget {
  @override
  _BottomGuidanceScreenState createState() => _BottomGuidanceScreenState();
}

class _BottomGuidanceScreenState extends State<BottomGuidanceScreen> {
  int _currentTabIndex = 0;

  var tabImages;

  var tabBarTitles = ['首页', '云课', '一起学', '我的'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 28.0, height: 28.0);
  }

  Image getTabIcon(int tagIndex) {
    if (tagIndex == _currentTabIndex) {
      return tabImages[tagIndex][1];
    }
    return tabImages[tagIndex][0];
  }

  Text getTabTitle(int tagIndex) {
    if (tagIndex == _currentTabIndex) {
      return new Text(tabBarTitles[tagIndex],
          style: new TextStyle(color: const Color(0xff0080ff)));
    } else {
      return new Text(tabBarTitles[tagIndex],
          style: new TextStyle(color: const Color(0xff9b9da1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _tabPages = <Widget>[
      HomeGuidanceScreen(),
      CloudClassScreen(),
      StudyTogatherScreen(),
      ProfileScreen(),
    ];

    tabImages = [
      [
        getTabImage('assets/icons/icon_home_default@3x.png'),
        getTabImage('assets/icons/icon_home_pre@3x.png')
      ],
      [
        getTabImage('assets/icons/icon_yk_default@3x.png'),
        getTabImage('assets/icons/icon_yk_pre@3x.png')
      ],
      [
        getTabImage('assets/icons/icon_yqx_default@3x.png'),
        getTabImage('assets/icons/icon_yqx_pre@3x.png')
      ],
      [
        getTabImage('assets/icons/icon_my_default@3x.png'),
        getTabImage('assets/icons/icon_my_pre@3x.png')
      ]
    ];

    final _BottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
      BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
      BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
      BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
    ];
    //assert(_tabPages.length == _BottomNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _BottomNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: _tabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
