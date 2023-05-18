import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotonresponse/view/screens/authentication/auth_screen.dart';

import '../../../data/assets_path.dart';
import '../incident/incident_list.dart';
import '../status_map/status_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          foregroundColor: Colors.grey,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.white,
        ),
        key: _scaffoldKey,
        drawer: Drawer(
          width: 250.w,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  trailing: FaIcon(
                    FontAwesomeIcons.xmark,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Close',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  onTap: () {
                    _scaffoldKey.currentState?.closeDrawer();
                  },
                ),
                ListTile(
                  trailing: FaIcon(
                    FontAwesomeIcons.fileCircleCheck,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Change Project ',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  onTap: () {
                    // Handle item 2 tap
                  },
                ),
                ListTile(
                  trailing: FaIcon(
                    FontAwesomeIcons.rightFromBracket,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Logout ',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  onTap: () {
                    // Handle item 2 tap
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return AuthScreen();
                    }));
                  },
                ),
                // Add more ListTiles for additional items
              ],
            ),
          ),
        ),
        body: Column(children: [
          Image.asset(
            ImagesPath.sorIcon,
            fit: BoxFit.fill,
            width: width,
            height: 60.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Project ID : 127 ",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      _openDrawer();
                    },
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.gear,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 0;
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return StatusMapScreen();
                }));
              });
            },
            child: Container(
              height: 80.h,
              color: selectedIndex == 0
                  ? Colors.grey.shade300
                  : Colors.transparent,
              child: Row(
                children: [
                  Image.asset("assets/icons/png/home-statusmap-icon.png"),
                  Text(
                    "Status Map",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedIndex = 1;
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return IncidentList();
                }));
              });
            },
            child: Container(
              height: 80.h,
              color: selectedIndex == 1
                  ? Colors.grey.shade400
                  : Colors.transparent,
              child: Row(
                children: [
                  Image.asset("assets/icons/png/home-forms-icon.png"),
                  Text(
                    "Incidents",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
