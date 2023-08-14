import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lumainar/presentation/overview_Screen/controller/overview_screen_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<OverviewScreenController>(context, listen: false)
          .getOverviewDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final overviewscreenData = Provider.of<OverviewScreenController>(context);
    print(overviewscreenData.overviewData);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "OverView",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: overviewscreenData.isOverviewsscreenLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : SafeArea(
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        overviewscreenData.overviewData?.courseName ?? '',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: ColorConstants.iconsColor,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Batch Start Date",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          overviewscreenData.overviewData
                                                      ?.startDate !=
                                                  null
                                              ? DateFormat("dd-MM-yyyy").format(
                                                  overviewscreenData
                                                      .overviewData!.startDate)
                                              : '',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(),
                                Column(
                                  children: [
                                    Text(
                                      "Batch Code",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      overviewscreenData
                                              .overviewData?.batchCode ??
                                          "".toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox()
                              ],
                            ),
                            SizedBox(
                              height: 15,
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
                                      "Course",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      overviewscreenData
                                              .overviewData?.courseName ??
                                          "",
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
                            Divider(
                              thickness: 1,
                              color: ColorConstants.iconsColor,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.format_list_bulleted,
                                  color: ColorConstants.iconsColor,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Subjects",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          overviewscreenData.overviewData?.subjects.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                overviewscreenData
                                        .overviewData?.subjects[index] ??
                                    '',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            )),
    );
  }
}
