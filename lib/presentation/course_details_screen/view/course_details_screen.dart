import 'package:flutter/material.dart';
import 'package:lumainar/presentation/course_details_screen/controller/courser_details_screen_controller.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../../guest_enroll_screen/guestErollScreen.dart';
import 'syllabus/syllabus.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.courseId});
  final String courseId;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider =
          Provider.of<CourseDetailsScreenController>(context, listen: false);
      provider.getCourseDetials(courseId: widget.courseId);

      // await provider.fetchInstagramPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CourseDetailsScreenController>(context);

    return Scaffold(
      body: provider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  provider.courseDetails?.title ?? "No Data",
                                  style: TextStyle(
                                      color: ColorConstants.lightGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * .40,
                            width: MediaQuery.of(context).size.width * .80,
                            child: Image.network(
                                "${provider.courseDetails?.thumbnail}")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        provider.courseDetails?.fullName ?? "No Data",
                        style: TextStyle(
                            color: ColorConstants.lightGrey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.5),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        provider.courseDetails?.description ?? "No Data",
                        style: TextStyle(
                          color: ColorConstants.lightGrey,
                          height: 1.7,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 240, 240),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(4, 6),
                              color: ColorConstants.lightGrey.withOpacity(.20),
                              blurRadius: 6,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          border:
                              Border.all(width: 1, color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Next Batch",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Cochin : ${provider.courseDetails?.cochin ?? "No Data"}",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Calicut :  ${provider.courseDetails?.calicut ?? "No Data"}",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Divider(
                              thickness: 2,
                            ),
                            Text(
                              "Duration",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              provider.courseDetails?.duration ?? "No Data",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Divider(
                              thickness: 2,
                            ),
                            Text(
                              "Course Fee",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Offline : ${provider.courseDetails?.offlineFees ?? "No Data"}",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Online : ${provider.courseDetails?.onlineFees ?? "No Data"}",
                              style: TextStyle(
                                  color: ColorConstants.iconsColor,
                                  height: 1.7,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Center(
                      //   child: Text(
                      //     "Our Syllabus",
                      //     style: TextStyle(
                      //         color: ColorConstants.iconsColor,
                      //         height: 1.7,
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // ),

                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Syllabus(
                                titile: provider
                                        .courseDetails?.modules?[index].modNo
                                        .toString() ??
                                    "N/a",
                                subtitile: provider.courseDetails
                                        ?.modules?[index].modHeading
                                        .toString() ??
                                    "No Data ",
                                description: provider.courseDetails
                                        ?.modules?[index].modDescription ??
                                    "No Data Found",
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                          itemCount:
                              provider.courseDetails?.modules?.length ?? 0)
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => GuestRegisterScreen()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: ColorConstants.iconsColor),
            child: Center(
              child: Text(
                "Block your seat",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
