import 'package:flutter/material.dart';
import 'package:lumainar/presentation/announcement_screen.dart/controller/announcement_screen_controller.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import 'widgets/announcement_container.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<AnnouncementScreenController>(context, listen: false)
          .getAnnouncementList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final announcementprovider =
        Provider.of<AnnouncementScreenController>(context);
    print(announcementprovider.announcementList);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Announcement",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: announcementprovider.isAnnouncementLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : SafeArea(
              child: Container(
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              announcementprovider.announcementList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnnouncementContainer(
                                name: announcementprovider
                                    .announcementList[index].title,
                                description: announcementprovider
                                    .announcementList[index].description,
                                date: announcementprovider
                                    .announcementList[index].date);
                          }),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
