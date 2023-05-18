import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/assets_path.dart';
import '../home_screen/home_screen.dart';
import 'incident_details.dart';

class IncidentList extends StatefulWidget {
  const IncidentList({super.key});

  @override
  State<IncidentList> createState() => _IncidentListState();
}

class _IncidentListState extends State<IncidentList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          foregroundColor: Colors.grey,
          title: Text(
            "Project ID : 127",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImagesPath.sorIcon,
              fit: BoxFit.fill,
              width: width,
              height: 60.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Project ID : 127 ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1.h,
                        color: Colors.black,
                      );
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: ListTile(
                          tileColor: selectedIndex == index
                              ? Colors.grey.shade300
                              : Colors.transparent,
                          leading: Image.asset(
                              "assets/icons/png/home-mystatus-icon.png"),
                          title: Text(
                            "Project 1",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "When : ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                  Text(
                                    "16/05/2023",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Created By : ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                  Text(
                                    "Amjad Ali",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Distance : ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                  Text(
                                    "20KM",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return IncidentDetails();
                              }));
                            },
                            child: FaIcon(
                              FontAwesomeIcons.anglesRight,
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
