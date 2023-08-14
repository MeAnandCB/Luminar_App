import 'package:flutter/material.dart';
import 'package:lumainar/app_config/app_config.dart';
import 'package:lumainar/presentation/demo_videos_list_screen/controller/demo_videos_list_screen_controller.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../../video_player_Screen/view/video_player.dart';

class DemoVideosListScreen extends StatefulWidget {
  const DemoVideosListScreen({
    required this.courseId,
    super.key,
  });
  final String courseId;
  @override
  State<DemoVideosListScreen> createState() => _DemoVideosListScreenState();
}

class _DemoVideosListScreenState extends State<DemoVideosListScreen> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider =
          Provider.of<DemoVideoListScreenController>(context, listen: false);

      await provider.getDemoVideoList(courseId: widget.courseId);

      // await provider.fetchInstagramPosts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DemoVideoListScreenController>(context);
    return Scaffold(
      body: provider.isDemoVideosLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
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
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Demo Videos',
                                style: TextStyle(
                                    color: ColorConstants.lightGrey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: (provider.demoVideoListRestModel.videos == null ||
                              provider.demoVideoListRestModel.videos!.isEmpty)
                          ? Center(
                              child: Text("No Data Found"),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: provider
                                      .demoVideoListRestModel.videos?.length ??
                                  0,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VideoPlayerScreen(
                                                  videUrl: provider
                                                          .demoVideoListRestModel
                                                          .videos![index]
                                                          .videoLink ??
                                                      "",
                                                )));
                                  },
                                  child: Container(
                                    height: 80,
                                    child: ListTile(
                                      leading: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(AppConfig
                                                        .finalUrl +
                                                    (provider
                                                            .demoVideoListRestModel
                                                            .thumbnail ??
                                                        "")),
                                                fit: BoxFit.cover)),
                                        width: 80,
                                        height: 60,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            provider.demoVideoListRestModel
                                                    .videos![index].name ??
                                                "N/a",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 110,
                                                child: Text(
                                                  provider
                                                          .demoVideoListRestModel
                                                          .videos![index]
                                                          .description ??
                                                      "N/a",
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                              Text(
                                                provider
                                                        .demoVideoListRestModel
                                                        .videos![index]
                                                        .uploadedDate ??
                                                    "",

                                                //         !=
                                                //     null
                                                // ? DateFormat("dd-MM-yyyy")
                                                //     .format(DateTime.parse(
                                                //         provider
                                                //             .demoVideoListRestModel
                                                //             .videos![index]
                                                //             .uploadedDate!))
                                                // :
                                                // '',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          )
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
                            )),
                ],
              ),
            ),
    );
  }
}
