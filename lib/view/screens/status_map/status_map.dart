import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/assets_path.dart';

class StatusMapScreen extends StatefulWidget {
  const StatusMapScreen({super.key});

  @override
  State<StatusMapScreen> createState() => _StatusMapScreenState();
}

class _StatusMapScreenState extends State<StatusMapScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.grey,
          title: Text(
            "Status Map",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    ImagesPath.sorIcon,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: 60.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Text(
                      "Status Map",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Image.asset(
                  "assets/icons/png/full_map.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
