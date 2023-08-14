import 'package:flutter/material.dart';
import 'package:lumainar/app_config/app_config.dart';
import 'package:lumainar/global_widgets/loading_shimmer_skeleton.dart';
import 'package:lumainar/presentation/course_details_screen/view/course_details_screen.dart';
import 'package:lumainar/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

class HomeScreenCourseListWidget extends StatefulWidget {
  const HomeScreenCourseListWidget({super.key});
  @override
  State<HomeScreenCourseListWidget> createState() =>
      _HomeScreenCourseListWidgetState();
}

class _HomeScreenCourseListWidgetState
    extends State<HomeScreenCourseListWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeScreenController>(context);

    return Container(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            provider.courseList.isEmpty ? 10 : provider.courseList.length,
        itemBuilder: (BuildContext context, int index) {
          return provider.isCoursesLoading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShimmerSkeleton(
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(height: 10),
                      ShimmerSkeleton(
                        height: 10,
                        width: 80,
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CourseDetailsScreen(
                              courseId:
                                  provider.courseList[index].id.toString(),
                            )));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 100,
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(AppConfig.finalUrl +
                                    provider.courseList[index].thumbnail)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 80,
                      //   width: 80,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: CachedNetworkImage(
                      //     imageUrl: AppConfig.finalUrl +
                      //         provider.courseList[index].thumbnail,
                      //     placeholder: (context, url) => ShimmerSkeleton(
                      //       height: 60,
                      //       width: 60,
                      //     ),
                      //     errorWidget: (context, url, error) =>
                      //         Image.asset('assets/images/banner/banner.jpg'),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SizedBox(
                          width: 80,
                          child: Center(
                            child: Text(
                              provider.courseList[index].title.toUpperCase(),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 14, 14, 14),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
