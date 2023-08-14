import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/image_constants.dart';
import 'package:lumainar/presentation/announcement_screen.dart/controller/announcement_screen_controller.dart';
import 'package:lumainar/presentation/announcement_screen.dart/view/announcement_screen.dart';
import 'package:lumainar/presentation/demo_videos_list_screen/view/demo_videos_list_screen.dart';
import 'package:lumainar/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:lumainar/presentation/personal_details_screen/personal_detials_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../../../global_widgets/PlacementContainer.dart';
import 'wiget/demo_video_course_list_view.dart';
import 'wiget/home_screen_course_list_widget.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({
    super.key,
  });

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override

  // here  is the init state

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeScreenProvider =
          Provider.of<HomeScreenController>(context, listen: false);
      homeScreenProvider.getCourseList();
      homeScreenProvider.fetchInstagramPosts();
      homeScreenProvider.getDemoVideoList();

      await Provider.of<AnnouncementScreenController>(context, listen: false)
          .getAnnouncementList();
      ;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final announcementProvider =
        Provider.of<AnnouncementScreenController>(context);

    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
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
                            'Your Coding',
                            style: TextStyle(
                                color: ColorConstants.textColorblack,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Adventure Begins Here!',
                            style: TextStyle(
                                color: ColorConstants.textColorblack,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AnnouncementScreen()));
                            },
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.notifications_active_outlined,
                                    size: 30,
                                    color: ColorConstants.iconsColor,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10,
                                    child: Text(
                                      announcementProvider
                                          .announcementList.length
                                          .toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalDetailsScreen(),
                                  ));
                            },
                            child: CircleAvatar(
                                radius: 25, backgroundImage: imageConstants[0]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //   SearchBarContainer(),
                SizedBox(
                  height: 15,
                ),
                //widget to show placement containers

                PlacementContainer(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Course",
                  style: TextStyle(
                      color: ColorConstants.textColorblack,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),

                // widget to show available course list
                HomeScreenCourseListWidget(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Demo Classes",
                  style: TextStyle(
                      color: ColorConstants.lightGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 2,
                  color: ColorConstants.tdGrey,
                ),
// widget to show availabel demo videos course list

                DemoVideosCourseListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
