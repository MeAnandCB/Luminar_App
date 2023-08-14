import 'package:flutter/material.dart';
import 'package:lumainar/app_config/app_config.dart';
import 'package:lumainar/global_widgets/list_tile_shimmer.dart';
import 'package:lumainar/presentation/demo_videos_list_screen/view/demo_videos_list_screen.dart';
import 'package:lumainar/presentation/video_player_Screen/view/video_player.dart';
import 'package:lumainar/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:provider/provider.dart';

class DemoVideosCourseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final demoVideosCourseList =
        Provider.of<HomeScreenController>(context).demoVideosCourseList;
    final provider = Provider.of<HomeScreenController>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount:
          demoVideosCourseList.isEmpty ? 10 : demoVideosCourseList.length,
      itemBuilder: (BuildContext context, int index) {
        return provider.isDemoVideosLoading
            ? ListTimeShimmer()
            : InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DemoVideosListScreen(
                            courseId: demoVideosCourseList[index].id.toString(),
                          )

                      // VideoPlayerScreen(
                      //     courseId: demoVideosList[index].id.toString()),
                      ));
                },
                child: Container(
                  height: 80,
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        AppConfig.finalUrl +
                            demoVideosCourseList[index]
                                .thumbnail!, // "assets/images/dp/thump.jpeg",
                        fit: BoxFit.cover,
                      ),
                      width: 80,
                      height: 60,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          demoVideosCourseList[index].title.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.fullscreen,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
      },
    );
  }
}
