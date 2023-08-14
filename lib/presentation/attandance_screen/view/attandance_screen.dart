import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../controller/attendance_screen_controller.dart';

class Attandance extends StatefulWidget {
  const Attandance({super.key});

  @override
  State<Attandance> createState() => _AttandanceState();
}

class _AttandanceState extends State<Attandance> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<AttendenceScreenController>(context, listen: false)
          .getAttedenceList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final attandencecreenprovider =
        Provider.of<AttendenceScreenController>(context);
    int value = attandencecreenprovider
        .attendenceScreenModel!.attendanceRecord!.classAttended!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Attendance",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: attandencecreenprovider.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      attandencecreenprovider.attendenceScreenModel
                              ?.attendanceRecord?.batchName ??
                          "",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Overall Batch Attandance",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: CircularPercentIndicator(
                              animation: true,
                              animationDuration: 2500,
                              radius: 200,
                              lineWidth: 15,
                              percent: (attandencecreenprovider
                                          .attendenceScreenModel
                                          ?.attendanceRecord
                                          ?.classAttended ??
                                      0) /
                                  100,
                              progressColor: ColorConstants.iconsColor,
                              backgroundColor: Colors.deepPurple.shade200,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Text(
                                value.toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.iconsColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorConstants.iconsColor,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.auto_stories,
                                color: ColorConstants.iconsColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Classes Attended ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    attandencecreenprovider
                                            .attendenceScreenModel
                                            ?.attendanceRecord
                                            ?.classAttended
                                            .toString() ??
                                        "ß",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.auto_stories,
                                color: ColorConstants.iconsColor,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Classes",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    attandencecreenprovider
                                            .attendenceScreenModel
                                            ?.attendanceRecord
                                            ?.totalClasses
                                            .toString() ??
                                        '',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 1,
                            color: ColorConstants.iconsColor,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Attendance this Month  (${attandencecreenprovider.attendenceScreenModel?.attendanceRecord?.batchName}) %",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            animationDuration: 2500,
                            lineHeight: 15,
                            percent: (attandencecreenprovider
                                        .attendenceScreenModel
                                        ?.attendanceRecord
                                        ?.classAttended ??
                                    0) /
                                100,
                            progressColor: ColorConstants.iconsColor,
                            backgroundColor: Colors.deepPurple.shade200,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
