import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import 'live_Class_Widgets/liveClasscontainer.dart';

class LiveClass extends StatelessWidget {
  const LiveClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Live Class",
          style: TextStyle(color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  LiveClasscontainer(
                      subject: "Widgets",
                      teacherName: "Sreedevi ",
                      mode: "Online",
                      time: "9:30 AM")
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
