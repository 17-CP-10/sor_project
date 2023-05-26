import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotonresponse/data/Models/project_list_model.dart';
import 'package:spotonresponse/data/UserApi/user_api.dart';
import 'package:spotonresponse/main.dart';

import '../../../data/assets_path.dart';
import '../home_screen/home_screen.dart';

class ProjectSelectionScreen extends StatefulWidget {
  const ProjectSelectionScreen({super.key});

  @override
  State<ProjectSelectionScreen> createState() => _ProjectSelectionScreenState();
}

class _ProjectSelectionScreenState extends State<ProjectSelectionScreen> {
  bool loading = true;
  ProjectListModel? projectListModel;
  @override
  void initState() {
    getProjectList();
    super.initState();
  }

  getProjectList() {
    Future.delayed(Duration(milliseconds: 500), () async {
      await UserApi.fetchProjects().then((value) {
        if (value != null) {
          setState(() {
            loading = false;
            projectListModel = value;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              "Project Selection",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : projectListModel?.data?.isEmpty == true ||
                            projectListModel == null
                        ? Center(
                            child: Text("No project found "),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50.w),
                                child: Container(
                                  height: 1.h,
                                  color: Colors.black,
                                ),
                              );
                            },
                            itemCount: projectListModel?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      "Project ID : ",
                                      style: TextStyle(
                                          fontSize: 18.sp, color: Colors.grey),
                                    ),
                                    Text(
                                      "${projectListModel?.data?[index].projectid ?? 0}",
                                      style: TextStyle(
                                          fontSize: 18.sp, color: Colors.black),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      "Project Name : ",
                                      style: TextStyle(
                                          fontSize: 18.sp, color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${projectListModel?.data?[index].name ?? ""}",
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    // prefs?.clear();
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return HomeScreen(
                                        projectDetails:
                                            projectListModel?.data?[index] ??
                                                ProjectDetails(),
                                      );
                                    }));
                                  },
                                  child: const FaIcon(
                                    FontAwesomeIcons.arrowRight,
                                    color: Colors.black,
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
