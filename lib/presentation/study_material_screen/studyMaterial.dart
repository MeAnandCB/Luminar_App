import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class StudyMaterial extends StatelessWidget {
  const StudyMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Study Materials",
          style: TextStyle(
              color: ColorConstants.iconsColor, fontWeight: FontWeight.bold),
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
              SizedBox(
                height: 200,
              ),
              Column(
                children: [
                  Center(
                    child: Icon(
                      Icons.speaker_notes_off,
                      color: ColorConstants.iconsColor,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "No Data available",
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
