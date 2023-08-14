import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';
import 'package:lumainar/presentation/class_screen/controller/batch_screen_controller.dart';
import 'package:provider/provider.dart';

class OngoingContainer extends StatefulWidget {
  const OngoingContainer({super.key});

  @override
  State<OngoingContainer> createState() => _OngoingContainerState();
}

class _OngoingContainerState extends State<OngoingContainer> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<BatchScreenController>(context, listen: false)
          .getBatchList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final batchscreenprovider = Provider.of<BatchScreenController>(context);
    return batchscreenprovider.isBatchsscreenLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: batchscreenprovider.batchList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 8),
                          color: ColorConstants.lightGrey.withOpacity(.20),
                          blurRadius: 6,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffEDE9EE),
                    ),
                    height: 120,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.dvr,
                                color: ColorConstants.iconsColor,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        batchscreenprovider
                                            .batchList[index].name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        batchscreenprovider
                                            .batchList[index].description,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox()
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Luminar Tecnolab",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                batchscreenprovider.batchList[index].offline ==
                                        true
                                    ? "Online"
                                    : "Offline",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: batchscreenprovider
                                                .batchList[index].offline ==
                                            false
                                        ? Colors.red
                                        : Colors.green),
                              ),
                            ],
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            });
  }
}
