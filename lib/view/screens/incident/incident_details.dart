import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'map_screen.dart';

class IncidentDetails extends StatefulWidget {
  const IncidentDetails({super.key});

  @override
  State<IncidentDetails> createState() => _IncidentDetailsState();
}

class _IncidentDetailsState extends State<IncidentDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        title: Text(
          "Amjad Ali",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/icons/png/download.png",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Code : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Type : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Created : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Reason : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Disposition : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Incident Status : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Created By : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Created By User : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Last Update : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Offline Descriptor : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "isSIOI : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Latitude : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Langitude : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "UUID : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Radius : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "State : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Count : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Media Count : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Project ID : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  Text(
                    "Incident Project Id : 123",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ))
          ]),
    ));
  }
}
