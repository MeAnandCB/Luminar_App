import 'package:flutter/material.dart';
import 'package:lumainar/core/constants/colors.dart';

class LiveClasscontainer extends StatelessWidget {
  final subject;
  final teacherName;
  final mode;
  final time;
  const LiveClasscontainer(
      {super.key,
      required this.teacherName,
      required this.subject,
      required this.mode,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.iconsColor),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          subject,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Text(
                          teacherName,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      time,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Text(
                      mode,
                      style: TextStyle(
                          fontSize: 18,
                          color:
                              (mode == "Online") ? Colors.green : Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: ColorConstants.iconsColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 30,
                    width: 130,
                    child: Image.asset("assets/images/dp/123.png")),
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstants.iconsColor,
                  ),
                  child: Center(
                      child: Text(
                    "Join Now",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
