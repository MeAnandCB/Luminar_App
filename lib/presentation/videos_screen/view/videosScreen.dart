import 'package:flutter/material.dart';
import 'package:lumainar/app_config/app_config.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../controller/demo_screen_controller.dart';

class VideoClassScreen extends StatefulWidget {
  const VideoClassScreen({super.key});

  @override
  State<VideoClassScreen> createState() => _VideoClassScreenState();
}

class _VideoClassScreenState extends State<VideoClassScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<DemovideoController>(context, listen: false)
          .getDemoVideosList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final demoVideolList =
        Provider.of<DemovideoController>(context).demovideoList;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Text(
                          'Video Screen',
                          style: TextStyle(
                              color: ColorConstants.lightGrey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
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
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/dp/istockphoto-1252447446-170667a.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(AppConfig.finalUrl +
                                      (demoVideolList[index].thumbnail ?? "")),
                                  fit: BoxFit.cover)),
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
                              demoVideolList[index].description,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Dart, widgets, intro",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "20-01-2023",
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
