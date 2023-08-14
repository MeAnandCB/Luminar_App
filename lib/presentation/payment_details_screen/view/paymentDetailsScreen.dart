import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            fontSize: 18,
            color: ColorConstants.iconsColor,
            fontWeight: FontWeight.bold),
        title: Text("Job Portal"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentDetails1(),
            PaymentDetails1(),
          ],
        ),
      ),
    );
  }
}

class PaymentDetails1 extends StatelessWidget {
  const PaymentDetails1({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle jobDetailsTilteTextStyle = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: ColorConstants.lightGrey);
    TextStyle jobDetailsValueTextStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.w500);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 6),
              color: ColorConstants.lightGrey.withOpacity(.20),
              blurRadius: 6,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage('assets/images/course_image/android1.png'),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admission Fee',
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorConstants.iconsColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(
                            width: 75,
                            child: Row(
                              children: [
                                Text("Mode", style: jobDetailsTilteTextStyle),
                                Text(":  "),
                              ],
                            ),
                          ),
                          Text(
                            "GooglePay",
                            style: jobDetailsValueTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 75,
                            child: Row(
                              children: [
                                Text("Date", style: jobDetailsTilteTextStyle),
                                Text(":  "),
                              ],
                            ),
                          ),
                          Text(
                            "02-07-2023",
                            style: jobDetailsValueTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: jobDetailsValueTextStyle,
                    ),
                    Text(
                      "1000 /-",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Receipt Number : #1125145751",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500])),
              Container(
                height: 30,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstants.iconsColor),
                child: Center(
                  child: Text(
                    "Download",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
