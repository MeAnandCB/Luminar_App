import 'package:flutter/material.dart';
import 'package:lumainar/presentation/assignment_screen/controller/assignment_screen_controller.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import 'widgets/assignmentInfo_container.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<AssignmentScreenController>(context, listen: false)
          .geAssignmentList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assignmentscreenprovider =
        Provider.of<AssignmentScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Assignment",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: assignmentscreenprovider.isAssignmentscreenLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : SafeArea(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "FLT-Nov22-B1-Sreedevi",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            assignmentscreenprovider.assignmentList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AssignmentContainer(
                            name: assignmentscreenprovider
                                .assignmentList[index].taskName,
                            status: assignmentscreenprovider
                                .assignmentList[index].status,
                            duedate: assignmentscreenprovider
                                .assignmentList[index].date
                                .toString()
                                .substring(0, 10),
                            time: assignmentscreenprovider
                                .assignmentList[index].time
                                .substring(0, 5),
                          );
                        }),
                  ))
                ],
              ),
            )),
    );
  }
}
